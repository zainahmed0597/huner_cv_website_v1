import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class AnimatedCursorState {
  final BoxDecoration? decoration;
  final Offset offset1;
  final Offset offset2;
  final Size size1;
  final Size size2;

  AnimatedCursorState({
    this.decoration,
    this.offset1 = Offset.zero,
    this.offset2 = Offset.zero,
    this.size1 = circle1Size,
    this.size2 = circle2Size,
  });

  static const Size circle1Size = Size(30, 30);
  static const Size circle2Size = Size(5, 5);
}

class AnimatedCursorProvider extends ChangeNotifier {
  AnimatedCursorProvider();

  AnimatedCursorState state = AnimatedCursorState();

  void changeCursor({required GlobalKey key, required BoxDecoration boxDecoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderObject;

    if (renderBox != null) {
      state = AnimatedCursorState(
        size1: const Size(60, 60),
        offset1: state.offset1,
        decoration: CursorConstant.boxDecorationHovered,
      );
      notifyListeners();
    }
  }

  void resetCursor() {
    state = AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset position) {
    state = AnimatedCursorState(offset1: position, offset2: position);
    notifyListeners();
  }
}

class AnimatedCircleCursor extends StatelessWidget {
  const AnimatedCircleCursor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimatedCursorProvider(),
      child: Consumer<AnimatedCursorProvider>(
        child: child,
        builder: (context, value, child) {
          final state = value.state;

          return Stack(
            children: [
              child != null ? child : Container(),
              Positioned.fill(
                child: MouseRegion(
                    opaque: false,
                    onHover: (event) =>
                        context.read<AnimatedCursorProvider>().updateCursorPosition(event.position)),
              ),
              Visibility(
                visible: state.offset1 != Offset.zero,
                child: AnimatedPositioned(
                  top: state.offset1.dy - state.size1.height / 2,
                  left: state.offset1.dx - state.size1.width / 2,
                  width: state.size1.width,
                  height: state.size1.height,
                  duration: const Duration(milliseconds: 100),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      decoration: state.decoration ?? CursorConstant.boxDecorationOne,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutExpo,
                      // Assign curve here
                      width: state.size1.width,
                      height: state.size1.height,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.offset2 != Offset.zero,
                child: AnimatedPositioned(
                  top: state.offset2.dy - state.size2.height / 2,
                  left: state.offset2.dx - state.size2.width / 2,
                  width: state.size2.width,
                  height: state.size2.height,
                  duration: const Duration(milliseconds: 50),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutExpo,
                      // Assign curve here
                      width: state.size2.width,
                      height: state.size2.height,
                      decoration: state.decoration ?? CursorConstant.boxDecorationTwo,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedCircleCursorMouseRegion extends StatefulWidget {
  final Widget? child;

  const AnimatedCircleCursorMouseRegion({super.key, this.child});

  @override
  State<AnimatedCircleCursorMouseRegion> createState() => _AnimatedCircleCursorMouseRegionState();
}

class _AnimatedCircleCursorMouseRegionState extends State<AnimatedCircleCursorMouseRegion> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnimatedCursorProvider>();
    return MouseRegion(
      key: _key,
      cursor: SystemMouseCursors.click,
      opaque: false,
      onHover: (_) => cubit.changeCursor(key: _key, boxDecoration: CursorConstant.boxDecorationHovered),
      onExit: (_) => cubit.resetCursor(),
      child: widget.child,
    );
  }
}
