import 'package:flutter/material.dart';

class TaxiResultUI extends StatefulWidget {
  double? money_cal;

  TaxiResultUI({
    Key? key,
    this.money_cal,
  }) : super(key: key);

  @override
  State<TaxiResultUI> createState() => _TaxiResultUIState();
}

class _TaxiResultUIState extends State<TaxiResultUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Taxi App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: SingleChildScrollView(
        child: Container(
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
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'คำนวณค่าแทกซี่',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 150.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'จ่ายค่าแทกซี่เป็นจำนวณเงิน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  widget.money_cal!.toStringAsFixed(2),
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 255, 102),
                    fontSize: 65,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'บาท',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
