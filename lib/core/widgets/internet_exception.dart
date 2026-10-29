import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/color/color.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/widgets/round_button.dart';

class InternetException extends StatelessWidget {
  final VoidCallback? onTap;
  const InternetException({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.heightOf(context);
    return Column(
      children: [
        SizedBox(height: height * .2),
        Icon(Icons.cloud_off, color: AppColors.red, size: 50),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: Text(
              'We are unable to show results \n Please check your data \n onnection',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: height * .1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: RoundButton(title: 'Retry', ontap: onTap),
        ),
      ],
    );
  }
}
