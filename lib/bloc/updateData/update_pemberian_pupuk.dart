import 'package:bloc/bloc.dart';

class UpdatePemberianPupukBloc extends Cubit<Map> {
  UpdatePemberianPupukBloc()
      : super({
          'kegiatanSawahId': '',
          'pupukId': '',
          'ketPupuk': '',
          'jmlPupuk': '',
          'waktu': '',
          'ksPupukId': ''
        });

  changeInit(String kegiatanSawahId, String pupukId, String ketPupuk,
      int jmlPupuk, String waktu, String ksPupukId) {
    emit({
      'kegiatanSawahId': kegiatanSawahId,
      'pupukId': pupukId,
      'ketPupuk': pupukId,
      'jmlPupuk': jmlPupuk,
      'waktu': waktu,
      'ksPupukId': ksPupukId
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
