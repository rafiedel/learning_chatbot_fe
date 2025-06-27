part of '_widgets.dart';

class AssistantMarkdown extends StatelessWidget {
  final String content;

  const AssistantMarkdown({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: GptMarkdown(
              content,
              style: const TextStyle(
                fontSize: 14,
              ),
              onLinkTap: (url, title) {
                debugPrint('Link tapped: $url');
              },
            ),
          ),
        ),
      ),
    );
  }
}