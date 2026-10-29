import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/color/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  final void Function()? ontap;

  const RoundButton({
    super.key,
    required this.title,
    this.height = 40,
    this.width = double.infinity,
    this.ontap,
    this.color=AppColors.green
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
