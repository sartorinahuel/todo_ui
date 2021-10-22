import 'package:flutter/material.dart';

import 'project_card_details.dart';

class ProjectCard extends StatefulWidget {
  final AnimationController homeAnimationController;

  const ProjectCard({
    Key? key,
    required this.homeAnimationController,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  late AnimationController _cardAnimController;
  late Animation<double> _easeAnimation;

  @override
  void initState() {
    _cardAnimController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _easeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimController,
        curve: Curves.easeInCubic,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double margin = 10 * (1 - _easeAnimation.value);
    return GestureDetector(
      onVerticalDragStart: (details) {
        if (widget.homeAnimationController.value == 0) {
          widget.homeAnimationController.forward();
          _cardAnimController.forward();
        }
      },
      onTap: () {
        if (widget.homeAnimationController.value == 0) {
          widget.homeAnimationController.forward();
          _cardAnimController.forward();
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: (size.height * 0.4) * (1 - _easeAnimation.value),
          ),
          Container(
            width: size.width * 0.8 - (margin * 2) + (size.width * 0.2) * _easeAnimation.value,
            height: 400 + (size.height - 400) * _easeAnimation.value,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: ProjectCardDetails(
              homeAnimationController: widget.homeAnimationController,
              cardAnimController: _cardAnimController,
            ),
          ),
        ],
      ),
    );
  }
}
