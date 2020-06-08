import 'dart:math';

import 'package:animation/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> boxAnimation;
  AnimationController boxController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    catAnimation = Tween(begin: -20.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    boxController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    boxAnimation = Tween(begin: 0.53 * pi, end: 0.58 * pi).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOutSine,
      ),
    );

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    catAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        boxController.stop();
      } else {
        boxController.forward();
      }
    });
  }

  void onTap() {
    if (catController.isCompleted) {
      catController.reverse();
    } else if (catController.isDismissed) {
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Animation!"),
        ),
        body: GestureDetector(
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          ),
          onTap: onTap,
        ),
      );

  Widget buildCatAnimation() => AnimatedBuilder(
        animation: catAnimation,
        child: Cat(),
        builder: (BuildContext context, Widget child) => Positioned(
          child: child,
          top: catAnimation.value,
          left: 0.0,
          right: 0.0,
        ),
      );

  Widget buildBox() => Container(
        height: 200.0,
        width: 200.0,
        color: Colors.brown,
      );

  Widget buildLeftFlap() => Positioned(
        left: 3.0,
        top: 1.0,
        child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
            height: 10.0,
            width: 125.0,
            color: Colors.brown,
          ),
          builder: (BuildContext context, Widget child) => Transform.rotate(
            child: child,
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
          ),
        ),
      );

  Widget buildRightFlap() => Positioned(
        right: 3.0,
        top: 1.0,
        child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
            height: 10.0,
            width: 125.0,
            color: Colors.brown,
          ),
          builder: (BuildContext context, Widget child) => Transform.rotate(
            child: child,
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
          ),
        ),
      );
}
