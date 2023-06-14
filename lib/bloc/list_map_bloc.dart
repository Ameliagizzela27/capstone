import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataMap {
  ///Sts = Students
  List listDataMap = [];
  DataMap({required this.listDataMap});
}

class ListMapBloc extends Cubit<DataMap> {
  ListMapBloc() : super(DataMap(listDataMap: []));

  Future getDocs() async {
    state.listDataMap.clear();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("teman").get();
    // for (int i = 0; i < querySnapshot.docs.length; i++) {
    //   // var a = querySnapshot.docs[i];
    //   Map<String, dynamic> dataMap =
    //       querySnapshot.docs[i] as Map<String, dynamic>;
    //   state.listDataMap.add(dataMap);
    // }
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    state.listDataMap.addAll(allData);
    return emit(DataMap(listDataMap: state.listDataMap));
  }

  addAll(List<Map<String, dynamic>> data) {
    state.listDataMap.addAll(data);
    return emit(DataMap(listDataMap: state.listDataMap));
  }

  addInvoice(Map<String, dynamic> detailInvoiceId) {
    state.listDataMap.add(detailInvoiceId);
    return emit(DataMap(listDataMap: state.listDataMap));
  }

  removeInvoice(detailInvoiceId) {
    state.listDataMap.removeWhere((element) => element == detailInvoiceId);
    return emit(DataMap(listDataMap: state.listDataMap));
  }

  removeAll() {
    state.listDataMap.clear();
    return emit(DataMap(listDataMap: state.listDataMap));
  }

  int countData() {
    return state.listDataMap.length;
  }

  @override
  void onChange(Change<DataMap> change) {
    print(change);
    print(state.listDataMap);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    print(state.listDataMap);
    super.onError(error, stackTrace);
  }
}
