import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/feature/ai/face%20reconation%20view/photo_api.dart';
import 'package:home_x/feature/ai/visitor%20name/name_text.dart';

class VisitorContainer extends StatelessWidget {
  const VisitorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),

            height: 130,
            width: 170,
            // clipBehavior: Clip.none,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),

              //  border: BoxBorder(),
            ),
            child: ApiPhoto(
              url: 'https://facerec-with-image.onrender.com/face_recognition',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NameText(
            textStyle:
                StylesApp.font15Madiam.copyWith(color: AppColors.lightBlue),
          ),
        ],
      ),
    );
  }
}
