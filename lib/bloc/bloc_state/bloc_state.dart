abstract class BlocState {}

class InitializeBlocState extends BlocState {}

class BlocStateHappened extends BlocState {}

class BlocStateDecrease extends BlocState {}

class BlocStateIncrease extends BlocState {}

class ChangeMapLocation extends BlocState {}
