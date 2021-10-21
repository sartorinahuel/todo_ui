import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomGradientBackground extends StatefulWidget {
  final List<List<Color>> colors;
  final CustomBackgroundController controller;
  const CustomGradientBackground({
    Key? key,
    required this.colors,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomGradientBackgroundState createState() => _CustomGradientBackgroundState();
}

class _CustomGradientBackgroundState extends State<CustomGradientBackground> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    widget.controller.setColorsLength(widget.colors.length);

    return Scaffold(
      body: ChangeNotifierProvider(
          create: (BuildContext context) => widget.controller,
          builder: (context, _) {
            final index = Provider.of<CustomBackgroundController>(context).index;
            return AnimatedContainer(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [...widget.colors[index]],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              duration: const Duration(milliseconds: 300),
            );
          }),
    );
  }
}

class CustomBackgroundController extends ChangeNotifier {
  int index = 0;
  int colorsLength = 0;

  void setColorsLength(int length) {
    colorsLength = length;
  }

  void changeIndex(newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
