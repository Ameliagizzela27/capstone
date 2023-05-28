import 'package:bloc/bloc.dart';

class UpdatePanenBloc extends Cubit<Map> {
  UpdatePanenBloc()
      : super({
          'waktu': '',
          'jmlPanen': 0,
          'jmlPanenA': 0,
          'jmlPanenB': 0,
          'jmlPanenC': 0,
          'panenHarga': 0,
          'kegiatanSawahId': '',
          'panenId': ''
        });

  changeInit(String waktu, int jmlPanen, int jmlPanenA, int jmlPanenB,
      int jmlPanenC, int panenHarga, String kegiatanSawahId, String panenId) {
    emit({
      'waktu': waktu.toString(),
      'jmlPanen': jmlPanen,
      'jmlPanenA': jmlPanenA,
      'jmlPanenB': jmlPanenB,
      'jmlPanenC': jmlPanenC,
      'panenHarga': panenHarga,
      'kegiatanSawahId': kegiatanSawahId,
      'panenId': panenId
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
