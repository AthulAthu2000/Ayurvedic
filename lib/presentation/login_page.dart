import 'package:ayurvedic_centre/domain/provider/auth_provider.dart';
import 'package:ayurvedic_centre/presentation/constants/colors.dart';
import 'package:ayurvedic_centre/presentation/constants/textstyle.dart';
import 'package:ayurvedic_centre/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(text: 'test_user');
  final _passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset(
                "assets/bg/bg.jpg",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Image.asset(scale: 5, "assets/icon/icon.png"),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40,
              ),
              child: Column(
                children: [
                  Text(
                    "Login or register to book your appointments",
                    style: AppTextStyles.contentstyle,
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: _usernameController,
                    labelText: "Email",
                    hintText: "Enter your Email",
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: "Password",
                    hintText: "Enter your Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 60),
                  Consumer<AuthProvider>(
                    builder: (context, auth, child) {
                      if (auth.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          auth
                              .login(
                                _usernameController.text,
                                _passwordController.text,
                              )
                              .then((_) {
                                if (auth.token != null) {
                                  // Navigate to the next screen on success
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed('/home');
                                } else {
                                  // Show a snackbar or alert for login failure
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Login failed. Please try again.',
                                      ),
                                    ),
                                  );
                                }
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60),
                          backgroundColor: AppColors.iconcolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: AppTextStyles.mainButtonstyle,
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  Text(
                    "By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy.",
                    style: AppTextStyles.hintstyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
