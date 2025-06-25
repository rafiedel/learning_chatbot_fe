part of '_pages.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  late NavigationService navigationService;

  @override
  void initState() {
    navigationService = NavigationService();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController _textController = TextEditingController();

  Future<void> _openSymbolKeyboard() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FractionallySizedBox(
        heightFactor: 0.80,                 // sheet = 80 % of screen height
        child: SymbolSheete(initial: _textController.text)
      ),
    );

    if (result != null) {
      _textController
        ..text = result
        ..selection = TextSelection.collapsed(offset: result.length);
      setState(() {});                      // refresh 3-line icon if needed
    }
  }

  bool _drawerOpen = false;


  @override
  Widget build(BuildContext context) {

    List<GroupChatModel> groupChat = [];
    for (int i = 0; i < 20; i++) {
      groupChat.add(GroupChatModel(title: i.toString()));
    }

    return LearningChatbotScaffold(
      padding: false,
      resizeToAvoidBottomInset: !_drawerOpen,
      onDrawerChanged: (open) => setState(() => _drawerOpen = open),
      drawer: SlidingDrawer(groupChats:  groupChat,),
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
                    letterSpacing: 2
                  ),
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.person)
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter text...',
                            ),
                          controller: _textController,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                    ),
                    if ('\n'.allMatches(_textController.text).length + 1 >= 3)
                      IconButton(
                        onPressed: () {},
                        iconSize: 10,
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.open_in_full_rounded),
                      ),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.camera_alt)
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.image)
                      ),
                      IconButton(
                        onPressed: _openSymbolKeyboard, 
                        icon: Icon(Icons.functions)
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.purple),
                    ),
                    icon: Icon(Icons.arrow_upward)
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
