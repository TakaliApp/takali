import 'package:flutter/material.dart';
import 'package:takali/views/base.view.dart';
import 'package:takali/viewmodels/match_viewmodel.dart';


class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MatchViewModel>(
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: const Center(
          child: Text('Match View'),
        ),
      ),
    );
  }
}