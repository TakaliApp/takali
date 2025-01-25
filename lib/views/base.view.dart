import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_locator.dart';
import '../viewmodels/base.viewmodel.dart';

/// [BaseView]
/// Base class for view and it related viewModel
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onDispose;
  final Widget? child;

  const BaseView({super.key, this.child, required this.builder, this.onModelReady, this.onDispose});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(viewModel);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}