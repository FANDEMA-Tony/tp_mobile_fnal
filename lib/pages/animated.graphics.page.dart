import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tp_mobile/widgets/animated.shape.painter.widget.dart';

class AnimatedGraphicsPage extends StatefulWidget {
  const AnimatedGraphicsPage({super.key});

  @override
  State<AnimatedGraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<AnimatedGraphicsPage>
    with TickerProviderStateMixin {
  double radius = 30;
  double radians = pi;
  late Animation<double> animation;
  late AnimationController animationController;
  bool animationStoped = true;
  Icon iconStatus = const Icon(Icons.play_arrow);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    Tween<double> tween = Tween(begin: -pi, end: pi);
    animation = tween.animate(animationController)
      ..addListener(() {
        setState(() {
          radians = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          animationController.stop();
        }
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Graphics')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Rayon'),
          ),
          Slider(
            value: radius,
            min: 30,
            max: 100,
            activeColor: Colors.teal,
            onChanged: (value) {
              setState(() {
                radius = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Angle de rotation'),
          ),
          Slider(
            value: radians,
            min: -4 * pi,
            max: 4 * pi,
            activeColor: Colors.teal,
            onChanged: (value) {
              setState(() {
                radians = value;
              });
            },
          ),
          Expanded(
            child: CustomPaint(
              painter: AnimatedShapePainter(radius: radius, radians: radians),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: AnimatedShapePainter(
                    radius: radius,
                    radians: radians,
                    color: Colors.lightGreenAccent,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationStoped) {
            animationController.forward();
            animationStoped = false;
            setState(() {
              iconStatus = const Icon(Icons.pause);
            });
          } else {
            animationController.stop();
            animationStoped = true;
            setState(() {
              iconStatus = const Icon(Icons.play_arrow);
            });
          }
        },
        child: iconStatus,
      ),
    );
  }
}
