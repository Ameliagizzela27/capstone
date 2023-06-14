import 'package:bloc/bloc.dart';

class DataList {
  ///Sts = Students
  List<dynamic> listDataList = [];
  DataList({required this.listDataList});
}

class ListBloc extends Cubit<DataList> {
  ListBloc() : super(DataList(listDataList: []));

  addAll(List data) {
    state.listDataList.addAll(data);
    return emit(DataList(listDataList: state.listDataList));
  }

  addData(data) {
    state.listDataList.add(data);
    return emit(DataList(listDataList: state.listDataList));
  }

  findData(data) {
    var res = state.listDataList
        .firstWhere((element) => element.contains(data), orElse: () => -1);
    return res;
  }

  removeData(data) {
    state.listDataList.removeWhere((element) => element == data);
    return emit(DataList(listDataList: state.listDataList));
  }

  removeAll() {
    state.listDataList.clear();
    return emit(DataList(listDataList: state.listDataList));
  }

  @override
  void onChange(Change<DataList> change) {
    print(change);
    print(state.listDataList);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    print(state.listDataList);
    super.onError(error, stackTrace);
  }
}
