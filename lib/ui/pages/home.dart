import 'package:flutter/material.dart';
import 'package:todo_ui/domain/models/projects.dart';
import 'package:todo_ui/domain/repositories/projects_repository.dart';

import 'package:todo_ui/ui/widgets/custom_gradient_bacground.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _homeAnimationController;
  late CustomBackgroundController _backgroundController;

  @override
  void initState() {
    _backgroundController = CustomBackgroundController();
    _homeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _homeAnimationController,
        builder: (context, snapshot) {
          final height = 420 + (size.height - 420) * _homeAnimationController.value;
          return Stack(
            children: [
              CustomGradientBackground(
                controller: _backgroundController,
                colors: const [
                  [Color(0xFFE04670), Color(0xFFEEB14F)],
                  [Color(0xFF4A55DE), Color(0xFF60ADE6)],
                  [Color(0xFF2B4723), Color(0xFF20DB5A)],
                  [Color(0xFF3D3D3D), Color(0xFFB1B1B1)],
                ],
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    // const SizedBox(height: 400),
                  ],
                ),
              ),
              Positioned(
                // bottom: 50 * (1 - _homeAnimationController.value),
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: StreamBuilder<List<Project>>(
                      stream: projectsRepo.projectsStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final projects = snapshot.data;
                          return PageView(
                              scrollDirection: Axis.horizontal,
                              controller: PageController(viewportFraction: 0.8 + (0.2 * _homeAnimationController.value)),
                              onPageChanged: (index) => _backgroundController.changeIndex(index),
                              physics: const BouncingScrollPhysics(),
                              children: [
                                ProjectCard(
                                  pageIndex: 0,
                                  homeAnimationController: _homeAnimationController,
                                ),
                                ProjectCard(
                                  pageIndex: 1,
                                  homeAnimationController: _homeAnimationController,
                                ),
                                ProjectCard(
                                  pageIndex: 2,
                                  homeAnimationController: _homeAnimationController,
                                ),
                                ProjectCard(
                                  pageIndex: 3,
                                  homeAnimationController: _homeAnimationController,
                                ),
                              ]);
                        } else {
                          projectsRepo.initialize();
                          return const Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final AnimationController homeAnimationController;
  final int pageIndex;

  const ProjectCard({
    Key? key,
    required this.homeAnimationController,
    required this.pageIndex,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  late AnimationController _cardAnimController;

  @override
  void initState() {
    _cardAnimController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double margin = 10 * (1 - _cardAnimController.value);
    return GestureDetector(
      onVerticalDragStart: (details) {
        if (widget.homeAnimationController.value == 0) {
          widget.homeAnimationController.forward();
          _cardAnimController.forward();
        } else {
          widget.homeAnimationController.reverse();
          _cardAnimController.reverse();
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
            height: (size.height * 0.4) * (1 - _cardAnimController.value),
          ),
          Container(
            width: size.width * 0.8 - (margin * 2) + (size.width * 0.2) * _cardAnimController.value,
            height: 400 + (size.height - 400) * _cardAnimController.value,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCard extends AnimatedWidget {
  final AnimationController homeAnimationController;
  final int pageIndex;

  const AnimatedCard({
    Key? key,
    required this.homeAnimationController,
    required this.pageIndex,
  }) : super(key: key, listenable: homeAnimationController);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        if (homeAnimationController.value == 0) {
          homeAnimationController.forward();
        } else {
          homeAnimationController.reverse();
        }
      },
      onTap: () {
        if (homeAnimationController.value == 0) {
          homeAnimationController.forward();
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(''),
          ),
        ],
      ),
    );
  }
}

// class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
//   late Tween _tween;

//   @override
//   void initState() {
//     super.initState();
//     _tween = Tween<int>(begin: 0, end: 100);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     double height = 400 + (size.height - 400) * _tween.;
//     double margin = 10 * (1 - cardAnimationController.value);
//     double width = size.width * 0.8 - (margin * 2) + (size.width * 0.2) * cardAnimationController.value;

//     print('$height - $width - $margin');
//     print('${size.height} - ${size.width}');

//   }
// }
