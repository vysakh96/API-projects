import 'package:flutter/material.dart';

import 'package:weather_app_advanced/designs/api_request.dart';

import 'package:weather_app_advanced/designs/api_store.dart';

import 'search_page.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  String search;
  Home(this.search);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherData weather = new WeatherData();
  Store storeWeather = new Store();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  void getWeather() async {
    storeWeather = await weather.getWeatherData(widget.search);
    // print(storeWeather.conditions);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.blueGrey]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            storeWeather.time,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 30,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      widget.search,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      storeWeather.conditions,
                      style: TextStyle(fontSize: 28, color: Colors.white70),
                    ),
                  )),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https:${storeWeather.conditionIcon.toString()}"),
                    )
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 10),
              //     child: Stack(
              //       children: [
              //         Icon(
              //           Icons.sunny,
              //           color: Colors.yellow,
              //           size: 65,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 30),
              //           child: Icon(
              //             Icons.cloud,
              //             color: Colors.white.withOpacity(.9),
              //             size: 55,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '${storeWeather.temp_c}°',
                      style: TextStyle(fontSize: 90, color: Colors.white),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'Weather details',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 10 / 6),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'latitude',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Text(
                          '${storeWeather.lat}°',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'longitude',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Text(
                          '${storeWeather.lon}°',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'feels like',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Text(
                          '${storeWeather.feels}°',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'fahrenheit',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Text(
                          '${storeWeather.temp_f}°',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'humidity',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storeWeather.humidity.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'wind',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storeWeather.wind.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'km/h',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'visibility',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storeWeather.visibility.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'km',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'pressure',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storeWeather.pressure.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'hpa',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
