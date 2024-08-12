import 'package:flutter/material.dart';

class Provider<T> extends StatefulWidget {
  const Provider({
    super.key,
    required this.child,
    required this.data,
  });

  final Widget child;
  final T data;

  @override
  State<Provider<T>> createState() => _ProviderState<T>();
}

class _ProviderState<T> extends State<Provider<T>> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(
      data: widget.data,
      child: widget.child,
    );
  }
}

class _InheritedWidget<T> extends InheritedWidget {
  const _InheritedWidget({
    super.key,
    required super.child,
    required this.data,
  });

  final T data;

  @override
  bool updateShouldNotify(_) {
    return false;
  }
}
