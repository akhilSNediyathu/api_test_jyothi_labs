import 'package:api_task/bloc/fetch_contents/fetchcontents_bloc.dart';
import 'package:api_task/bloc/login/loginbloc_bloc.dart';
import 'package:api_task/views/login/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
      
        BlocProvider(
          create: (context) => LoginblocBloc(),
        ),
          BlocProvider(
          create: (context) => FetchcontentsBloc(),
        ),
      
      
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
     
        home:  ScreenLogin(),
      ),
    );
  }
}


