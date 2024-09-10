import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';

String dropdownValue = 'Ismailia';
const List<String> governorates = <String>[
  'Alexandria',
  'Aswan',
  'Asyut',
  'Beheira',
  'Beni Suef',
  'Cairo',
  'Dakahlia',
  'Damietta',
  'Faiyum',
  'Gharbia',
  'Giza',
  'Ismailia',
  'Kafr El Sheikh',
  'Luxor',
  'Matruh',
  'Minya',
  'Monufia',
  'New Valley',
  'North Sinai',
  'Port Said',
  'Qalyubia',
  'Qena',
  'Red Sea',
  'Sharqia',
  'Sohag',
  'South Sinai',
  'Suez',
];

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    print(dropdownValue);
    return SizedBox(
      width: 319,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(
          Icons.location_on_outlined,
          color: AppColors.blue,
        ),
        elevation: 16,
        style: TextStyle(color: AppColors.blue),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(22)),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: governorates.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
