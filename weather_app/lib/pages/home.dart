import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String tempString;
  String country;
  String time;
  String condition;
  String icon;

  Home({
    Key? key,
    required this.tempString,
    required this.country,
    required this.time,
    required this.condition,
    required this.icon,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String timeString = widget.time;
    String hourString = timeString.substring(0, 2);
    int daytimeStartHour = 6;
    int daytimeEndHour = 18;
    //DateTime dateTime = DateTime.parse(timeString);
    //int hour = dateTime.hour;

    if (hourString.endsWith(":")) {
      hourString = hourString.substring(0, hourString.length - 1);
    }

    int currentHour = int.parse(hourString);
    print("The hour is: $currentHour");

    String bgImg = 'assets/morning.png';
    Color? bgColor;

    // Check if the current hour is within the daytime range
    if (currentHour >= daytimeStartHour && currentHour < daytimeEndHour) {
      bgImg = 'assets/day.png';
      bgColor = Color.fromARGB(255, 135, 195, 195);
    } else {
      bgImg = 'assets/night.png';
      bgColor = Color.fromARGB(255, 4, 113, 137);
    }
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 70,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Current Time',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            '${widget.time}',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[200],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 70,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '${widget.country}',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('')
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //color: Colors.green,
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets${widget.icon}',
                        //'assets/64x64/day/296.png',
                        height: 100,
                        scale: 0.1,
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: 200,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${widget.tempString}',
                                style: TextStyle(
                                  fontSize: 65.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '°C',
                                style: TextStyle(
                                  fontSize: 65.0,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${widget.condition}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.0,
                ),
                Column(
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () async {
                        dynamic results =
                            await Navigator.pushNamed(context, '/location');
                        try {
                          setState(() {
                            widget.tempString = results['tempString'];
                            widget.country = results['country'];
                            widget.time = results['time'];
                            widget.condition = results['condition'];
                            widget.icon = results['icon'];
                          });
                        } on Exception catch (e) {
                          // TODO
                          print('Error: $e');
                        }
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Select Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
