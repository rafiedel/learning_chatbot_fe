part of '_widgets.dart';

class UserBubbleChat extends StatelessWidget {
  final String content;
  final String imageUrl;
  final File? tempIF;

  const UserBubbleChat({
    super.key,
    required this.content,
    required this.imageUrl,
    this.tempIF,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 4 / 5;

    Widget errorContainer() => Container(
          width: maxWidth,
          height: 180,
          color: Colors.grey.shade400,
          child: const Icon(
            Icons.error,
            color: Colors.red,
            size: 40,
          ),
        );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (tempIF != null || imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: tempIF != null
                  ? Image.file(
                      tempIF!,
                      width: maxWidth,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => errorContainer(),
                    )
                  : CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: maxWidth,
                      height: 180,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: maxWidth,
                          height: 180,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) => errorContainer(),
                    ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
