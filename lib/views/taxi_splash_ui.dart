import 'package:flutter/material.dart';
import 'package:flutter_app_6219410010/views/taxi_cal_ui.dart';

class TaxiSplashUI extends StatefulWidget {
  const TaxiSplashUI({Key? key}) : super(key: key);

  @override
  State<TaxiSplashUI> createState() => _TaxiSplashUIState();
}

class _TaxiSplashUIState extends State<TaxiSplashUI> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TaxiCalUI(),
        ),
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow,
              Colors.green,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/banner.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Text(
                'Taxi Price Calculator',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
