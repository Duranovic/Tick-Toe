import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final String label;
  final double value;
  final IconData? iconData;

  const CustomSlider({
    super.key,
    this.label = '',
    this.value = 0,
    this.iconData = Icons.invert_colors_on,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        activeTrackColor: Color(0xff09FFD6),
        inactiveTrackColor: Color.fromARGB(116, 213, 213, 213),
        trackHeight: 10,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
        showValueIndicator: ShowValueIndicator.always,
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        valueIndicatorShape: DropSliderValueIndicatorShape(),
        valueIndicatorColor: Color(0xff09FFD6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.label),
          const SizedBox(width: 4),
          Icon(
            widget.iconData,
            color: const Color(0xffADADAD),
          ),
          Expanded(
            child: Slider.adaptive(
              value: _currentSliderValue,
              max: 6,
              divisions: 6,
              label: _currentSliderValue.round().toString(),
              thumbColor: Colors.white,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
