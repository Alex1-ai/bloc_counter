import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../business_logic/cubit/counter_cubit.dart';
import '../../business_logic/cubit/counter_state.dart';



class HomeScreen extends StatefulWidget {
  final String? title;
  final Color? color;
  const HomeScreen({super.key, this.title, this.color});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title?? ""),
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
                SizedBox(
                  height: 24,
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

                ),
                SizedBox(
                  height: 24,
                ),

                MaterialButton(
                  color: widget.color,
                  onPressed: (){
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: Text("Go to Second Screen"),

                  ),

                  MaterialButton(
                  color: widget.color,
                  onPressed: (){
                    Navigator.of(context).pushNamed('/third');
                  },
                  child: Text("Go to Third Scren"),

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