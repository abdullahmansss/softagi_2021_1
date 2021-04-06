abstract class TodoStates {}

class TodoInitialState extends TodoStates {}

class TodoChangeBottomNavState extends TodoStates {}

class TodoCreateDatabaseSuccessState extends TodoStates {}

class TodoCreateDatabaseErrorState extends TodoStates {}

class TodoGetDatabaseSuccessState extends TodoStates {}

class TodoGetDatabaseErrorState extends TodoStates {}

class TodoInsertDatabaseSuccessState extends TodoStates {}

class TodoInsertDatabaseErrorState extends TodoStates {}

class TodoUpdateDatabaseSuccessState extends TodoStates {}

class TodoUpdateDatabaseErrorState extends TodoStates {}

class TodoDeleteDatabaseSuccessState extends TodoStates {}

class TodoDeleteDatabaseErrorState extends TodoStates {}