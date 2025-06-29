part of '_cubit.dart';

class ChatbotState extends Equatable {
  static const _sentinel = Object();

  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final bool isDrawerOpen;
  final bool isCannotLoadMoreChat;
  final bool isCannotLoadMoreGroupChat;
  final bool isImageSizeTooBig;
  final bool isNewChatController3Lines;
  final bool isLoadingChats;
  final bool isLoadingGroupChats;
  final bool failToSendChat; 
  final String errorMessage;
  final File? imageFile;
  final List<ChatModel> chatList;
  final List<GroupChatModel> groupChatList;
  final int? selectedGroupChatId;
  final ScrollController chatScrollController;
  final ScrollController groupChatScrollController;
  final Timer debounce;
  final TextEditingController titleSearchController;
  final TextEditingController newChatController;

  ChatbotState({
    this.isLoading = false,
    this.isLoaded = false,
    this.isError = false,
    this.isDrawerOpen = false,
    this.isCannotLoadMoreGroupChat = false,
    this.isCannotLoadMoreChat = false,
    this.isImageSizeTooBig = false,
    this.isNewChatController3Lines = false,
    this.isLoadingChats = false,
    this.isLoadingGroupChats = false,
    this.failToSendChat = false,
    this.errorMessage = "",
    this.imageFile,
    this.chatList = const [],
    this.groupChatList = const [],
    this.selectedGroupChatId = 0,
    TextEditingController? titleSearchController,
    TextEditingController? newChatController,
    ScrollController? chatScrollController,
    ScrollController? groupChatScrollController,
    Timer? debounce,
  })  : chatScrollController = chatScrollController ?? ScrollController(),
        groupChatScrollController = groupChatScrollController ?? ScrollController(),
        debounce = debounce ?? Timer(Duration.zero, () {}),
        titleSearchController = titleSearchController ?? TextEditingController(),
        newChatController = newChatController ?? TextEditingController();

  ChatbotState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    bool? isDrawerOpen,
    bool? isCannotLoadMoreChat,
    bool? isCannotLoadMoreGroupChat,
    bool? isImageSizeTooBig,
    bool? isNewChatController3Lines,
    bool? isLoadingChats,
    bool? isLoadingGroupChats,
    bool? failToSendChat, 
    String? errorMessage,
    Object? imageFile = _sentinel,
    List<ChatModel>? chatList,
    List<GroupChatModel>? groupChatList,
    int? selectedGroupChatId,
    TextEditingController? titleSearchController,
    TextEditingController? newChatController,
    ScrollController? chatScrollController,
    ScrollController? groupChatScrollController,
    Timer? debounce,
  }) {
    return ChatbotState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      isCannotLoadMoreGroupChat: isCannotLoadMoreGroupChat ?? this.isCannotLoadMoreGroupChat,
      isCannotLoadMoreChat: isCannotLoadMoreChat ?? this.isCannotLoadMoreChat,
      isImageSizeTooBig: isImageSizeTooBig ?? this.isImageSizeTooBig,
      isNewChatController3Lines: isNewChatController3Lines ?? this.isNewChatController3Lines,
      isLoadingChats: isLoadingChats ?? this.isLoadingChats,
      isLoadingGroupChats: isLoadingGroupChats ?? this.isLoadingGroupChats,
      failToSendChat: failToSendChat ?? this.failToSendChat, 
      errorMessage: errorMessage ?? this.errorMessage,
      imageFile: imageFile == _sentinel ? this.imageFile : imageFile as File?,
      chatList: chatList ?? this.chatList,
      groupChatList: groupChatList ?? this.groupChatList,
      selectedGroupChatId: selectedGroupChatId ?? this.selectedGroupChatId,
      titleSearchController: titleSearchController ?? this.titleSearchController,
      newChatController: newChatController ?? this.newChatController,
      chatScrollController: chatScrollController ?? this.chatScrollController,
      groupChatScrollController: groupChatScrollController ?? this.groupChatScrollController,
      debounce: debounce ?? this.debounce,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        isError,
        isDrawerOpen,
        isCannotLoadMoreGroupChat,
        isCannotLoadMoreChat,
        isImageSizeTooBig,
        isNewChatController3Lines,
        isLoadingChats,
        isLoadingGroupChats,
        failToSendChat, 
        errorMessage,
        imageFile,
        chatList,
        groupChatList,
        selectedGroupChatId,
        titleSearchController,
        newChatController,
        chatScrollController,
        groupChatScrollController,
        debounce,
      ];
}
