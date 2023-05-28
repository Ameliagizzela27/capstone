import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_google_location_picker/flutter_google_location_picker.dart';
import 'package:flutter_google_location_picker/model/lat_lng_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:teman/bloc/custom_bloc.dart';
import 'package:teman/bloc/kegiatan_pertanian_bloc.dart';
import 'package:teman/bloc/list_bloc.dart';
import 'package:teman/bloc/list_map_bloc.dart';
import 'package:teman/bloc/lokasi_sawah_bloc.dart';

import 'package:teman/utils/WAColors.dart';
import 'package:teman/utils/WAWidgets.dart';

TextEditingController latitudeBahayaCont = TextEditingController(text: '0.00');
TextEditingController longitudeBahayaCont = TextEditingController(text: '0.00');
TextEditingController addresseBahayaCont = TextEditingController(text: '0.00');
TextEditingController jenisBahayaCont =
    TextEditingController(text: 'Tidak ada Pilihan');
CustomBloc pilihanBahaya = CustomBloc();

class WATambahLokasiBahaya extends StatelessWidget {
  WATambahLokasiBahaya({Key? key}) : super(key: key);

  // Future getDocs() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection("teman").get();
  //   for (int i = 0; i < querySnapshot.docs.length; i++) {
  //     // var a = querySnapshot.docs[i];
  //     bahayaAll.addData(querySnapshot.docs[i]['bahaya']);
  //     bahayaLat.addData(querySnapshot.docs[i]['latitude']);
  //     bahayaLong.addData(querySnapshot.docs[i]['longitude']);
  //     bahayaAdress.addData(querySnapshot.docs[i]['adress']);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ListMapBloc listMapBahayaBloc = context.read<ListMapBloc>();
    setData() {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("teman")
          .doc(addresseBahayaCont.text);

      Map<String, dynamic> teman = {
        "latitude": latitudeBahayaCont.text,
        "longitude": longitudeBahayaCont.text,
        "adress": addresseBahayaCont.text,
        'bahaya': pilihanBahaya.state
      };
      documentReference.set(teman).whenComplete(() => print('created'));
      print('Create');
    }

    List<DropdownMenuItem<String>> dropdownItems = [
      DropdownMenuItem(
          child: Text("Tidak ada Pilihan"), value: "Tidak ada Pilihan"),
      DropdownMenuItem(child: Text("Begal"), value: "Begal"),
      DropdownMenuItem(child: Text("Jalan Licin"), value: "Jalan licin"),
      DropdownMenuItem(
          child: Text("Jalan Kurang Penerangan"),
          value: "Jalan Kurang Penerangan"),
      DropdownMenuItem(child: Text("Jalan Sempit"), value: "Jalan Sempit"),
    ];

