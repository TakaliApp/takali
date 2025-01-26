import 'package:flutter/material.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/helpers/extensions/media_query.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/viewmodels/otp_viewmodel.dart';
import 'package:takali/views/base.view.dart';
import 'package:takali/views/otp/widgets/otp_digit_field_widget.dart';
import 'package:takali/views/otp/widgets/resend_code_widget.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  void _checkOtpCompletion() {
    bool isComplete = _otpControllers.every((controller) => controller.text.isNotEmpty);
    if (isComplete) {
      Navigator.pushNamed(context, RoutePaths.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OtpViewModel>(
      onModelReady: (model) {
        model.initializeTimer();
        for (var controller in _otpControllers) {
          controller.addListener(_checkOtpCompletion);
        } 
      },
      onDispose: (model) {
        model.destroyTimer();
        for (var controller in _otpControllers) {
          controller.removeListener(_checkOtpCompletion);
          controller.dispose();
        }
        for (var focusNode in _focusNodes) {
          focusNode.dispose();
        }
      },
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                'Saisis le code reçu',
                style: context.displayLarge.copyWith(
                  color: AppColors.secondary,
                  height: 1,
                ),
              ),
              SizedBox(height: context.screenHeight * 0.15),
              
              // Champs OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return OtpDigitField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) => model.handleOtpInput(index, value, _focusNodes),
                  );
                }),
              ),
              const SizedBox(height: 30),
              
              // Compte à rebours
              ResendCodeSection(
                countdown: model.countdown,
                isResendEnabled: model.isResendEnabled,
                onResend: model.startTimer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
