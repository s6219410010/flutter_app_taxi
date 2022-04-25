import 'package:flutter/material.dart';
import 'package:flutter_app_6219410010/views/taxi_result_ui.dart';

class TaxiCalUI extends StatefulWidget {
  const TaxiCalUI({Key? key}) : super(key: key);

  @override
  State<TaxiCalUI> createState() => _TaxiCalUIState();
}

class _TaxiCalUIState extends State<TaxiCalUI> {
  TextEditingController distant_ctrl = TextEditingController();
  TextEditingController time_ctrl = TextEditingController();

  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: distant_ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'ระยะทาง (กิโลเมตร)',
                      hintStyle: TextStyle(
                        color: Colors.yellow[700],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.yellow[100],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: time_ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'เวลารถตืด (นาที)',
                      hintStyle: TextStyle(
                        color: Colors.yellow[700],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.yellow[100],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    double? money;
                    double? money_cal;
                    if (distant_ctrl.text.isEmpty) {
                      showWarningDialog(context, 'กรุณาป้อนระยะทาง');
                      return;
                    } else {
                      double? distant = double.parse(distant_ctrl.text);
                      if (distant <= 1) {
                        money = 35;
                      } else if (distant >= 2 && distant <= 10) {
                        money = (35 + (distant - 1) * 5.5);
                      } else if (distant >= 11 && distant <= 20) {
                        money = 84.5 + ((distant - 10) * 6.5);
                      } else if (distant >= 21 && distant <= 40) {
                        money = 149.5 + ((distant - 20) * 7.5);
                      } else if (distant >= 41 && distant <= 60) {
                        money = 299.5 + ((distant - 40) * 8.0);
                      } else if (distant >= 61 && distant <= 80) {
                        money = 459.5 + ((distant - 60) * 9.0);
                      } else {
                        money = 639.5 + ((distant - 80) * 10.5);
                      }
                      if (time_ctrl.text.isEmpty) {
                        money_cal = money;
                      } else
                        money_cal = money + (int.parse(time_ctrl.text) * 2);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaxiResultUI(
                          money_cal: money_cal,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      distant_ctrl.text = '';
                      time_ctrl.text = '';
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Created by SAU 6219410010',
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
