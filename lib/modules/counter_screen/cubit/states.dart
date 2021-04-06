abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterMinusState extends CounterStates {}

class CounterPlusState extends CounterStates
{
  final String text;

  CounterPlusState(this.text);
}

class CounterResetState extends CounterStates {}