part of '_widgets.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    required this.chatScrollController,
    required this.chatList,
    required this.isLoadingChats,
    required this.isWaitingAI,
    super.key
  });

  final ScrollController chatScrollController;
  final List<ChatModel> chatList;
  final bool isLoadingChats;
  final bool isWaitingAI;

  @override
  Widget build(BuildContext context) {
    if (isLoadingChats && chatList.isEmpty) {
      return SingleChildScrollView(
        child: SkeletonChatListView(
          generateHowMuch: 4,
        )
      );
    }
    if (chatList.isEmpty) {
      return EmptyChat();
    }
    return SingleChildScrollView(
      controller: chatScrollController,
      child: Column(
        children: [
          if (isLoadingChats)
            SkeletonChatListView(
              generateHowMuch: 1,
            ),
          Column(
            children: chatList.map((e) {
              if (e.role.toLowerCase() == "user") {
                return UserBubbleChat(
                  content: e.content, 
                  imageUrl: e.imageUrl
                );
              }
              return AssistantMarkdown(content: e.content);
            }).toList(),
          ),
          if (isWaitingAI)
            WaveTypingIndicator()
        ]
      )
    );
  }
}
