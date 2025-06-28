import 'package:flutter/material.dart';

class DeleteConfirmDialog extends StatelessWidget {
  const DeleteConfirmDialog({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm Deletion',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Text.rich(
              TextSpan(
                text: 'Are you sure you want to delete ',
                children: [
                  TextSpan(
                    text: content,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                  const TextSpan(
                    text: '? This action cannot be undone.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Divider
          const Divider(height: 1, color: Colors.grey),

          // Actions
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const VerticalDivider(width: 1, color: Colors.grey),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
