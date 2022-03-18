import 'package:e_commercy/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Column(
            children: [
              Image.network(
                  "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg"
              ),

              Text(
                "Name"
              ),
              Text(
                "Name"
              ),
              Text(
                "Name"
              ),


            ],
          );
        },
      ),
    );
  }
}
