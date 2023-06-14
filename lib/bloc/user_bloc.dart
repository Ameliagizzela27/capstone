import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map> {
  UserBloc()
      : super({
          'id': '',
          'username': '',
          'email': '',
          'provider': '',
        });

  inisiasiData(Map data) {
    emit({
      'id': data['id'],
      'username': data['username'],
      'email': data['email'],
      'provider': data['provider'],
    });
  }
}
