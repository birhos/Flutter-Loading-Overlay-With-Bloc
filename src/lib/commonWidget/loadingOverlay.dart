import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool show;
  final Widget backgroundChild;
  final Widget foregroundChild;

  const LoadingOverlay({
    Key key,
    @required this.show,
    @required this.backgroundChild,
    @required this.foregroundChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backgroundChild,
          if (show) ...[
            foregroundChild,
          ],
        ],
      ),
    );
  }
}

class BusyOverlayShowWidget extends StatelessWidget {
  final String title;
  final Color maskColor;
  final bool userInteractions;

  const BusyOverlayShowWidget({
    Key key,
    this.title,
    this.maskColor,
    this.userInteractions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: userInteractions,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: maskColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // ************************** **************************

            Center(
              child: SizedBox(
                width: 6.5 * (MediaQuery.of(context).size.width / 100),
                height: 6.5 * (MediaQuery.of(context).size.width / 100),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    accentColor: Color.fromARGB(255, 21, 180, 224),
                  ),
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),

            // ************************** **************************

            SizedBox(
              height: 5.0 * (MediaQuery.of(context).size.width / 100),
            ),

            // ************************** **************************

            Text(
              title,
              style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 2.5 * (MediaQuery.of(context).size.width / 100),
                  ),
            ),

            // ************************** **************************
          ],
        ),
      ),
    );
  }
}
