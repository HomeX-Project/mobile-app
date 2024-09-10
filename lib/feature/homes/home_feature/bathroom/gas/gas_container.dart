import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/homes/home_feature/notifications/notifications.dart';

class GasContainer extends StatefulWidget {
  const GasContainer({Key? key}) : super(key: key);

  @override
  State<GasContainer> createState() => _GasContainerState();
}

class _GasContainerState extends State<GasContainer> {
  final DatabaseReference _gasRef =
      FirebaseDatabase.instance.ref().child('esp1/sensors');
  String _gasValue = 'Loading...';
  bool bazer = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: _gasRef.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data?.snapshot.value;
          if (data != null && data is Map) {
            _gasValue = data['gas'];
            print(bazer);
            bazer = (data['gasBuzzer']['state'] >=
                1); // Assuming that state 1 means true
            if (bazer) {
              print('Buzzer is active, sending notification');
              LocalNotification.basicNotification(
                  'Bathroom ⛽', 'Bathroom gas leak detected',
                  'lib/feature/homes/home_feature/bathroom/gas/gas_container.dart');
            }
          }
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            height: 190,
            width: 174,
            child: Stack(
              children: [
                Positioned(top: 0, right: 0, child: SVGImges().gasEllipse),
                Positioned(
                  top: 30,
                  right: 15,
                  child: Text(
                    _gasValue,
                    style: StylesApp.font28Madiam.copyWith(fontSize: 22),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Row(
                    children: [
                      Text(
                        'Safe',
                        style: StylesApp.font28Madiam.copyWith(
                          fontSize: 12,
                          color: AppColors.babyblue,
                        ),
                      ),
                      SVGImges().bazer,
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 20,
                  child: Text(
                    'Gas ratio',
                    style: StylesApp.font28Madiam.copyWith(fontSize: 16),
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

        // if (snapshot.hasData) {
        //   // final data = snapshot.data!.snapshot.value;
        //   // _gasValue = data.toString();
        //   final Map data = snapshot.data?.snapshot.value as Map;
        //   _gasValue = data['gas'].toString();
        //   bazer = data['gasBuzzer'] as bool;
        //   if (bazer) {
        //     // sendNotification('Notification Title 1', 'Notification Body 1');
        //     // Notifications().send('Warning', 'buzzer is ring!!!');
        //     LocalNotification.basicNotification();
        //   }
        //   // else {
        //   //   // sendNotification('Notification Title 2', 'Notification Body 2');
        //   // }