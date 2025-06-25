part of '_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return LearningChatbotScaffold(
      padding: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red
            ),
          )
        ],
      )
    );
  }
}
