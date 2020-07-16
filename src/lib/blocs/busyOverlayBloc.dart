import 'dart:async';

import 'package:flutter/material.dart';

class BusyOverlayModel {
  final bool show;
  final Widget showWidget;

  const BusyOverlayModel({
    this.show,
    this.showWidget,
  });
}

class BusyOverlayBloc {
  BusyOverlayModel defaultModel = BusyOverlayModel(
    show: false,
    showWidget: Container(),
  );

  final StreamController<BusyOverlayModel> _streamController =
      StreamController<BusyOverlayModel>.broadcast();

  Stream<BusyOverlayModel> get stream => _streamController.stream;

  void show({Widget showWidget}) {
    _streamController.sink.add(
      BusyOverlayModel(
        show: true,
        showWidget: showWidget,
      ),
    );
  }

  void hide() {
    _streamController.sink.add(
      BusyOverlayModel(
        showWidget: Container(),
        show: false,
      ),
    );
  }

  void dispose() {
    _streamController?.close();
  }
}
