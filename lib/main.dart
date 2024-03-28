import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/bloc/counter_bloc.dart';
import 'package:flutter_bloc_learning/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> CounterCubit()),
        BlocProvider(create: (_)=> CounterBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
   const MyHomePage({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    final counterBlocInstance = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,int>(
              // bloc: counterCubitInstance,
              builder: (context,value) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBlocInstance.add(CounterIncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: () => counterBlocInstance.add(CounterDecrementEvent()),
            tooltip: 'decrement',
            child: const Icon(Icons.minimize),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: () => counterBlocInstance.add(CounterResetEvent()),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
