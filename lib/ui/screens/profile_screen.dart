import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/bloc/profile/profile_bloc.dart';
import 'package:shopping_application/bloc/profile/profile_event.dart';
import 'package:shopping_application/bloc/profile/profile_state.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Profile'),
              IconButton(
                  onPressed: () async {
                    // await FirebaseAuth.instance.signOut();
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.getString('token');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: const Icon(Icons.exit_to_app_rounded)),
            ],
          )),
      body: BlocListener<ProfileBloc, ProfileState>(listener: (ctx, state){
          if (state is ProfileLoadingState) {
            isLoading = true;
            setState(() {

            });
          }
          if (state is ProfileErrorState) {
            isLoading = false;
            setState(() {

            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ProfileLoadedState) {
            isLoading = false;
            var userData = state.userDataModel.data![0];
             Column(
              children: [
                const CircleAvatar(
                  maxRadius: 50,
                  child: FlutterLogo(
                    size: 50,
                    style: FlutterLogoStyle.stacked,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Personal information',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text("Name"),
                  subtitle: Text(
                    userData.name!,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  // trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.email),
                  ),
                  title: Text("Email"),
                  subtitle: Text(
                    userData.email!,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.phone),
                  ),
                  title: Text("Phone No"),
                  subtitle: Text(
                    userData.mobileNumber!,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  // trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
