import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/shared/domain/button_variations.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final ActionButtonVariant? variant;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.text,
    this.variant = ActionButtonVariant.primary,
    this.width,
    this.height = 45,
    this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: actionButtonVariationsColors[variant]!,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () => {
          if (onPressed != null) {onPressed!()}
        },
        child: Row(
          mainAxisAlignment: (iconData != null)
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(iconData),
                  const SizedBox(width: 8),
                ],
              ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
