import 'package:flutter/material.dart';
import 'package:minimal_state_manager/minimal_state_manager.dart';

class Consumer<T extends ProviderNotifier> extends StatefulWidget {
  const Consumer({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, T notifier) builder;

  @override
  State<Consumer<T>> createState() => _ConsumerState<T>();
}

class _ConsumerState<T extends ProviderNotifier> extends State<Consumer<T>> {
  late final T _notifier;
  bool _initiliazed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initiliazed) {
      _notifier = Provider.of<T>(context);
      _notifier.addListener(_listener);
      _initiliazed = true;
    }
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    _notifier.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _notifier);
  }
}
