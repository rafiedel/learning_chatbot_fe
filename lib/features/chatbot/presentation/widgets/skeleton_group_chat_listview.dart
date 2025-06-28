part of '_widgets.dart';

class SkeletonGroupChatListView extends StatelessWidget {
  const SkeletonGroupChatListView({super.key, 
  required this.howMuchItems});

  final int howMuchItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: howMuchItems,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade900,
          highlightColor: Colors.grey.shade700,
          period: const Duration(milliseconds: 1500),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            title: Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            subtitle: Container(
              margin: const EdgeInsets.only(top: 4),
              width: 100,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            trailing: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}
