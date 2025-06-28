import 'package:flutter/material.dart';

class MorePopUpMenuButton extends StatelessWidget {
  const MorePopUpMenuButton({
    required this.onDelete,
    required this.onRename,
    super.key
  });
  final void Function() onRename;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'rename') {
            onRename();
          } else if (value == 'delete') {
            onDelete();
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'rename',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rename', style: TextStyle(color: Colors.white)),
                Icon(Icons.edit, size: 15, color: Colors.white),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}