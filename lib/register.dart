import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static const nameRoute = "/register";
  final _formKey = GlobalKey<FormState>();
  final usernameControl = TextEditingController();
  final passwordControl = TextEditingController();
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("REGISTER"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/wellcome.png"),
              TextFormField(
                controller: usernameControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Buat Username !";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                controller: passwordControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Buat Password Dahulu Beb";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    username = usernameControl.text;
                    password = passwordControl.text;
                    // Navigate to Login Page
                    Navigator.of(context).pushNamed(
                      LoginPage.nameRoute,
                      arguments: {'username': username, 'password': password},
                    );
                  }
                },
                child: Text(
                  "REGISTER",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
