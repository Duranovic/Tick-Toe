import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.text = "Back",
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xff001231)),
          const SizedBox(width: 3),
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Color(0xff001231)),
          ),
        ],
      ),
    );
  }
}
