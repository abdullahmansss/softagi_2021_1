import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/modules/counter_screen/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  //CounterCubit cu = BlocProvider.of(context);

  int counter = 2;

  void minus()
  {
    counter--;
    emit(CounterMinusState());
  }

  void plus()
  {
    counter++;
    emit(CounterPlusState('Hello From Cubit'));
  }

  void reset()
  {
    counter = 0;
    emit(CounterResetState());
  }
}