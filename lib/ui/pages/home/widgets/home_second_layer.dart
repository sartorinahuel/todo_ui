import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeSecondLayerScreen extends StatelessWidget {
  final AnimationController homeAnimationController;

  const HomeSecondLayerScreen({
    Key? key,
    required this.homeAnimationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerValue = homeAnimationController.value > 1
        ? 1.0
        : homeAnimationController.value < 0
            ? 0.0
            : homeAnimationController.value.toDouble();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _HomeAppBar(controllerValue: controllerValue),
            const SizedBox(height: 15),
            _Avatar(controllerValue: controllerValue),
            const SizedBox(height: 10),
            _HelloText(controllerValue: controllerValue),
            const SizedBox(height: 8),
            _DetailText1(controllerValue: controllerValue),
            const SizedBox(height: 2),
            _DetailText2(controllerValue: controllerValue),
            const Spacer(),
            _TodayText(controllerValue: controllerValue),
          ],
        ),
      ),
    );
  }
}

class _DetailText1 extends StatelessWidget {
  final double controllerValue;

  const _DetailText1({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationDelay = (controllerValue > 0.58 ? (controllerValue - 0.58) / 0.42 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.38 ? (controllerValue - 0.38) / 0.62 : 0).toDouble();
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Transform.translate(
        offset: Offset(0, 50 * animationDelay),
        child: Opacity(
          opacity: 1 - opacityDelay,
          child: const Text(
            'Looks like feel good today',
            style: TextStyle(
              color: Colors.white54,
              fontFamily: 'Avenir',
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailText2 extends StatelessWidget {
  final double controllerValue;

  const _DetailText2({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationDelay = (controllerValue > 0.55 ? (controllerValue - 0.55) / 0.45 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.35 ? (controllerValue - 0.35) / 0.65 : 0).toDouble();
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Transform.translate(
        offset: Offset(0, 50 * animationDelay),
        child: Opacity(
          opacity: 1 - opacityDelay,
          child: const Text(
            'You have 3 tasks to do today',
            style: TextStyle(
              color: Colors.white54,
              fontFamily: 'Avenir',
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class _HelloText extends StatelessWidget {
  final double controllerValue;

  const _HelloText({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationDelay = (controllerValue > 0.62 ? (controllerValue - 0.62) / 0.38 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.4 ? (controllerValue - 0.4) / 0.6 : 0).toDouble();
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Transform.translate(
        offset: Offset(0, 50 * animationDelay),
        child: Opacity(
          opacity: 1 - opacityDelay,
          child: const Text(
            'Hello, Nahuel.',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double controllerValue;

  const _Avatar({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationDelay = (controllerValue > 0.65 ? (controllerValue - 0.65) / 0.35 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.45 ? (controllerValue - 0.45) / 0.55 : 0).toDouble();
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Transform.translate(
        offset: Offset(0, 50 * animationDelay),
        child: Opacity(
          opacity: 1 - opacityDelay,
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/img/profile-pic.jpeg'),
          ),
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  final double controllerValue;

  const _HomeAppBar({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationDelay = (controllerValue > 0.7 ? (controllerValue - 0.7) / 0.3 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.5 ? (controllerValue - 0.5) / 0.5 : 0).toDouble();
    return Transform.translate(
      offset: Offset(0, 50 * animationDelay),
      child: Opacity(
        opacity: 1 - opacityDelay,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: const Text(
                'Todo',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Avenir',
                  fontSize: 20,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TodayText extends StatelessWidget {
  final double controllerValue;

  const _TodayText({
    Key? key,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd, yyyy').format(now);
    String formattedMonth = DateFormat('MMMM').format(now);
    final animationDelay = (controllerValue > 0.2 ? (controllerValue - 0.2) / 0.8 : 0).toDouble();
    final opacityDelay = (controllerValue > 0.1 ? (controllerValue - 0.1) : 0).toDouble();
    return Container(
      margin: EdgeInsets.only(left: 40, bottom: size.height * 0.475),
      alignment: Alignment.centerLeft,
      child: Transform.translate(
        offset: Offset(0, 50 * animationDelay),
        child: Opacity(
          opacity: 1 - opacityDelay,
          child: Text(
            'TODAY : ${formattedMonth.toUpperCase()} $formattedDate',
            style: const TextStyle(
              color: Colors.white70,
              fontFamily: 'Avenir',
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
