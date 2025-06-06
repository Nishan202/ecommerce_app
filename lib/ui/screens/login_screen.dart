import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/bloc/login/login_bloc.dart';
import 'package:shopping_application/bloc/login/login_event.dart';
import 'package:shopping_application/ui/screens/dashboard_navigation_screen.dart';
import 'package:shopping_application/ui/screens/home_screen.dart';
import 'package:shopping_application/ui/screens/registration_screen.dart';

import '../../bloc/login/login_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false;
  GlobalKey<FormState> mKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: mKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(Assets.login_screen_image, height: 170,),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Please sign in your account to get started!',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  controller: _emailController,
                  labelText: 'Email',
                  inputType: TextInputType.emailAddress,
                  validate: (value) {
                    var emailValidator = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (value!.isEmpty) {
                      return "Email textfield can't empty";
                    } else if (!emailValidator.hasMatch(value)) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: _passwordController,
                  maximumLine: 1,
                  isobscureText: !isPasswordVisible,
                  labelText: 'Password',
                  placeholder: 'Enter password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      isPasswordVisible = !isPasswordVisible;
                      setState(() {});
                    },
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: TextButton(onPressed: (){}, child: Text('Forgot password')),
                // ),
                const SizedBox(
                  height: 15,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (ctx, state) async {
                    if (state is LoginLoadingState) {
                      isLoading = true;
                      setState(() {});
                    }
                    if (state is LoginErrorState) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                    if (state is LoginLoadedState) {
                      isLoading = false;
                      // String token = state.token;
                      // print(token);
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("token", state.token);

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login successful')));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardNavigationScreen()));
                    }
                  },
                  child: CustomButton(
                      loading: isLoading,
                      title: 'Login',
                      onClick: () {
                        if (mKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginUserEvent(
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
