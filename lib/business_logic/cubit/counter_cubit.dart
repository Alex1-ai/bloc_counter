import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter/business_logic/cubit/internet_cubit.dart';
import 'package:bloc_counter/constants/enums.dart';


import 'counter_state.dart';


class CounterCubit extends Cubit<CounterState>{
  // different cubit talking to each other

  // final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;


  CounterCubit() 
      : super(CounterState(counterValue: 0)){
        // internetStreamSubscription = internetCubit.listen((internetState){
        //     if(internetState is InternetConnected && internetState.connectionType == ConnectionType.Wifi){
        //       increment();
        //     }else if (internetState is InternetConnected && internetState.connectionType == ConnectionType.Mobile){
        //       decrement();
        //     }
        // });
      }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue -1, wasIncremented: false));

  @override
  Future<void> close() {
    // TODO: implement close
    internetStreamSubscription?.cancel();
    return super.close();
  }
}