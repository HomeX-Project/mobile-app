import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/widgets/custom_material_bottons.dart';
import 'package:home_x/feature/ai/lifestream/web_view.dart';
import 'package:home_x/feature/ai/visitor%20screen/visitor_screen.dart';
import 'package:home_x/feature/homes/home_feature/notifications/notifications.dart';

class LifeStreamScreen extends StatefulWidget {
  const LifeStreamScreen({super.key});

  @override
  State<LifeStreamScreen> createState() => _LifeStreamScreenState();
}

class _LifeStreamScreenState extends State<LifeStreamScreen> {
  final DatabaseReference ref =
      FirebaseDatabase.instance.ref().child('esp1/ultrasonic');

  int ultrasonic = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DatabaseEvent>(
      stream: ref.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data?.snapshot.value;
          if (data != null && data is Map) {
            // Assuming that state 1 means true
            if (ultrasonic == 1) {
              print('Buzzer is active, sending notification');
              LocalNotification.basicNotification(
                  'Bathroom ⛽',
                  'Bathroom gas leak detected',
                  'lib/feature/ai/visitor screen/visitor_screen.dart');
            }
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        )),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none_outlined,
                          color: Color(0xff2CA9BC),
                          size: 24,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Outdoor",
                  style: TextStyle(
                    color: Color(0xff5E97DA),
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Webview(
                    url: "http://192.168.38.202/mjpeg/1",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Gate",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff5E97DA),
                        )),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          backgroundColor: Color(0xff588DCC),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text("open",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )),
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomMaterialBottons(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => VisitorScreen()));
                  },
                  text: "See Visitor",
                  backgroundBottonsColors: Color.fromARGB(255, 135, 188, 252),
                  bourderRedias: 20,
                  width: 180,
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
    ));
  }
}