    return SafeArea(
        child: Scaffold(
      body: Container(
          height: context.height(),
          width: context.width(),
          child: Stack(
            children: [
              Positioned(
                top: -250,
                left: -100,
                child: CircleAvatar(
                  radius: 300,
                  backgroundColor: WAPrimaryColor2,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              20.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Kemanakah Hari ini ?',
                                      style: secondaryTextStyle(
                                          color: Colors.white60)),
                                  8.height,
                                  Text('TEMAN',
                                      style: boldTextStyle(
                                          color: Colors.white, size: 18)),
                                  5.height,
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: IconButton(
                                onPressed: () {
                                  Dialogs.materialDialog(
                                      barrierDismissible: true,
                                      color: WAInfo4,
                                      title: 'Pilihan Menu',
                                      titleStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: WAInfo1),
                                      customView: Container(
                                          width: context.width(),
                                          decoration: BoxDecoration(
                                            color: WAInfo4,
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Center(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              20.height,
                                              IconsButton(
                                                onPressed: () {},
                                                text: 'Update Profil',
                                                iconData: Icons.edit,
                                                color: WAInfo2,
                                                textStyle: primaryTextStyle(
                                                    color: WAInfo4),
                                                iconColor: WAInfo4,
                                              ),
                                              5.height,
                                              IconsButton(
                                                onPressed: () {},
                                                text: 'Ubah Password',
                                                iconData: Icons.lock,
                                                color: WAInfo2,
                                                textStyle: primaryTextStyle(
                                                    color: WAInfo4),
                                                iconColor: WAInfo4,
                                              ),
                                              5.height,
                                              IconsButton(
                                                onPressed: () {
                                                  // AuthApi().logout();
                                                  Navigator.pushNamed(
                                                      context, '/login');
                                                },
                                                text: 'Sign Out',
                                                iconData: Icons.exit_to_app,
                                                color: WAError1,
                                                textStyle: primaryTextStyle(
                                                    color: WAError4),
                                                iconColor: WAError4,
                                              ),
                                              5.height,
                                            ],
                                          ))),
                                      customViewPosition:
                                          CustomViewPosition.BEFORE_ACTION,
                                      context: context,
                                      actions: []);
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: WASecondary4,
                                )),
                          )
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child: Text("Daftar Lokasi Bahaya ",
                                style: primaryTextStyle(
                                    size: 20, color: WASecondary4)),
                          ),
                          5.width,
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(radiusCircular(10))),
                            child: IconsButton(
                              color: WASecondary4,
                              onPressed: () async {
                                Dialogs.materialDialog(
                                    title: "Get Location",
                                    customView: Container(
                                        height: 0.6 *
                                            MediaQuery.of(context).size.height,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              GetMaps(
                                                type: 'bahaya',
                                              ),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30),
                                                  height: 0.1 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                  width: 0.8 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  child: BlocBuilder(
                                                    bloc: pilihanBahaya,
                                                    buildWhen:
                                                        (previous, current) {
                                                      if (current != previous) {
                                                        return true;
                                                      } else {
                                                        return false;
                                                      }
                                                    },
                                                    builder: (context, state) {
                                                      return DropdownButton<
                                                              String>(
                                                          value: jenisBahayaCont
                                                              .text,
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 14),
                                                          onChanged: (val) {
                                                            if (val != null) {
                                                              jenisBahayaCont
                                                                  .text = val;
                                                              pilihanBahaya
                                                                  .changeVal(
                                                                      val);
                                                            }
                                                          },
                                                          items: dropdownItems);
                                                    },
                                                  )),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30),
                                                  height: 0.1 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                  child: AppTextField(
                                                    textFieldType:
                                                        TextFieldType.MULTILINE,
                                                    isPassword: false,
                                                    maxLength: 50,
                                                    maxLines: 2,
                                                    controller: jenisBahayaCont,
                                                    onChanged: (val) {
                                                      pilihanBahaya
                                                          .changeVal(val);
                                                    },
                                                  ))
                                            ],
                                          ),
                                        )),
                                    customViewPosition:
                                        CustomViewPosition.BEFORE_ACTION,
                                    color: Colors.white,
                                    context: context,
                                    actions: [
                                      IconsButton(
                                          onPressed: () {
                                            if (jenisBahayaCont.text !=
                                                    'Tidak ada Pilihan' ||
                                                latitudeBahayaCont.text !=
                                                    '0.00' ||
                                                longitudeBahayaCont.text !=
                                                    '0.00' ||
                                                addresseBahayaCont.text !=
                                                    '0.00') {
                                              setData();
                                            }

                                            Navigator.pop(context);
                                            listMapBahayaBloc.getDocs();
                                          },
                                          text: 'Kirim',
                                          iconData: Icons.check,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                          color: WAInfo1),
                                    ]);
                              },
                              text: '+  Lokasi Bahaya',
                              textStyle: primaryTextStyle(
                                  color: WAPrimaryColor1, size: 14),
                            ),
                          )
                        ],
                      ),
                      16.height,
                      Column(
                          children: List.generate(
                              listMapBahayaBloc.state.listDataMap.length,
                              (index) => Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 0.2 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            child: Column(
                                              children: [
                                                Text(
                                                  listMapBahayaBloc
                                                      .state
                                                      .listDataMap[index]
                                                          ['latitude']
                                                      .toString(),
                                                  maxLines: 5,
                                                  style: primaryTextStyle(
                                                      size: 12),
                                                ),
                                                Text(
                                                  listMapBahayaBloc
                                                      .state
                                                      .listDataMap[index]
                                                          ['longitude']
                                                      .toString(),
                                                  maxLines: 5,
                                                  style: primaryTextStyle(
                                                      size: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            child: Text(
                                              listMapBahayaBloc
                                                      .state
                                                      .listDataMap[index]
                                                          ['adress']
                                                      .toString() +
                                                  ' \n ',
                                              maxLines: 5,
                                              style: primaryTextStyle(size: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.3 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            child: Text(
                                              listMapBahayaBloc.state
                                                  .listDataMap[index]['bahaya']
                                                  .toString()
                                                  .toString(),
                                              maxLines: 5,
                                              style: primaryTextStyle(size: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        thickness: 0.6,
                                      )
                                    ],
                                  ))),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}

class GetMaps extends StatefulWidget {
  String type;
  GetMaps({required this.type});

  @override
  State<GetMaps> createState() => _GetMapsState();
}

class _GetMapsState extends State<GetMaps> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 0.8 * MediaQuery.of(context).size.width,
        height: 0.35 * MediaQuery.of(context).size.height,
        child: FlutterGoogleLocationPicker(
            center: LatLong(latitude: -6.175392, longitude: 106.827153),
            showZoomButtons: false,
            onPicked: (pickedData) {
              if (kDebugMode) {
                String address =
                    '${pickedData.address?.houseNumber},${pickedData.address?.village} ,${pickedData.address?.subDistrict},${pickedData.address?.city}, ${pickedData.address?.postCode}}';

                latitudeBahayaCont.text =
                    pickedData.latLong.latitude.toString();
                longitudeBahayaCont.text =
                    pickedData.latLong.longitude.toString();
                addresseBahayaCont.text = address.toString();

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Lokasi telah ditandai',
                    style: primaryTextStyle(color: Colors.white),
                  ),
                  backgroundColor: WAInfo1,
                ));
              }
            }),
      ),
    );
  }
}


//                                             width: 40,
//                                             height: 40,
//                                             decoration:
//                                                 boxDecorationWithRoundedCorners(
//                                               backgroundColor: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                               border: Border.all(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2)),
//                                             ),
//                                             alignment: Alignment.center,
//                                             child: Stack(
//                                               alignment:
//                                                   AlignmentDirectional.topEnd,
//                                               children: [
//                                                 Icon(Icons.edit,
//                                                     color: Colors.grey),
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
                                            // showDialog<void>(
                                            //   context: context,
                                            //   builder: (context) =>
                                            //       updateProfile(),
                                            // );
//                                           },
//                                         ),
//                                         6.width,
//                                         GestureDetector(
//                                           child: Container(
//                                             width: 40,
//                                             height: 40,
//                                             decoration:
//                                                 boxDecorationWithRoundedCorners(
//                                               backgroundColor: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                               border: Border.all(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2)),
//                                             ),
//                                             alignment: Alignment.center,
//                                             child: Stack(
//                                               alignment:
//                                                   AlignmentDirectional.topEnd,
//                                               children: [
//                                                 Icon(Icons.key,
//                                                     color: Colors.grey),
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             showDialog<void>(
//                                               context: context,
//                                               builder: (context) =>
//                                                   changePass(),
//                                             );
//                                           },
//                                         ),