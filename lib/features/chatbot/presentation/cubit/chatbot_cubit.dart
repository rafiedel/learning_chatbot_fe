part of '_cubit.dart';

@injectable
class ChatbotCubit extends Cubit<ChatbotState>{
  VoidCallback? _chatScrollListener;
  VoidCallback? _groupChatScrollListener;
  ImagePicker? _imagePicker;

  final GetSessionsUsecase _getSessionsUsecase;
  final GetMessagesUsecase _getMessagesUsecase;
  final DeleteSessionUsecase _deleteSessionUsecase;
  final RenameSessionUsecase _renameSessionUsecase;
  final CompletionsUsecase _completionsUsecase;

  ChatbotCubit(
    this._getSessionsUsecase,
    this._getMessagesUsecase,
    this._deleteSessionUsecase,
    this._renameSessionUsecase,
    this._completionsUsecase,
  ) : super(ChatbotState());

  void initImagePickerService() {
    _imagePicker = ImagePicker();
  }

  void initNewChatController() {
    state.newChatController.addListener(_onNewChatTextChanged);
  }

  void initGroupChatScrollController() {
    _groupChatScrollListener = () async {
      if (state.groupChatScrollController.position.pixels >=
              state.groupChatScrollController.position.maxScrollExtent - 100 &&
          !state.isCannotLoadMoreGroupChat) {
        await loadMoreGroupChats();
      }
    };

    state.groupChatScrollController.addListener(_groupChatScrollListener!);
  }

  void attachGroupChatScrollListener() {
    if (_groupChatScrollListener != null &&
        // ignore: invalid_use_of_protected_member
        !state.groupChatScrollController.hasListeners) {
      state.groupChatScrollController.addListener(_groupChatScrollListener!);
    }
  }

  void detachGroupChatScrollListener() {
    if (_groupChatScrollListener != null) {
      state.groupChatScrollController.removeListener(_groupChatScrollListener!);
    }
  }

