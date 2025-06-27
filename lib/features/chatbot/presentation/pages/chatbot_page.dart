part of '_pages.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  late ChatbotCubit _chatbotCubit;

  @override
  void initState() {
    _chatbotCubit = get<ChatbotCubit>();
     _chatbotCubit.initChatScrollController();
    initialPageLoad();
    super.initState();
  }

  @override
  void dispose() {
    _chatbotCubit.close();
    super.dispose();
  }

  Future<void> initialPageLoad() async => _chatbotCubit.getGroupChats();
  Future<void> onDrawerChanged(bool newIsDrawerOpen) async =>
      _chatbotCubit.setIsDrawerOpen(newIsDrawerOpen);
  Future<void> onOpenSymbolKeyboard(BuildContext context) async =>
      _chatbotCubit.openSymbolKeyboard(context);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatbotCubit, ChatbotState, bool>(
      bloc: _chatbotCubit,
      selector: (state) => state.isDrawerOpen,
      builder: (context, isDrawerOpen) {
        return LearningChatbotScaffold(
          padding: false,
          resizeToAvoidBottomInset: !isDrawerOpen,
          onDrawerChanged: onDrawerChanged,
          drawer: BlocBuilder<ChatbotCubit, ChatbotState>(
            bloc: _chatbotCubit,
            builder: (context, state) {
              return SlidingDrawer(chatbotCubit: _chatbotCubit);
            },
          ),
          body: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: Icon(Icons.menu),
                      ),
                    ),
                    Text(
                      '🧠 Learning Chatbot 🤖',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<ChatbotCubit, ChatbotState>(
                  bloc: _chatbotCubit,
                  builder: (context, state) {
                    return SingleChildScrollView(
                      controller: state.chatScrollController,
                      child: Column(
                        children: state.chatList.map((e) {
                          if (e.role.toLowerCase() == "user") {
                            return UserBubbleChat(
                              content: e.content, 
                              imageUrl: e.imageUrl
                            );
                          }
                          return AssistantMarkdown(content: e.content);
                        }).toList()
                      )
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Divider(),
                  Padding(
                    padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                    child: BlocBuilder<ChatbotCubit, ChatbotState>(
                      bloc: _chatbotCubit,
                      builder: (context, state) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Scrollbar(
                                  controller: ScrollController(),
                                  thumbVisibility: true,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Enter text...',
                                    ),
                                    controller: state.titleSearchController,
                                    minLines: 1,
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                            ),
                            if ('\n'
                                  .allMatches(
                                    state.titleSearchController.text,
                                  )
                                  .length +
                              1 >=
                            3)
                              IconButton(
                                onPressed: () {},
                                iconSize: 10,
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.open_in_full_rounded),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.image)),
                          IconButton(
                            onPressed: () => onOpenSymbolKeyboard(context),
                            icon: Icon(Icons.functions),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.purple,
                          ),
                        ),
                        icon: Icon(Icons.arrow_upward),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
