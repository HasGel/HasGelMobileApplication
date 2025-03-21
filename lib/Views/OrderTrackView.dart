import 'package:flutter/cupertino.dart';

class OrderTrackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Order'),
      ),
      child: Center(child: Text('Order Tracking Screen')),
    );
  }
}