import 'package:api_task/bloc/login/loginbloc_bloc.dart';
import 'package:api_task/repo/authentication.dart';

import 'package:api_task/utils/utils.dart';
import 'package:api_task/views/home/screen_home.dart';
import 'package:api_task/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final TextEditingController userName = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocConsumer<LoginblocBloc, LoginblocState>(
      listener: (context, state) {
        if (state is LoginblockSuccesState) {
          print(token);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenHome(),
              ));
        } else if (state is LoginBlocErrorState) {
          customSnackbar(context, 'error', red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(hintText: 'userName', controller: userName),
                kheight20,
                CustomTextField(
                    hintText: 'Password', controller: passwordController),
                kheight50,
                BlocBuilder<LoginblocBloc, LoginblocState>(
                  builder: (context, state) {
                    if (state is LoginblocLoading) {
                      return loadingButton(
                          media: media, onPressed: () {}, color: kPrimaryColor);
                    }
                    return customButton(
                        media: media,
                        buttonText: 'login',
                        onPressed: () {
                          context.read<LoginblocBloc>().add(
                              OnLoginButtonClickEvent(
                                  email: userName.text,
                                  password: passwordController.text));
                        },
                        color: kPrimaryColor);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
