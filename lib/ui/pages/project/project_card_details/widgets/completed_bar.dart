part of '../project_card_details.dart';

class _CompletedBar extends StatelessWidget {
  const _CompletedBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProjectCardDetails widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
