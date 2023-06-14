import 'package:bloc/bloc.dart';

class KegiatanPertanianBloc extends Cubit<Map<String, String>> {
  KegiatanPertanianBloc()
      : super({
          'id': '',
        });

  changeId(String id) {
    emit({
      'id': id,
    });
  }

  @override
  void onChange(Change<Map<String, String>> change) {
    // TODO: implement onChange
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
