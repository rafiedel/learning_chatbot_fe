part of '_cubit.dart';

@injectable
class ChatbotCubit extends Cubit<ChatbotState>{
  VoidCallback? _chatScrollListener;

  final GetSessionsUsecase _getSessionsUsecase;
  final GetMessagesUsecase _getMessagesUsecase;

  ChatbotCubit(
    this._getSessionsUsecase,
    this._getMessagesUsecase,
  ) : super(ChatbotState());

  Future<void> openSymbolKeyboard(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FractionallySizedBox(
        heightFactor: 0.80,
        child: SymbolSheete(initial: state.titleSearchController.text)
      ),
    );

    if (result != null) {
      emit(
        state.copyWith(
        titleSearchController: state.titleSearchController
          ..text = result
          ..selection = TextSelection.collapsed(offset: result.length))
      );
    }
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
      page: 1, 
    );
    final resp = await _getSessionsUsecase.execute(params);

    resp.fold(
      (left) {
      
      }, (right) {
        List<GroupChatModel> groupChats = right!.data;
        emit(state.copyWith(groupChatList: groupChats));
      }
    );
  }

  Future<void> getChatsByGroupChatId(int id) async {
    final params = GetMessagesParams(
      sessionId: id
    );
    final resp = await _getMessagesUsecase.execute(params);

    resp.fold(
      (left) {
      
      }, (right) {
        List<ChatModel> chats = right!.data;
        emit(state.copyWith(chatList: chats));
      }
    );
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

    final resp = await _getMessagesUsecase.execute(params);

    resp.fold(
      (left) {
        // Handle error if needed
      },
      (right) {
        final newChats = right?.data ?? [];
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



}