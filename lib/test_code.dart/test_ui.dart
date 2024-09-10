import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 
  bool isled = false;
  //final DatabaseReference ref = FirebaseDatabase.instance.ref("esp1/");
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IOT App',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: isled
                  ? const Icon(Icons.lightbulb, size: 100, color: Colors.amber)
                  : const Icon(Icons.lightbulb_outline,
                      size: 100, color: Colors.red)),
          const SizedBox(
            height: 20,
          ),
        
          Center(
            child: MaterialButton(
              color: Colors.green,
              // color: ledStatus == 0 ? Colors.green : Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isled ? 'Led off' : 'Led on',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                
                isled = !isled;
                int ledStatus = isled ? 1 : 0;
                //  Reception led
                // ref.child("leds/reception/").update({"state": ledStatus});   
               // ref.update({"state": ledStatus});
              // ref.child("leds/office/").update({"state": ledStatus});
              //  ref.update({"state": ledStatus});
                setState(() {});
                print(ledStatus);
              },
            ),
          ),
        ],
      ),
    );
  }
}
 //final DatabaseReference ref = FirebaseDatabase.instance.ref("led/");
   // String url = "https://cook-f928b-default-rtdb.firebaseio.com/";
  //  DatabaseReference ref = FirebaseDatabase.instanceFor(
  //         app: Firebase.app(),
  //         databaseURL:"https://cook-f928b-default-rtdb.firebaseio.com/")
  //     .ref("led/state/");

   // void checkDatabaseConnection() {
  //   FirebaseDatabase.instance
  //       .ref()
  //       .child('led')
  //       .onValue
  //       .listen((event) {
  //     if (event.snapshot.value == true) {
  //       print('App is connected to Firebase Realtime Database.');
  //     } else {
  //       print('App is not connected to Firebase Realtime Database.');
  //     }
  //   });
  // }
