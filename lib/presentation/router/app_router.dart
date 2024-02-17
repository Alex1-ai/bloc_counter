import 'package:bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import  'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter{

  // final CounterCubit _counterCubit = new CounterCubit();

  Route? onGenerateRoute(RouteSettings, routeSettings){

    switch(routeSettings.name){
      case '/':
         return MaterialPageRoute(
          builder: (_)=> HomeScreen(
              title: "Home Screen",
              color: Colors.blueAccent,
            )
          );

      case '/second':
         return MaterialPageRoute(
          builder: (_)=> SeconScreen(
              title: "Home Screen",
              color: Colors.redAccent,
            )
          );

      case '/third':
         return MaterialPageRoute(
          builder: (_)=> HomeScreen(
            title: "Home Screen",
            color: Colors.orangeAccent,
          )
          );
         
       
      default:
        return null;
    }

  }

  // void dispose(){
  //   _counterCubit.close();
  // }
}