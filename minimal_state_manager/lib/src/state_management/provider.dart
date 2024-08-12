import 'package:flutter/material.dart';
import 'package:minimal_state_manager/src/state_management/notifier.dart';

class Provider<T extends ProviderNotifier> extends StatefulWidget {
  const Provider({
    super.key,
    required this.child,
    required this.create,
  });

  final Widget child;
  final T Function() create;

  @override
  State<Provider<T>> createState() => _ProviderState<T>();

  static T of<T extends ProviderNotifier>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_InheritedWidget<T>>();

    assert(provider != null, 'Provider not found in context');

    return provider!.notifier;
  }
}

class _ProviderState<T extends ProviderNotifier> extends State<Provider<T>> {
  late final T _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = widget.create();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(
      notifier: _notifier,
      child: widget.child,
    );
  }
}

class _InheritedWidget<T extends ProviderNotifier> extends InheritedWidget {
  const _InheritedWidget({
    super.key,
    required super.child,
    required this.notifier,
  });

  final T notifier;

  @override
  bool updateShouldNotify(_) {
    return false;
  }
}
