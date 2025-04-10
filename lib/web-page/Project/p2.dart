import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool isPhoneLogin = false;
  bool showOtpField = false;
  String verificationId = '';

  void _toggleLoginMode() {
    setState(() {
      isPhoneLogin = !isPhoneLogin;
      showOtpField = false;
      _emailPhoneController.clear();
      _passwordController.clear();
      _otpController.clear();
    });
  }