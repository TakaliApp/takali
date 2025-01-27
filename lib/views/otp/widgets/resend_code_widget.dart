import 'package:flutter/material.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/helpers/extensions/textstyle.dart';

class ResendCodeSection extends StatelessWidget {
  final int countdown;
  final bool isResendEnabled;
  final VoidCallback onResend;

  const ResendCodeSection({
    super.key,
    required this.countdown,
    required this.isResendEnabled,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: isResendEnabled ? onResend : null,
          child: Text.rich(
            TextSpan(
              text: 'Renvoyer le code... ',
              style: context.bodyMedium.copyWith(
                color: isResendEnabled ? AppColors.secondary : Colors.grey,
                fontWeight: FontWeight.w600
              ),
              children: [
                TextSpan(
                  text: '$countdown',
                  style: const TextStyle(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}