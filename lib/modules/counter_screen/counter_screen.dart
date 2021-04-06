import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/modules/counter_screen/cubit/cubit.dart';
import 'package:softagi_2021/modules/counter_screen/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class CounterScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if(state is CounterMinusState)
          {
            print('minus state');
          }

          if(state is CounterPlusState)
          {
            print(state.text);
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Container(
                        width: 120.0,
                        child: defaultButton(
                          whenPress: ()
                          {
                            CounterCubit.get(context).minus();
                          },
                          text: 'minus',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${CounterCubit.get(context).counter}',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 120.0,
                        child: defaultButton(
                          whenPress: ()
                          {
                            CounterCubit.get(context).plus();
                          },
                          text: 'plus',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 120.0,
                    child: defaultButton(
                      whenPress: ()
                      {
                        CounterCubit.get(context).reset();
                      },
                      text: 'reset',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

