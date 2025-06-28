part of '_widgets.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    required this.titleSearchController,
    required this.onChanged,
    super.key
  });

  final TextEditingController titleSearchController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return TextField(
            controller: titleSearchController,
            onChanged: onChanged,
            style: TextStyle(
              color: isFocused ? Colors.white : Colors.grey,
            ),
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: isFocused ? Colors.white : Colors.grey,
                size: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}