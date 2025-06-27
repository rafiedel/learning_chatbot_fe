part of '_cubit.dart';

class ChatbotState extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final bool isDrawerOpen;
  final bool isCannotLoadMoreChat; // New flag
  final List<ChatModel> chatList;
  final List<GroupChatModel> groupChatList;
  final int chatPage;
  final int groupChatPage;
  final int? selectedGroupChatId;
  final ScrollController chatScrollController;
  final ScrollController groupChatScrollController;
  final Timer debounce;
  final TextEditingController titleSearchController;

  ChatbotState({
    this.isLoading = false,
    this.isLoaded = false,
    this.isError = false,
    this.isDrawerOpen = false,
    this.isCannotLoadMoreChat = false, // default
    this.chatList = const [],
    this.groupChatList = const [],
    this.chatPage = 1,
    this.groupChatPage = 1,
    this.selectedGroupChatId,
    TextEditingController? titleSearchController,
    ScrollController? chatScrollController,
    ScrollController? groupChatScrollController,
    Timer? debounce,
  })  : chatScrollController = chatScrollController ?? ScrollController(),
        groupChatScrollController =
            groupChatScrollController ?? ScrollController(),
        debounce = debounce ?? Timer(Duration.zero, () {}),
        titleSearchController =
            titleSearchController ?? TextEditingController();

  ChatbotState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    bool? isDrawerOpen,
    bool? isCannotLoadMoreChat, // Add this
    List<ChatModel>? chatList,
    List<GroupChatModel>? groupChatList,
    int? chatPage,
    int? groupChatPage,
    int? selectedGroupChatId,
    TextEditingController? titleSearchController,
    ScrollController? chatScrollController,
    ScrollController? groupChatScrollController,
    Timer? debounce,
  }) {
    return ChatbotState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      isCannotLoadMoreChat: isCannotLoadMoreChat ?? this.isCannotLoadMoreChat, // Add this
      chatList: chatList ?? this.chatList,
      groupChatList: groupChatList ?? this.groupChatList,
      chatPage: chatPage ?? this.chatPage,
      groupChatPage: groupChatPage ?? this.groupChatPage,
      selectedGroupChatId: selectedGroupChatId ?? this.selectedGroupChatId,
      titleSearchController:
          titleSearchController ?? this.titleSearchController,
      chatScrollController:
          chatScrollController ?? this.chatScrollController,
      groupChatScrollController:
          groupChatScrollController ?? this.groupChatScrollController,
      debounce: debounce ?? this.debounce,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        isError,
        isDrawerOpen,
        isCannotLoadMoreChat, // Add here
        chatList,
        groupChatList,
        chatPage,
        groupChatPage,
        selectedGroupChatId,
        titleSearchController,
        chatScrollController,
        groupChatScrollController,
        debounce,
      ];
}
