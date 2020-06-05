import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int divs;
  final void Function(double, bool) callback;
  AnimationSlider({
    Key key,
    @required this.minValue,
    @required this.maxValue,
    this.divs,
    this.callback,
  }) : super(key: key);

  _AnimationSliderState createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider> {
  double val = 0.0;
  bool animating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Slider(
            min: widget.minValue,
            max: widget.maxValue,
            divisions: widget.divs,
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Colors.grey,
            onChanged: (animating)
                ? null
                : (value) {
                    setState(() {
                      val = double.parse(value.toStringAsFixed(1));
                      widget.callback(val, animating);
                    });
                  },
            value: val,
          ),
        ),
        IconButton(
            icon: (!animating) ? Icon(Icons.play_arrow) : Icon(Icons.pause),
            color: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                animating = !animating;
                widget.callback(val, animating);
              });
            }),
      ],
    );
  }
}
