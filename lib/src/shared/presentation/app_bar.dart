import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick_toe_flutter/src/shared/presentation/back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.leading,
    this.titleWidget,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            leading ?? const CustomBackButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80.0,
      );
}
