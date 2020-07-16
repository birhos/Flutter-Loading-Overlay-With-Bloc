import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:example/main.dart';
import 'package:example/commonWidget/loadingOverlay.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Busy Overlay',
          style: Theme.of(context).textTheme.display1.copyWith(
                color: Colors.white,
                fontSize: 5.0 * (MediaQuery.of(context).size.width / 100),
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ************************** ************************** ************************** **************************

            RaisedButton.icon(
              color: Colors.amber,
              onPressed: () {
                busyOverlayBloc.show(
                  showWidget: BusyOverlayShowWidget(
                    title: "Loading ...",
                    maskColor: Colors.black.withOpacity(0.50),
                    userInteractions: true,
                  ),
                );
              },
              icon: Icon(
                Icons.flash_on,
                color: Colors.black,
                size: 4.5 * (MediaQuery.of(context).size.width / 100),
              ),
              label: Text(
                "Show",
                style: Theme.of(context).textTheme.display2.copyWith(
                      color: Colors.black,
                      fontSize: 3.5 * (MediaQuery.of(context).size.width / 100),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // ************************** ************************** ************************** **************************

            RaisedButton.icon(
              color: Colors.red,
              onPressed: () {
                busyOverlayBloc.hide();
              },
              icon: Icon(
                Icons.flash_off,
                color: Colors.black,
                size: 4.5 * (MediaQuery.of(context).size.width / 100),
              ),
              label: Text(
                "Hide",
                style: Theme.of(context).textTheme.display2.copyWith(
                      color: Colors.black,
                      fontSize: 3.5 * (MediaQuery.of(context).size.width / 100),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // ************************** ************************** ************************** **************************
          ],
        ),
      ),
    );
  }
}
