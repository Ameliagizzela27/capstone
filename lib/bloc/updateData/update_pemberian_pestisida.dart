import 'package:bloc/bloc.dart';

class UpdatePemberianPestisidaBloc extends Cubit<Map> {
  UpdatePemberianPestisidaBloc()
      : super({
          'kegiatanSawahId': '',
          'pestisidaId': '',
          'ketPestisida': '',
          'jmlPestisida': '',
          'waktu': '',
          'ksPestisidaId': ''
        });

  changeInit(String kegiatanSawahId, String pestisidaId, String ketPestisida,
      int jmlPestisida, String waktu, String ksPestisidaId) {
    emit({
      'kegiatanSawahId': kegiatanSawahId,
      'pestisidaId': pestisidaId,
      'ketPestisida': ketPestisida,
      'jmlPestisida': jmlPestisida,
      'waktu': waktu,
      'ksPestisidaId': ksPestisidaId
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
