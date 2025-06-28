part of '_widgets.dart';

class SkeletonChatListView extends StatelessWidget {
  const SkeletonChatListView({super.key, required this.generateHowMuch});

  final int generateHowMuch;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 4 / 5;

    return Column(
      children: List.generate(generateHowMuch, (index) {
        final bool isLeft = index.isOdd;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment:
                isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // Skeleton image placeholder
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade900,
                  highlightColor: Colors.grey.shade700,
                  period: const Duration(milliseconds: 1500), // Slower glow
                  child: Container(
                    width: maxWidth,
                    height: 180,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Skeleton text placeholder
              Shimmer.fromColors(
                baseColor: Colors.grey.shade900,
                highlightColor: Colors.grey.shade700,
                period: const Duration(milliseconds: 1500),
                child: Container(
                  width: maxWidth * 0.7,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
