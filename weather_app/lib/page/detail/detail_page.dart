import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/page/detail/widgets/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
        ),
      ),
      child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Container(child: Text('no data'));
          }
          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              elevation: 0,
              title: Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(width: 15),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        context.read<WeatherProvider>().nameCity,
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [Icon(Icons.search), SizedBox(width: 15)],
            ),
            body: DetailBody(listData: listData),
          );
        },
      ),
    );
  }
}
