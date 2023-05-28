import 'package:bloc/bloc.dart';

class InisiasiBloc extends Cubit<Map> {
  InisiasiBloc()
      : super({
          'kabupaten': '',
          'lokasisensor': '',
          'hama': '',
          'penyakit': '',
          'pestisida': '',
          'pupuk': '',
          'lokasisawah': '',
        });
  List kabupatenNama = [];
  List kabupatenId = [];
  List lokasiSensor = [];
  List lokasiSensorId = [];

  changeInit(List kabupaten, List lokasisensor, List hama, List penyakit,
      List pestisida, List pupuk, List lokasisawah) {
    emit({
      'kabupaten': kabupaten,
      'lokasisensor': lokasisensor,
      'hama': hama,
      'penyakit': penyakit,
      'pestisida': pestisida,
      'pupuk': pupuk,
      'lokasisawah': lokasisawah,
    });
  }

  changeInitLokasi(List lokasisawah) {
    emit({
      'kabupaten': state['kabupaten'],
      'lokasisensor': state['lokasisensor'],
      'hama': state['hama'],
      'penyakit': state['penyakit'],
      'pestisida': state['pestisida'],
      'pupuk': state['pupuk'],
      'lokasisawah': lokasisawah,
    });
  }

  iterateKabupaten() {
    for (int i = 0; i < state['kabupaten'].length; i++) {
      kabupatenNama.add(
          state['kabupaten'][i]['attributes']['kabupaten_nama'].toString());
      kabupatenId.add(state['kabupaten'][i]['id'].toString());
    }
    print(kabupatenNama);
    print(kabupatenId);
  }

  iterateLokasiSensor() {
    for (int i = 0; i < state['lokasisensor'].length; i++) {
      kabupatenNama
          .add(state['lokasisensor'][i]['attributes']['alamat'].toString());
      kabupatenId.add(state['lokasisensor'][i]['id'].toString());
    }
    print(kabupatenNama);
    print(kabupatenId);
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
