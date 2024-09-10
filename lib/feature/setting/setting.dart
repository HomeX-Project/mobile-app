import 'package:flutter/material.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/feature/homes/icon_navigation/icon_navigate.dart';
import 'package:home_x/feature/profile/edit_screen.dart';
import 'package:home_x/feature/setting/profile_screen.dart';



class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
        title: const Text('Setting Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop() ;
           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NavigationIcon()));
          },
        ),
      ),

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40,),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                  backgroundColor: Color(0xff5E97DA),
                  child:  IconButton(icon :Icon( Icons.person ,size: 30,color: Colors.white),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ProfileScreen(
                            user: Api.me!,
                          ))
                      );
                    }, )),
              title: const Text('Profile', style: TextStyle(
                color:Color(0xff5E97DA),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              onTap: () {
                // Navigate to profile page
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff5E97DA),
                  child: const Icon(Icons.help ,size: 30,color: Colors.white, )),
              title: const Text('Help', style: TextStyle(
                color:Color(0xff5E97DA),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              onTap: () {
                // Navigate to profile page
              },
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff5E97DA),
                    child: const Icon(Icons.info ,size: 30,color: Colors.white, )),
                title: const Text('About' , style: TextStyle(
                  color:Color(0xff5E97DA),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
                onTap: () {
                  // Navigate to profile page
                },
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout action
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
