import 'package:flutter/material.dart';

import 'nav_button.dart';
import 'nav_custom_painter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final List<Widget> selectedItems;
  final int index;
  final ValueChanged<int>? onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  late final Color buttonBackgroundColor;
  late final Color bottomBarCutoutColor;
  late final Color bottomBarColor;

  CustomBottomNavigationBar({
    required this.items,
    required this.selectedItems,
    this.index = 0,
    this.buttonBackgroundColor = Colors.white,
    this.bottomBarCutoutColor = Colors.transparent,
    this.bottomBarColor = Colors.white,
    this.onTap,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    Key? key,
  })  : assert(items.isNotEmpty),
        assert(selectedItems.length == items.length),
        super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPosition;
  int _endingIndex = 0;
  late double _position;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.selectedItems[widget.index];
    _length = widget.items.length;
    _position = widget.index / _length;
    _startingPosition = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _position);
    _animationController.addListener(() {
      setState(() {
        _position = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        if ((endingPos - _position).abs() <
            (_startingPosition - _position).abs()) {
          _icon = widget.selectedItems[_endingIndex];
        }
      });
    });
  }

  @override
  void didUpdateWidget(CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPosition = _position;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: widget.bottomBarCutoutColor,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: 25,
            left: _position * size.width,
            width: size.width / _length,
            child: Center(
              child: Material(
                color: widget.buttonBackgroundColor,
                type: MaterialType.card,
                elevation: 16,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(width: 40, height: 40, child: _icon),
              ),
            ),
          ),
          CustomPaint(
            painter: CustomNavigationBarPainter(
                position: _position,
                itemCount: _length,
                bottomBarColor: widget.bottomBarColor),
            child: Container(
              height: 50,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -25,
            child: SizedBox(
                height: 100,
                child: Row(
                    children: widget.items
                        .map((item) => NavButton(
                              onTap: _buttonTap,
                              position: _position,
                              length: _length,
                              index: widget.items.indexOf(item),
                              child: Center(child: item),
                            ))
                        .toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPosition = _position;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}
