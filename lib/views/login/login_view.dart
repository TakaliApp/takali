import 'package:flutter/material.dart';
import 'package:takali/viewmodels/login_viewmodel.dart';
import 'package:takali/views/base.view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Template View'),
        ),
      ),
    );
  }
}