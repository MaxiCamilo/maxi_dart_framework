import 'dart:collection';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class DisposableLinkedList<T extends Disposable> extends Iterable<T> with DisposableMixin, WithLifecycleScopeMixin implements ILifecycleScope {
  final LinkedList<_DisposableLinkedListEntry> _list = LinkedList<_DisposableLinkedListEntry>();

  DisposableLinkedList() {
    heart.onDispose(() {
      clear();
    });
  }

  void addFirst(T entry) {
    _list.addFirst(_DisposableLinkedListEntry(value: entry, attached: false));
  }

  void addLast(T entry) {
    if (entry is DisposableMixin && entry.isDisposed) {
      log('Attempted to add a disposed entry: $entry');
      return;
    }

    _list.add(_DisposableLinkedListEntry(value: entry, attached: false));
  }

  void addAll(Iterable<T> entries) {
    for (var entry in entries) {
      addLast(entry);
    }
  }

  void attachFirst(T entry) {
    _list.addFirst(_DisposableLinkedListEntry(value: entry, attached: true));
  }

  void attachLast(T entry) {
    if (entry is DisposableMixin && entry.isDisposed) {
      log('Attempted to add a disposed entry: $entry');
      return;
    }

    _list.add(_DisposableLinkedListEntry(value: entry, attached: true));
  }

  void attachAll(Iterable<T> entries) {
    for (var entry in entries) {
      attachLast(entry);
    }
  }

  void remove(T entry) {
    for (var element in _list) {
      if (element.value == entry) {
        element.unlink();
        if (element.attached) {
          element.value.dispose();
        }
        break;
      }
    }
  }

  void clear() {
    for (var element in _list) {
      if (element.attached) {
        element.value.dispose();
      }
      element.unlink();
    }
  }

  @override
  bool contains(Object? entry) => _list.any((element) => element.value == entry);
  @override
  Iterator<T> get iterator => _list.map((e) => e.value as T).iterator;
  @override
  int get length => _list.length;
  @override
  T get first => _list.first.value as T;
  @override
  T get last => _list.last.value as T;
  @override
  bool get isEmpty => _list.isEmpty;
  @override
  bool get isNotEmpty => _list.isNotEmpty;
  @override
  T get single => _list.single.value as T;
  @override
  void forEach(void Function(T entry) action) {
    for (var element in _list) {
      action(element.value as T);
    }
  }

  @override
  Result<Disposable> attach<R>({required R value, required void Function(R) function}) {
    return heart.attach(value: value, function: function);
  }
}

final class _DisposableLinkedListEntry extends LinkedListEntry<_DisposableLinkedListEntry> {
  final Disposable value;
  final bool attached;

  _DisposableLinkedListEntry({required this.value, required this.attached}) {
    if (value is ILifecycleScope) {
      (value as ILifecycleScope).onDispose(() => unlink());
    } else if (value is WithLifecycleScope) {
      (value as WithLifecycleScope).heart.onDispose(() => unlink());
    }
  }
}
