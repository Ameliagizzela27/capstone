import 'package:bloc/bloc.dart';

class CustomBloc extends Cubit<String> {
  CustomBloc() : super('');

  changeVal(val) {
    emit(val);
  }
}
