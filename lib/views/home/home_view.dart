import 'package:flutter/material.dart';
import 'package:takali/viewmodels/home_viewmodel.dart';
import 'package:takali/views/base.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Template View'),
        ),
      ),
    );
  }
}