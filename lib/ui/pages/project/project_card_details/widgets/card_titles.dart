part of '../project_card_details.dart';

class _CardTitles extends StatelessWidget {
  const _CardTitles({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProjectCardDetails widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
