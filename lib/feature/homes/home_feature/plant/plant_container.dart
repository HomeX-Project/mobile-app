import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/homes/home_feature/notifications/notifications.dart';

class PlantContainer extends StatefulWidget {
  const PlantContainer({Key? key}) : super(key: key);

  @override
  State<PlantContainer> createState() => _PlantContainerState();
}

class _PlantContainerState extends State<PlantContainer> {
  final DatabaseReference _sensorsRef =
      FirebaseDatabase.instance.ref().child('esp1/sensors');
  int _pumpValue = 0;
  int _soilValue = 0;
  bool isled = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: _sensorsRef.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          final DataSnapshot dataSnapshot = snapshot.data!.snapshot;
          if (!dataSnapshot.exists) {
            return const Text('No data available');
          }
          final Map<dynamic, dynamic> data = dataSnapshot.value as Map;
          if (data == null || !data.containsKey('soilstate')) {
            return const Text('Invalid data structure');
          }
          final soilState = data['soilstate'];
          _pumpValue = soilState != null ? soilState['state'] : 0;
          _soilValue = data['soil'] ?? 0;

          if (_pumpValue >= 1) {
            print('Buzzer is active, sending notification');
            LocalNotification.basicNotification(
                'Garden 🪴',
                'Garden soil is dry',
                'lib/feature/homes/home_feature/plant/plant_container.dart');
          }

          return Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/common_vector.svg',
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xff2CA9BC),
                      size: 24,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: Color(0xff2CA9BC),
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Garden",
                    style: TextStyle(
                      color: Color(0xff5E97DA),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 220,
                width: 240,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SVGImges().plantEllipse,
                    ),
                    Positioned(
                      top: 30,
                      right: 25,
                      child: SVGImges().plant,
                    ),
                    Positioned(
                      bottom: 45,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Soil Moisture',
                            style: StylesApp.font28Madiam.copyWith(fontSize: 16),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            _soilValue >= 50 ? 'low' : 'moistured',
                            style: StylesApp.font28Madiam.copyWith(
                              fontSize: 16,
                              color: AppColors.babyblue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Water Pump',
                            style: StylesApp.font28Madiam.copyWith(fontSize: 16),
                          ),
                          const SizedBox(width: 40),
                          Transform.scale(
                            scaleX: .9,
scaleY: .8,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                isled = !isled;
                                int ledStatus = isled ? 1 : 0;
                                _sensorsRef.update({"soilstate/": ledStatus});
                                setState(() {
                                  isSwitched = value;
                                });
                                print(ledStatus);
                              },
                              inactiveThumbColor: Colors.white,
                              thumbColor: !isSwitched
                                  ? const MaterialStatePropertyAll<Color>(
                                      AppColors.babyblue)
                                  : const MaterialStatePropertyAll<Color>(
                                      AppColors.babyblue),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              trackOutlineColor:
                                  const MaterialStatePropertyAll<Color>(
                                      AppColors.lightGrey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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