part of '../project_card_details.dart';

class _CardHeader extends StatelessWidget {
  final AnimationController cardAnimController;
  final AnimationController homeAnimationController;
  final Size cardSize;
  final double easeAnimationValue;

  const _CardHeader({
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
