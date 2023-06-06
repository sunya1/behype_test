import 'package:flutter/cupertino.dart';

class AppLoaderWidget extends StatelessWidget {
  final Color? color;
  const AppLoaderWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 22,
        width: 22,
        child: CupertinoActivityIndicator(
          color: color,
          radius: 14,
        ));
  }
}
