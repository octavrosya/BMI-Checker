import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  static const nameRoute = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final heightBodyControl = TextEditingController();
  final weightBodyControl = TextEditingController();
  double heightBody = 0;
  double weightBody = 0;
  double BMI = 0;
  String bmicount = "";
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    final String username = args;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("BMI CALCULATE"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              elevation: 2,
              color: Colors.blueAccent,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WELCOME",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        (username),
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      BMI == 0
                          ? Text(
                              'Score BMI',
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              BMI.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                      SizedBox(height: 20),
                      bmicount == "" ? Container() : Text(bmicount),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: heightBodyControl,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Data tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.amberAccent.shade100,
                          filled: true,
                          hintText: 'Tinggi Badan (cm)',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amberAccent.shade200,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: weightBodyControl,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Data tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.brown.shade100,
                          filled: true,
                          hintText: 'Berat Badan (kg)',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown.shade200,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            weightBody = double.parse(weightBodyControl.text);
                            heightBody = double.parse(heightBodyControl.text);
                            heightBody = heightBody / 100;
                            setState(() {
                              BMI = weightBody / (heightBody * heightBody);
                              if (BMI < 18.5) {
                                bmicount = "Under Weight";
                              } else if (BMI > 18.5 && BMI < 24.9) {
                                bmicount = "Healthy";
                              } else if (BMI > 25.0 && BMI < 29.9) {
                                bmicount = "Over Weight";
                              } else if (BMI > 30.00) {
                                bmicount = "Obese";
                              }
                            });
                          }
                        },
                        icon: Icon(Icons.calculate),
                        label: Text('COUNT'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
