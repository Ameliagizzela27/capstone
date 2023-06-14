import 'package:bloc/bloc.dart';

class UpdateHamaBloc extends Cubit<Map> {
  UpdateHamaBloc()
      : super({
          'waktu': '',
          'ketHama': '',
          'hamaId': '',
          'kegiatanSawahId': '',
          'kshamaId': ''
        });

  changeInit(String waktu, String ketHama, String hamaId,
      String kegiatanSawahId, String kshamaId) {
    emit({
      'waktu': waktu,
      'ketHama': ketHama,
      'hamaId': hamaId,
      'kegiatanSawahId': kegiatanSawahId,
      'kshamaId': kshamaId
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
