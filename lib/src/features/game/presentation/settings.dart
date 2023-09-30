import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/shared/presentation/slider.dart';

import '../../../shared/domain/button_variations.dart';
import '../../../shared/presentation/action_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AlertDialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor:
              Colors.white.withOpacity(0), // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content

          content: Column(
            children: [
              const SizedBox(height: 90),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  CustomSlider(
                    label: "Music",
                    value: 5,
                    iconData: Icons.volume_up_rounded,
                  ),
                  CustomSlider(
                    label: "Sound",
                    value: 2,
                    iconData: Icons.music_note,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(
                    child: ActionButton(
                      text: "Turn off",
                      variant: ActionButtonVariant.secondary,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ActionButton(
                      text: "Default",
                      variant: ActionButtonVariant.secondary,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ActionButton(
                      text: "Max",
                      variant: ActionButtonVariant.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90),
              ActionButton(
                text: "Back to home",
                variant: ActionButtonVariant.secondary,
                iconData: Icons.home,
                onPressed: () => GoRouter.of(context).goNamed('home'),
              ),
              const SizedBox(height: 12),
              ActionButton(
                text: "Exit game",
                variant: ActionButtonVariant.secondary,
                iconData: Icons.exit_to_app_rounded,
                onPressed: () => SystemNavigator.pop(),
              ),
              const SizedBox(height: 12),
              ActionButton(
                text: "Close settings",
                variant: ActionButtonVariant.red,
                iconData: Icons.close_rounded,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
