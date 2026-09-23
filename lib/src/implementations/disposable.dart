abstract interface class Disposable {
  void dispose();
}

mixin DisposableMixin implements Disposable {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  void performDisposal();

  @override
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;
      performDisposal();
    }
  }

  
}




