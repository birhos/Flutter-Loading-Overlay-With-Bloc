import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:example/locator.dart';
import 'package:example/app/homePage.dart';
import 'package:example/blocs/busyOverlayBloc.dart';
import 'package:example/commonWidget/loadingOverlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Busy Overlay Example',
      home: OverlayPage(),
    );
  }
}

final BusyOverlayBloc busyOverlayBloc = locator<BusyOverlayBloc>();

class OverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: busyOverlayBloc.stream,
      initialData: busyOverlayBloc.defaultModel,
      builder:
          (BuildContext context, AsyncSnapshot<BusyOverlayModel> snapshot) {
        final BusyOverlayModel snapshotData = snapshot.data;

        return LoadingOverlay(
          show: snapshotData.show,
          foregroundChild: snapshotData.showWidget,
          backgroundChild: HomePage(),
        );
      },
    );
  }
}
