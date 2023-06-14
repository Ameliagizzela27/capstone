import 'package:bloc/bloc.dart';

class LokasiSawahBloc extends Cubit<Map<String, String>> {
  LokasiSawahBloc()
      : super({
          'id': '',
        });

  changeId(String id) {
    emit({
      'id': id,
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }

  @override
  void onChange(Change<Map<String, String>> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
