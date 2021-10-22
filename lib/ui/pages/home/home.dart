import 'package:flutter/material.dart';
import 'package:todo_ui/domain/models/projects.dart';
import 'package:todo_ui/domain/repositories/projects_repository.dart';
import 'package:todo_ui/main.dart';
import 'package:todo_ui/ui/pages/home/widgets/home_second_layer.dart';

import 'package:todo_ui/ui/widgets/custom_gradient_bacground.dart';

import 'widgets/project_card.dart';

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
      duration: const Duration(milliseconds: animationSpeed),
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
        builder: (context, _) {
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
                child: HomeSecondLayerScreen(homeAnimationController: _homeAnimationController),
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: StreamBuilder<List<Project>>(
                    stream: projectsRepo.projectsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView(
                            scrollDirection: Axis.horizontal,
                            controller: PageController(viewportFraction: 0.8 + (0.2 * _homeAnimationController.value)),
                            onPageChanged: (index) => _backgroundController.changeIndex(index),
                            physics: _homeAnimationController.value == 0
                                ? const BouncingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            children: [
                              ProjectCard(homeAnimationController: _homeAnimationController),
                              ProjectCard(homeAnimationController: _homeAnimationController),
                              ProjectCard(homeAnimationController: _homeAnimationController),
                              ProjectCard(homeAnimationController: _homeAnimationController),
                            ]);
                      } else {
                        projectsRepo.initialize();
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
