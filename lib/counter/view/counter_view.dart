import 'package:counter_bloc_example/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocListener<CounterBloc, int>(
        listener: (context, state) {
          if (state.isEven) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('even sighted'),
                  backgroundColor: Colors.green,
                ),
              );
          }
          if (state.isOdd) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('odd sighted'),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        child: Center(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text('$state', style: textTheme.headline2);
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context)..add(Increment())),
          const SizedBox(height: 8),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context)..add(Decrement())),
        ],
      ),
    );
  }
}
