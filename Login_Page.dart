import 'package:flutter/material.dart';
import 'package:flutter_application_1/project_app/About_Us%20.dart';

import 'package:flutter_application_1/project_app/layout_screen.dart';
 // Import About Us page

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            _buildFoodIcons(),
            const SizedBox(height: 30),
            _buildSignUpSection(context),
            const SizedBox(height: 20),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.local_pizza, size: 50, color: Colors.white),
        SizedBox(height: 20),
        Icon(Icons.food_bank, size: 50, color: Colors.yellow),
        SizedBox(height: 20),
        Icon(Icons.icecream, size: 50, color: Colors.deepPurple),
        SizedBox(height: 20),
        Icon(Icons.dinner_dining, size: 50, color: Colors.white),
        SizedBox(height: 20),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(Icons.pets, size: 30, color: Colors.brown),
        ),
      ],
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Sign up or log in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Sign up to get your discount",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          _buildLoginButton("Continue with Facebook", Colors.blue, Icons.facebook, () {}),
          const SizedBox(height: 10),
          _buildLoginButton("Continue with Google", Colors.red, Icons.g_mobiledata, () {}),
          const SizedBox(height: 10),
          _buildLoginButton("Continue with Apple", Colors.black, Icons.apple, () {}),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(child: Divider(color: Colors.grey)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("or"),
              ),
              Expanded(child: Divider(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          _buildLoginButton("Continue with Email", Colors.pink, Icons.email, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LayoutScreen()),
            );
          }),
          const SizedBox(height: 10),
          _buildOutlineButton("Log in with phone number"),
          const SizedBox(height: 10),
          _buildLoginButton("Go to About Us", Colors.purple, Icons.info, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLoginButton(String text, Color color, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildOutlineButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "By continuing, you agree to our Terms and Conditions and Privacy Policy.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

}
