import 'package:flutter/material.dart';
import 'package:home_x/core/util/styles.dart';

class AddTextRegisterTitle extends StatelessWidget {
  const AddTextRegisterTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
     padding:  EdgeInsets.only(left: 20.0),
     child: Text(
       "Register",
       style: StylesApp.font30SemiBold,
     ),
                    );
  }
}

