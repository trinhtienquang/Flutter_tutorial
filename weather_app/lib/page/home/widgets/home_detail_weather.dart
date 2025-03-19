import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({
    super.key,
    required this.windSpeed,
    required this.humidity,
  });

  final num windSpeed;
  final num humidity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/Vector-1.png'),
            Text(
              '${windSpeed}km/h',
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '${humidity}%',
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
