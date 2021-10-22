import 'package:flutter/material.dart';

class ProjectCardDetails extends StatefulWidget {
  final AnimationController homeAnimationController;
  final AnimationController cardAnimController;
  final Animation<double> easeAnimation;
  final Size cardSize;

  const ProjectCardDetails({
    Key? key,
    required this.homeAnimationController,
    required this.cardAnimController,
    required this.easeAnimation,
    required this.cardSize,
  }) : super(key: key);

  @override
  _ProjectCardDetailsState createState() => _ProjectCardDetailsState();
}

class _ProjectCardDetailsState extends State<ProjectCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardVerticalDragCloser(
          homeAnimationController: widget.homeAnimationController,
          cardAnimController: widget.cardAnimController,
          cardSize: widget.cardSize,
          easeAnimationValue: widget.easeAnimation.value,
        ),
        SizedBox(height: (widget.cardSize.height * 0.35) * (1 - widget.easeAnimation.value)),
        Container(
          margin: EdgeInsets.only(left: 20 + 20 * widget.easeAnimation.value),
          child: const Text(
            '12 tasks',
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'Avenir',
              fontSize: 22,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20 + 20 * widget.easeAnimation.value,
            top: 5 + 5 * widget.easeAnimation.value,
          ),
          child: const Text(
            'Work',
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'Avenir',
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: widget.cardSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 2,
                width: widget.cardSize.width * 0.7,
                child: Stack(
                  children: [
                    Container(
                      height: 2,
                      width: widget.cardSize.width * 0.7,
                      margin: EdgeInsets.only(
                        left: 10 + 20 * widget.easeAnimation.value,
                      ),
                      color: Colors.black12,
                    ),
                    Container(
                      height: 2,
                      width: (widget.cardSize.width * 0.7) * 0.24,
                      margin: EdgeInsets.only(
                        left: 10 + 20 * widget.easeAnimation.value,
                      ),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Color(0xFF4A55DE), Color(0xFF60ADE6)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20 + 20 * widget.easeAnimation.value,
                  right: 20 * widget.easeAnimation.value,
                ),
                child: const Text(
                  '24 %',
                  style: TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Avenir',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _CardVerticalDragCloser extends StatelessWidget {
  final AnimationController cardAnimController;
  final AnimationController homeAnimationController;
  final Size cardSize;
  final double easeAnimationValue;

  const _CardVerticalDragCloser({
    Key? key,
    required this.cardAnimController,
    required this.homeAnimationController,
    required this.cardSize,
    required this.easeAnimationValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardSize.height * 0.25,
      width: cardSize.width,
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragStart: (details) {
              homeAnimationController.reverse();
              cardAnimController.reverse();
            },
            child: Container(
              height: cardSize.height * 0.25 * easeAnimationValue,
              width: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 20 + 120 * easeAnimationValue,
            left: 20 + 20 * easeAnimationValue,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.work_rounded,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: Opacity(
              opacity: easeAnimationValue,
              child: IconButton(
                onPressed: () {
                  homeAnimationController.reverse();
                  cardAnimController.reverse();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 5 + 40 * easeAnimationValue,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
