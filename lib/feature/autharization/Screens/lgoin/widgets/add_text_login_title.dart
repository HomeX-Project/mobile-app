import 'package:flutter/material.dart';
import 'package:home_x/core/util/styles.dart';

class AddTextLoginTitle extends StatelessWidget {
  const AddTextLoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Text(
        "Log In",
        style: StylesApp.font30SemiBold,
      ),
    );
  }
}
