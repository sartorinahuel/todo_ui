import 'package:flutter/material.dart';

class ProjectCardDetails extends StatefulWidget {
  final AnimationController homeAnimationController;
  final AnimationController cardAnimController;

  const ProjectCardDetails({
    Key? key,
    required this.homeAnimationController,
    required this.cardAnimController,
  }) : super(key: key);

  @override
  _ProjectCardDetailsState createState() => _ProjectCardDetailsState();
}

class _ProjectCardDetailsState extends State<ProjectCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.homeAnimationController.value == 1)
          _CardVerticalDragCloser(
            homeAnimationController: widget.homeAnimationController,
            cardAnimController: widget.cardAnimController,
          ),
      ],
    );
  }
}

class _CardVerticalDragCloser extends StatelessWidget {
  const _CardVerticalDragCloser({
    Key? key,
    required this.cardAnimController,
    required this.homeAnimationController,
  }) : super(key: key);

  final AnimationController cardAnimController;
  final AnimationController homeAnimationController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragStart: (details) {
        homeAnimationController.reverse();
        cardAnimController.reverse();
      },
      child: Container(
        height: size.height * 0.25,
        width: double.infinity,
        color: Colors.transparent,
      ),
    );
  }
}
