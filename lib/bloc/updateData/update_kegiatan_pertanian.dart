import 'package:bloc/bloc.dart';

class LokasiSawahId {
  ///Sts = Students
  List<String> listLokasiSawahId = [];
  LokasiSawahId({required this.listLokasiSawahId});
}

class ListBlocLokasiSawahId extends Cubit<LokasiSawahId> {
  ListBlocLokasiSawahId() : super(LokasiSawahId(listLokasiSawahId: []));

  addAll(List<String> data) {
    state.listLokasiSawahId.addAll(data);
    return emit(LokasiSawahId(listLokasiSawahId: state.listLokasiSawahId));
  }

  addData(String data) {
    state.listLokasiSawahId.add(data);
    return emit(LokasiSawahId(listLokasiSawahId: state.listLokasiSawahId));
  }

  findData(String data) {
    var res = state.listLokasiSawahId
        .firstWhere((element) => element.contains(data), orElse: () => '-1');
    return res;
  }

  removeData(String data) {
    state.listLokasiSawahId.removeWhere((element) => element == data);
    return emit(LokasiSawahId(listLokasiSawahId: state.listLokasiSawahId));
  }

  removeAll() {
    state.listLokasiSawahId.clear();
    return emit(LokasiSawahId(listLokasiSawahId: state.listLokasiSawahId));
  }

  @override
  void onChange(Change<LokasiSawahId> change) {
    print(change);
    print(state.listLokasiSawahId);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    print(state.listLokasiSawahId);
    super.onError(error, stackTrace);
  }
}

class UpdateKegiatanPertanianBloc extends Cubit<Map> {
  UpdateKegiatanPertanianBloc()
      : super({
          'metodePengairan': '',
          'sumberModal': '',
          'luasLahan': '',
          'jmlBibit': '',
          'waktu': '',
          'status': '',
          'kegiatanSawahId': '',
        });

  changeInit(
    String metodePengairan,
    String sumberModal,
    int luasLahan,
    int jmlBibit,
    String waktu,
    String status,
    String kegiatanSawahId,
  ) {
    emit({
      'metodePengairan': metodePengairan,
      'sumberModal': sumberModal,
      'luasLahan': luasLahan,
      'jmlBibit': jmlBibit,
      'waktu': waktu,
      'status': status,
      'kegiatanSawahId': kegiatanSawahId,
    });
  }

  @override
  void onChange(Change<Map> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
