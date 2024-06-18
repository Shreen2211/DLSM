import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class SimpleAni extends StatefulWidget {
  final Color? color;
  final Color? color2;

  const SimpleAni({super.key, this.color,this.color2});

  @override
  SimpleAniState createState() => SimpleAniState();
}

class SimpleAniState extends State<SimpleAni>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(begin: -50.0, end: 50.0).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      height: 25,
      width: 120,
      child: Stack(
        children: [
          Positioned(
            top: 11,
            child: Container(
              height: 4,
              width: 120,
              color:widget.color??ColorCustom.red,
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_animation.value, 0),
                child: child,
              );
            },
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 7.5,
                    child: Container(
                      color: widget.color2??ColorCustom.red,
                      width: 28,
                      height: 4,
                    ),
                  ),
                    Text(
                    ' ❯❯ ',
                    style: TextStyle(
                      color: widget.color??ColorCustom.red,
                      fontSize: 20,
                      height: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