  Future<void> loadMoreGroupChats() async {
    detachGroupChatScrollListener();

    final firstGroup = state.groupChatList.isNotEmpty
        ? state.groupChatList.last
        : null;
    LoggerService.e(firstGroup!.id);

    final oldScrollHeight =
        state.groupChatScrollController.position.maxScrollExtent;
    final oldOffset = state.groupChatScrollController.offset;

    final params = GetSessionsParams(
      title: state.titleSearchController.text,
      beforeId: firstGroup.id, // Load older items
    );

    emit(state.copyWith(
      isLoadingGroupChats: true,
      isError: false
    ));

    final resp = await _getSessionsUsecase.execute(params);

    resp.fold(
      (left) {
        // Handle error
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      },
      (right) {
        List<GroupChatModel> newGroups = [];
        for (var i in right?.data['results']) {
          newGroups.add(GroupChatModel.fromJson(i));
        }
        if (newGroups.isEmpty) {
          emit(state.copyWith(isCannotLoadMoreGroupChat: true));
        } else {
          emit(state.copyWith(
            groupChatList: [...state.groupChatList,...newGroups],
          ));
        }
      },
    );

    emit(state.copyWith(
      isLoadingGroupChats: false,
      isError: false
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.groupChatScrollController.hasClients) {
        final newScrollHeight =
            state.groupChatScrollController.position.maxScrollExtent;
        final scrollDifference = newScrollHeight - oldScrollHeight;
        state.groupChatScrollController.jumpTo(oldOffset + scrollDifference);
      }
      attachGroupChatScrollListener();
    });
  }



  void _onNewChatTextChanged() {
    // Create a TextPainter to measure text
    final textSpan = TextSpan(
      text: state.newChatController.text,
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 5,
    );

    textPainter.layout(maxWidth: 300); // adjust maxWidth to your TextField width

    final lineCount = textPainter.computeLineMetrics().length;

    emit(state.copyWith(
      isNewChatController3Lines: lineCount >= 3,
    ));
  }


  Future<void> openSymbolKeyboard(String result) async {
    emit(
      state.copyWith(
      newChatController: state.newChatController
        ..text = result
        ..selection = TextSelection.collapsed(offset: result.length))
    );
  }

  Future<void> setIsDrawerOpen(bool newIsDrawerOpen) async {
    emit(
      state.copyWith(
        isDrawerOpen: newIsDrawerOpen
      )
    );
  }

  Future<void> getGroupChats() async {
    final params = GetSessionsParams(
      title: state.titleSearchController.text
    );

    emit(state.copyWith(
      isLoadingGroupChats: true,
      isError: false
    ));

    final resp = await _getSessionsUsecase.execute(params);

    resp.fold(
      (left) {
        if (kDebugMode) {
          LoggerService.e('${left.code} : ${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      
      }, (right) {
        List<GroupChatModel> groupChats = [];
        for (var i in right?.data['results']) {
          groupChats.add(GroupChatModel.fromJson(i));
        }
        emit(state.copyWith(groupChatList: groupChats));
      }
    );

    emit(state.copyWith(
      isLoadingGroupChats: false,
      isError: false
    ));
  }

  Future<void> getChatsByGroupChatId(int id) async {
    final params = GetMessagesParams(
      sessionId: id
    );

    emit(state.copyWith(
      isLoadingChats: true,
      isError: false,
      chatList: []
    ));

    final resp = await _getMessagesUsecase.execute(params);

    resp.fold(
      (left) {
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      }, (right) {
        List<ChatModel> chats = [];
        for (var i in right?.data['results']) {
          chats.add(ChatModel.fromJson(i));
        }
        emit(state.copyWith(chatList: chats));
      }
    );

    emit(state.copyWith(
      isLoadingChats: false,
      isError: false
    ));
  }

  Future<void> makeNewGroupChat() async {
    emit(state.copyWith(
      selectedGroupChatId: 0,
      chatList: [],
      isCannotLoadMoreChat: true
    ));
  }

  Future<void> chooseGroupChat(int id) async {
    emit(state.copyWith(
      selectedGroupChatId: id,
      isCannotLoadMoreChat: false,
    ));

    detachChatScrollListener();
    LoggerService.d('Chat loaded : ${state.chatList.length}');
    await getChatsByGroupChatId(id);
    LoggerService.d('Chat loaded : ${state.chatList.length}');

    jumpScrollControllerToFinish();

    attachChatScrollListener();
  }


  Future<void> onTitleGroupChatSearch() async {
    Timer(const Duration(milliseconds: 2000), () {
      emit(state.copyWith(isCannotLoadMoreGroupChat: false));
      attachGroupChatScrollListener();
      getGroupChats();
    });
  }

  void initChatScrollController() {
    _chatScrollListener = () async {
      if (state.chatScrollController.position.pixels <=
              state.chatScrollController.position.minScrollExtent + 50 &&
          !state.isCannotLoadMoreChat &&
          state.selectedGroupChatId != null) {
        await loadMoreChats();
      }
    };

    state.chatScrollController.addListener(_chatScrollListener!);

    jumpScrollControllerToFinish();
  }

  void attachChatScrollListener() {
    if (_chatScrollListener != null &&
        // ignore: invalid_use_of_protected_member
        !state.chatScrollController.hasListeners) {
      state.chatScrollController.addListener(_chatScrollListener!);
    }
  }

  void detachChatScrollListener() {
    if (_chatScrollListener != null) {
      state.chatScrollController.removeListener(_chatScrollListener!);
    }
  }

  Future<void> loadMoreChats() async {
    detachChatScrollListener();

    final firstMessage = state.chatList.isNotEmpty ? state.chatList[0] : null;
    if (firstMessage == null) {
      attachChatScrollListener();
      return;
    }

    // Record current scroll offset from bottom
    final oldScrollHeight = state.chatScrollController.position.maxScrollExtent;
    final oldOffset = state.chatScrollController.offset;

    final params = GetMessagesParams(
      sessionId: state.selectedGroupChatId!,
      beforeId: firstMessage.id,
    );

    emit(state.copyWith(
      isLoadingChats: true,
      isError: false
    ));

    final resp = await _getMessagesUsecase.execute(params);

    resp.fold(
      (left) {
        // Handle error if needed
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      },
      (right) {
        List<ChatModel> newChats = [];
        for (var i in right?.data['results']) {
          newChats.add(ChatModel.fromJson(i));
        }
        if (newChats.isEmpty) {
          emit(state.copyWith(isCannotLoadMoreChat: true));
        } else {
          emit(state.copyWith(
            chatList: [...newChats, ...state.chatList],
          ));
        }
      },
    );

    LoggerService.d('Chat loaded : ${state.chatList.length}');

    emit(state.copyWith(
      isLoadingChats: false,
      isError: false
    ));

    // After the new messages are added and rendered:
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.chatScrollController.hasClients) {
        final newScrollHeight = state.chatScrollController.position.maxScrollExtent;
        final scrollDifference = newScrollHeight - oldScrollHeight;

        // Adjust the scroll position to maintain previous visible content
        state.chatScrollController.jumpTo(oldOffset + scrollDifference);
      }
      attachChatScrollListener();
    });
  }



  void jumpScrollControllerToFinish() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.chatScrollController.hasClients) {
        state.chatScrollController.jumpTo(
          state.chatScrollController.position.maxScrollExtent,
        );
      }
    });
  }

  Future<void> deleteGroupChatById(int id) async{
    final params = DeleteSessionParams(
      sessionId: id
    );
    final resp = await _deleteSessionUsecase.execute(params);

    resp.fold(
      (left) {
        // Handle error
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      },
      (right) {
        final newGroupChatList = state.groupChatList.where(
          (e) => e.id != id,
        ).toList();
        emit(state.copyWith(
          groupChatList: newGroupChatList
        ));
      },
    );
  }

  Future<void> renameGroupChatById(int id, String newTitle) async{
    final params = RenameSessionParams(
      sessionId: id,
      newTitle: newTitle
    );
    final resp = await _renameSessionUsecase.execute(params);

    resp.fold(
      (left) {
        // Handle error
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      },
      (right) {
        final newGroupChatList = state.groupChatList.map(
          (e) {
            if (e.id == id) {
              return GroupChatModel(
                id: id,
                title: newTitle,
                createdAt: e.createdAt,
              );
            }
            return e;
          },
        ).toList();

        emit(state.copyWith(
          groupChatList: newGroupChatList
        ));
      },
    );
  }

  Future<void> pickImage() async {
    await _handleImageSelection(ImageSource.gallery);
  }

  Future<void> takePhoto() async {
    await _handleImageSelection(ImageSource.camera);
  }

  Future<void> _handleImageSelection(ImageSource source) async {
    final pickedImg = await _imagePicker?.pickImage(source: source);

    if (pickedImg == null) {
      // User canceled picking
      return;
    }

    final fileSizeInBytes = await pickedImg.length();
    final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    if (fileSizeInMB > 5) {
      emit(state.copyWith(isImageSizeTooBig: true));
      return;
    }

    final croppedFile = await _cropImage(File(pickedImg.path));

    if (croppedFile == null) {
      // User canceled cropping
      return;
    }

    setImage(croppedFile);
    emit(state.copyWith(isImageSizeTooBig: false));
  }

  Future<File?> _cropImage(File imageFile) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Photo',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: Colors.grey.shade600,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
          minimumAspectRatio: 1,
          aspectRatioLockEnabled: false,
        ),
      ],
    );

    if (croppedImage == null) return null;

    return File(croppedImage.path);
  }

  void setImage(File newFile) {
    emit(state.copyWith(imageFile: newFile));
  }

  Future<void> onSubmitNewChat() async{
    List<ChatModel> newChatList = List<ChatModel>.from(state.chatList)
          ..add(ChatModel(
            id: 10000, role: "user", 
            content: state.newChatController.text, 
            timestamp: DateTime.timestamp(), 
            imageUrl: ""
            ));
    emit(state.copyWith(
      chatList: newChatList
    ));

    Future.delayed(const Duration(milliseconds: 100), () {
        if (state.chatScrollController.hasClients) {
          state.chatScrollController.animateTo(
            state.chatScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

    final params = CompletionsParams(
      sessionId: state.selectedGroupChatId,
      content: state.newChatController.text,
      imageData: state.imageFile
    );

    state.newChatController.clear();

    emit(state.copyWith(
      isLoading: true,
      isError: false
    ));

    final resp = await _completionsUsecase.execute(params);

    newChatList = List<ChatModel>.from(newChatList)
          ..removeLast();
    emit(state.copyWith(
      chatList: newChatList
    ));

    resp.fold(
      (left) {
        if (kDebugMode) {
          LoggerService.e('${left.code}\n${left.message}');
        }
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: '${left.code} : ${left.message}'
        ));
      },
      (right) {
        final data = right!.data;
        
        final newGroupChat = GroupChatModel.fromJson(data['session']);
        List<GroupChatModel> newGroupChatList = [];
        if (newGroupChat.id != state.selectedGroupChatId) {
          newGroupChatList = [
            newGroupChat,
            ...state.groupChatList,
          ];
        } else {
          newGroupChatList = state.groupChatList;
        }
  
        final newChatList = List<ChatModel>.from(state.chatList)
          ..addAll([
            ChatModel.fromJson(data['user_message']),
            ChatModel.fromJson(data['assistant_message']),
          ]);

        emit(state.copyWith(
          isLoading: false,
          isError: false
        ));

        emit(state.copyWith(
          groupChatList: newGroupChatList,
          chatList: newChatList,
          selectedGroupChatId: newGroupChat.id,
          imageFile: null
        ));

        Future.delayed(const Duration(milliseconds: 100), () {
          if (state.chatScrollController.hasClients) {
            state.chatScrollController.animateTo(
              state.chatScrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 4000),
              curve: Curves.easeOut,
            );
          }
        });

      },
    );
  }

}