import 'package:flutter/material.dart';
import 'dart:math';

class SaturnLoading extends StatefulWidget {
  SaturnLoading({Key? key}) : super(key: key);

  _SaturnLoadingState _saturnLoadingState =_SaturnLoadingState();

  void start(){
    _saturnLoadingState.start();
  }
  void stop(){
    _saturnLoadingState.stop();
  }

  @override
  _SaturnLoadingState createState() => _SaturnLoadingState();
}

class _SaturnLoadingState extends State<SaturnLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation =
        Tween<double>(begin: 0, end: pi * 2).animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void stop(){
    _animationController.stop(canceled: true);
  }

  void start(){
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Image.asset(
                'image/circle.png',
                width: 100,
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'image/sunny.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Transform.rotate(
                  angle: animation.value,
                  origin: Offset(35, 35),
                  child: Image.asset(
                    'image/saturn',
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
