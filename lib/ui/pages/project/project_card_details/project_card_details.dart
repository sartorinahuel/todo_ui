import 'package:flutter/material.dart';

part './widgets/card_header.dart';
part './widgets/completed_bar.dart';
part './widgets/card_titles.dart';

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
    final controllerValue = widget.easeAnimation.value;
    final animationDelay = (controllerValue > 0.3 ? (controllerValue - 0.3) / 0.7 : 0).toDouble();
    return Stack(
      children: [
        SizedBox(
          height: widget.cardSize.height,
          width: widget.cardSize.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardHeader(
                  homeAnimationController: widget.homeAnimationController,
                  cardAnimController: widget.cardAnimController,
                  cardSize: widget.cardSize,
                  easeAnimationValue: widget.easeAnimation.value,
                ),
                SizedBox(height: (widget.cardSize.height * 0.35) * (1 - widget.easeAnimation.value)),
                _CardTitles(widget: widget),
                _CompletedBar(widget: widget),
                Opacity(
                  opacity: animationDelay,
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18 * animationDelay,
                          child: const Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Avenir',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Meet Clients',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Design Sprint',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Insert logo into app',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Flutter Practice',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: const Text(
                            'Tomorrow',
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Avenir',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Weekly Report',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Design Meeting',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'App Workflows',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30 * animationDelay),
                        SizedBox(
                          height: 18 * animationDelay,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text(
                                'Dart Conference',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50 * animationDelay),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 80,
          child: _AddButton(animationDelay: animationDelay),
        )
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final double animationDelay;

  const _AddButton({
    Key? key,
    required this.animationDelay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animationDelay,
      child: Container(
        height: 60 * animationDelay,
        width: 60 * animationDelay,
        decoration: BoxDecoration(
          color: Colors.blue[500],
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
