part of '_themes.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.compact,
      listTileTheme: const ListTileThemeData(dense: true),
    );
  }
}
