import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.nameLocation});

  final nameLocation;
  @override
  Widget build(BuildContext context) {
    final dayFormat = DateFormat('dd-MM-yyyy');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/icons/Vector.png"),
            SizedBox(width: 11),
            Text(
              nameLocation,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ],
        ),
        SizedBox(height: 17),
        Text(
          dayFormat.format(DateTime.now()),
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ],
    );
  }
}
