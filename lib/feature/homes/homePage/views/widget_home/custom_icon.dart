import 'package:flutter/material.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/feature/homes/weather/weather_widget.dart';
import 'package:home_x/feature/profile/edit_screen.dart';
import 'package:home_x/feature/setting/setting.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
          //  Scaffold.of(context).openDrawer();
           Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Setting(
              //  user: Api.me!,
              ))
           );
          },
          icon: const Icon(Icons.menu, size: 30, color: Color(0xff8593E3),),
        ),
       // Weather(
       //   cityName: "",
       // ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined, size: 36 , 
          color: Color(0xff7885FF),),
        ),
      ],
    );
  }
}
