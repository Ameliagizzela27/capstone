import 'package:bloc/bloc.dart';

class UpdatePenyakitBloc extends Cubit<Map> {
  UpdatePenyakitBloc()
      : super({
          'waktu': '',
          'ketPenyakit': '',
          'penyakitId': '',
          'kegiatanSawahId': '',
          'ksPenyakitId': ''
        });

  changeInit(String waktu, String ketPenyakit, String penyakitId,
      String kegiatanSawahId, String ksPenyakitId) {
    emit({
      'waktu': waktu,
      'ketPenyakit': ketPenyakit,
      'penyakitId': penyakitId,
      'kegiatanSawahId': kegiatanSawahId,
      'ksPenyakitId': ksPenyakitId
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
