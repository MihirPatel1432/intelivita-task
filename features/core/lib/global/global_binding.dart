
import 'package:core/core.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<NetworkService>(NetworkService(),
        permanent: true);
    DependencyProvider.registerSingleton<SharedPreferenceService>(
        SharedPreferenceService(),
        permanent: true);
    DependencyProvider.registerSingleton<ProgressService>(ProgressService(),
        permanent: true);
  }
}
