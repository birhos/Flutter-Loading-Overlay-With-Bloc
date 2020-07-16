import 'package:get_it/get_it.dart';

import 'package:example/blocs/busyOverlayBloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(BusyOverlayBloc());
}
