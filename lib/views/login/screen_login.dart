import 'package:api_task/bloc/login/loginbloc_bloc.dart';
import 'package:api_task/repo/authentication.dart';
import 'package:api_task/utils/utils.dart';
import 'package:api_task/utils/validations.dart';
import 'package:api_task/views/home/screen_home.dart';
import 'package:api_task/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final TextEditingController userName = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            ),
          );
        } else if (state is LoginBlocErrorState) {
          customSnackbar(context, 'invalid credentials', red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hintText: 'UserName',
                    controller: userName,
                    validator: validatefields,
                  ),
                  kheight20,
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    validator: validatefields,
                  ),
                  kheight50,
                  BlocBuilder<LoginblocBloc, LoginblocState>(
                    builder: (context, state) {
                      if (state is LoginblocLoading) {
                        return loadingButton(
                          media: media,
                          onPressed: () {},
                          color: kPrimaryColor,
                        );
                      }
                      return customButton(
                        media: media,
                        buttonText: 'Login',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            String email = userName.text.trim();
                            String password = passwordController.text.trim();
                            context.read<LoginblocBloc>().add(
                                  OnLoginButtonClickEvent(
                                    email: email,
                                    password: password,
                                  ),
                                );
                          }
                        },
                        color: kPrimaryColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
