
import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(RegisterScreen());
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return RegisterForm();

  }
}

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
        backgroundColor: Colors.red.shade200,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),


        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  prefixIcon: const Icon(Icons.person),
                ),


                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
              ),      TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                ),


                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }

                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    prefixIcon: Icon(Icons.lock)
                ),

                obscureText: true,//password hide

                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {//current state null nahi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Register Successful"),
                      ),
                    );
                  }
                },

                child: Text("Register"),
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
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
