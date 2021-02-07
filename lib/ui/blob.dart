import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Blob extends StatelessWidget {
  final Widget child;

  final Color background;
  Blob({this.child, this.background = Colors.red /*const Color.fromRGBO(255,255,255, 1)*/});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Bubbles(background: background),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 16.0,
            sigmaY: 16.0,
          ),
          child: child,
        ),
      ],
    );
  }
}

class Bubbles extends StatefulWidget {
  final Color background;

  const Bubbles({Key key, this.background}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;
  final int numberOfBubbles = 6;
  final Color color = Colors.blue;
  final double maxBubbleSize = 200.0;

  @override
  void initState() {
    super.initState();

    // Initialize bubbles
    bubbles = List();
    int i = numberOfBubbles;
    while (i > 0) {
      bubbles.add(Bubble(color, maxBubbleSize));
      i--;
    }

    // Init animation controller
    _controller = new AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: BubblePainter(bubbles: bubbles, background: widget.background),
      size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
    );
  }

  void updateBubblePosition() {
    bubbles.forEach((it) => it.updatePosition());
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;
  Color background;
  BubblePainter({this.bubbles, this.background});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    canvas.drawColor(background, BlendMode.src);
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(Color colour, double maxBubbleSize) {
    this.colour = colour.withOpacity(Random().nextDouble());
    this.direction = Random().nextDouble() * 360;
    this.speed = 0.01;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 180 ? x += speed * sin(direction) / sin(speed) : x -= speed * sin(direction) / sin(speed);
    direction > 90 && direction < 270 ? y += speed * sin(a) / sin(speed) : y -= speed * sin(a) / sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}
