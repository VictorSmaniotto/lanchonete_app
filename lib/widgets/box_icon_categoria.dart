import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoxIconCategoria extends StatelessWidget {
  final String asset;
  final Color color;
  final String label;

  const BoxIconCategoria({
    super.key,
    required this.asset,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 90,
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0x00f2f2f2),
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SvgPicture.network(
            asset,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            height: 45,
          ),
          Text(
            label,
            style: const TextStyle(
                color: Color(0xff707070), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
