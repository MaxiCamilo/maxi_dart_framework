import 'package:maxi_dart_framework/maxi_dart_framework.dart';

const String prefixLocalRoute = '%local%';

final class ResolveAddress extends Logic<String> {
  final String path;

  const ResolveAddress({required this.path});

  @override
  Result<String> performExecution(ILifecycleScope scope) => resultScopeValue(() {
    if (path.isEmpty || path == prefixLocalRoute) {
      return ObtainAppAddress().run(scope).$;
    }

    final destilate = path.replaceAll('\\', '/');

    if (isWindowsPlatform && destilate.length >= 3 && destilate[1] == ':' && destilate[2] == '/') {
      return destilate;
    }

    if (destilate.startsWith('./')) {
      return ObtainAppAddress().run(scope).$ + destilate.substring(2);
    }

    if (destilate.startsWith(prefixLocalRoute)) {
      return ObtainAppAddress().run(scope).$ + destilate.substring(prefixLocalRoute.length);
    }

    if (destilate[0] != '/') {
      return '${ObtainAppAddress().run(scope).$}/$destilate';
    }

    return destilate;
  });
}
