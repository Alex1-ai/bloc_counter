import 'package:bloc_counter/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/business_logic/cubit/counter_state.dart';
import 'package:bloc_counter/business_logic/cubit/internet_cubit.dart';
import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp(
    // appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final Connectivity connectivity;

  MyApp({
    Key? key,
    // required this.appRouter,
    required this.connectivity
    
    
    }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          
          create: (context)=>InternetCubit(connectivity: connectivity),

        ),
        BlocProvider<CounterCubit>(
          
          create: (context)=>
              CounterCubit(),

        ),

          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              color: Colors.blue,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),

          onGenerateRoute: _appRouter.onGenerateRoute,
              // routes: {
              //   "/": (context) => BlocProvider.value(
              //   value: _counterCubit,
              //   child: HomeScreen(title: 'HomeScreen', color: Colors.blue)),
        
                
              //   "/second": (context) => BlocProvider.value(
              //     value: _counterCubit,
              //     child: SeconScreen(title: 'Second Screen', color: Colors.redAccent)),
        
        
              //   "/third": (context) =>
              //    BlocProvider.value(
              //     value: _counterCubit,
              //     child: ThirdScreen(title: 'Third Screen', color: Colors.green)
              //    )
        
              // },
            //   home: BlocProvider<CounterCubit>(
            // create: (context) => CounterCubit(),
        
            // child: HomeScreen(title: 'Flutter Demo Home Page'),
            // ),

          ),
        );
    
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: 
      // BlocListener<CounterCubit, CounterState>(
      //    listener: (context, state) {
      //     if (state.wasIncremented == true){
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('Increment the counter '))
      //       );

      //     }
      //     else if (state.wasIncremented == false){
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('Decremented the counter '))
      //       );

      //     }
      //    },
        
      //     child:
           Center(
          
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener:(context, state) {
          if (state.wasIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Increment the counter '))
            );

          }
          else if (state.wasIncremented == false){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Decremented the counter '))
            );

          }
         } ,
                  builder: (context, state) {
                    if (state.counterValue < 0){
                      return Text(
                      " BRR, Negative "  +state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );

                    }else if (state.counterValue % 2 == 0){
                      return Text(
                      "YAAY " +state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                    } 
                    else if (state.counterValue  == 5){
                      return Text(
                      "HMM, NUMBER " +state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                    }else{
                      return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                    }
                    
                  }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,


                  children: [
                   FloatingActionButton(
                    onPressed: (){
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ), // 
                  FloatingActionButton(
                    onPressed: (){
                      
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ), // 
                  ],

                )
              ],
            ),
          )
        
      //),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  
  
  }
}
