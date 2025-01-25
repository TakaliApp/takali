import 'package:flutter/material.dart';

import '../base.view.dart';
import 'template_viewmodel.dart';

class TemplateView extends StatefulWidget {
  const TemplateView({super.key});

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TemplateViewModel>(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Template View'),
        ),
      ),
    );
  }
}