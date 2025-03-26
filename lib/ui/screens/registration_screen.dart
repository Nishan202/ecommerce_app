import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/signup/register_bloc.dart';
import 'package:shopping_application/ui/widgets/custom_button.dart';
import 'package:shopping_application/ui/widgets/custom_textfield.dart';
import '../../bloc/signup/register_event.dart';
import '../../bloc/signup/register_state.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
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
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please register your account to sign in',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  labelText: 'Name',
                  controller: _nameController,
                  placeholder: 'Enter your full name',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Name textfield can't empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: _emailController,
                  labelText: 'Email',
                  placeholder: 'Enter email address',
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
                  controller: _phoneNoController,
                  labelText: 'Phone No',
                  placeholder: 'Enter phone no',
                  inputType: TextInputType.number,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Phone no textfield can't empty";
                    } else if (value.length != 10) {
                      return "Phone no length should be 10";
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
                      return "Password textfield can't by empty";
                    } else if (value!.length <= 6) {
                      return "Password should be greater than 6 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (ctx, state) {
                    if (state is RegisterLoadingState) {
                      isLoading = true;
                      setState(() {});
                    }
                    if (state is RegisterErrorState) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }

                    if (state is RegisterLoadedState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('User Registered successfully')));
                      Navigator.pop(context);
                    }
                  },
                  child: CustomButton(
                      loading: isLoading,
                      title: 'SignUp',
                      onClick: () {
                        if (mKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(RegisterUserEvent(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              phoneNo: int.parse(_phoneNoController.text)));
                        }
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in',
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
