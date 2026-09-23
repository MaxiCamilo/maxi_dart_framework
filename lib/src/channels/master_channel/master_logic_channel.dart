import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class MasterLogicChannel<R, S> {
  Result<void> publishItem(S item);
  Result<void> followerPublishItem(R item);

  Result<Stream<S>> getStreamFromFollowers();
}