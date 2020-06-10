import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int divisions;
  var value;
  bool animateVariable;
  Function(double, bool) callback;
  AnimationSlider({
    Key key,
    @required this.minValue,
    @required this.maxValue,
    @required this.value,
    @required this.animateVariable,
    this.divisions,
    this.callback,
  }) : super(key: key);

  _AnimationSliderState createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Slider(
            min: widget.minValue,
            max: widget.maxValue,
            divisions: widget.divisions,
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Colors.grey,
            onChanged: (widget.animateVariable)
                ? null
                : (value) {
                    setState(() {
                      widget.value = double.parse(value.toStringAsFixed(1));
                      widget.callback(widget.value, widget.animateVariable);
                    });
                  },
            value: widget.value,
          ),
        ),
        IconButton(
            icon: (!widget.animateVariable)
                ? Icon(Icons.play_arrow)
                : Icon(Icons.pause),
            color: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                widget.animateVariable = !widget.animateVariable;
                widget.callback(widget.value, widget.animateVariable);
              });
            }),
      ],
    );
  }
}
