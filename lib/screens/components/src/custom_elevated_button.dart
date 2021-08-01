import 'package:flutter/material.dart';

import 'custom_activity_indicator.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.loadingText,
  }) : super(key: key);

  final bool isLoading;
  final String text;
  final String? loadingText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(336, 44)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading) ...[
            const CustomCupertinoActivityIndicator(),
            const SizedBox(width: 8.0),
            Text(loadingText != null ? loadingText! : text),
          ] else
            Text(text),
        ],
      ),
    );
  }
}
