part of '_widgets.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.android_outlined,
          size: 64,
          color: Colors.blueGrey,
        ),
        SizedBox(height: 16),
        Text(
          "Halo, aku bot asisten belajarmu.\nSilakan tanyakan atau minta apa saja!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

