import 'package:flutter/material.dart';

class TagsContent extends StatelessWidget {
  final String title;
  const TagsContent({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'SFProDisplay-Semibold',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xff000000),
            height: 1.3333333333333333,
          ),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
      ),
    );
  }
}
