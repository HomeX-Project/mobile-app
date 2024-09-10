import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/homes/home_feature/notifications/notifications.dart';


class TempContainer extends StatefulWidget {
  const TempContainer({Key? key}) : super(key: key);

  @override
  State<TempContainer> createState() => _TempContainerState();
}

class _TempContainerState extends State<TempContainer> {
  final DatabaseReference _tempRef =
      FirebaseDatabase.instance.ref().child('esp1/sensors');
  String _tempValue = 'Loading...';
  bool bazer = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: _tempRef.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.snapshot.value;
          if (data != null && data is Map) {
            _tempValue = data['lm'].toString();
            print(bazer);
            bazer = (data['TemBuzzer']['state'] >=
                1); // Assuming that state 1 means true
            if (bazer) {
              print('Buzzer is active, sending notification');
              LocalNotification.basicNotification(
                  'Kitchen🔥', 'Kitchen temp is high', 'lib/feature/homes/home_feature/kitchen/temp/temp_container.dart');
            }
          }

          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            height: 200,
            width: 174,
            child: Stack(
              children: [
                Positioned(top: 0, right: 0, child: SVGImges().tempEllipse),
                Positioned(top: 0, right: 0, child: SVGImges().tempEllipse),
                Positioned(
                  top: 50,
                  right: 30,
                  child: Text(
                    '$_tempValue°',
                    style: StylesApp.font28Madiam.copyWith(fontSize: 22),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 15,
                    child: Row(
                      children: [
                        Text(
                          'Safe',
                          style: StylesApp.font28Madiam.copyWith(
                              fontSize: 12, color: AppColors.babyblue),
                        ),
                        SVGImges().temp,
                      ],
                    )),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Text(
                    'Temp',
                    style: StylesApp.font28Madiam.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}
