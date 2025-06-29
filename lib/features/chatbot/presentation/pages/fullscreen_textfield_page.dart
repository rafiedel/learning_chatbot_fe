part of '_pages.dart';

class FullscreenTextfieldPage extends StatelessWidget {
  const FullscreenTextfieldPage({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return LearningChatbotScaffold(
      safeArea: true,
      padding: false,
      
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => nav.pop(),
        backgroundColor: Colors.grey.shade500,
        foregroundColor: Colors.grey.shade900,
        shape: const CircleBorder(),
        child: const Icon(Icons.close_fullscreen_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 50),
            child: TextField(
              maxLines: null,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none, 
                hintText: "Enter text here . . .",
                hintStyle: TextStyle(
                  color: Colors.grey
                )
              ),   
            ),
          ),
        ),
      ),
    );
  }
}
