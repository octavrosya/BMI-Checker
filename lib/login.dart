import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  static const nameRoute = "/login";

  final _formKey = GlobalKey<FormState>();
  final usernameControl = TextEditingController();
  final passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String username = args['username'];
    final String password = args['password'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
        leading: const Icon(Icons.filter_vintage),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: usernameControl,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a valid username!";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.amber.shade100,
                hintText: "Username",
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordControl,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a valid password!";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.amber.shade100,
                hintText: "Password",
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
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (username == usernameControl.text &&
                        password == passwordControl.text) {
                      Navigator.of(context).pushNamed(HomePage.nameRoute,
                          arguments: usernameControl.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Incorrect username or password!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
