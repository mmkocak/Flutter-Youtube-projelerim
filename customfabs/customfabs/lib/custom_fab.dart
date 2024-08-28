import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomFab({Key? key, required this.onPressed}) : super(key: key);

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(4),
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: <Color>[Colors.blue, Colors.pink, Colors.white,  Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.25, 0.25, 0.25, 0.25],
            ),
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Container(
            width: 66,
            height: 66,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _controller.value * 10 + 55,
                height: _controller.value * 10 + 55,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: <Color>[Colors.blue, Colors.pink],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    border: Border.all(color: Colors.transparent, width: 4),
                  ),
                  child: FloatingActionButton(
                    onPressed: widget.onPressed,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.add_event,
                      progress: _controller,
                       color: Colors.white,
                        size: 30.0,
                      
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
