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

TextEditingController latitudeAwalCont = TextEditingController(text: '0.00');
TextEditingController longitudeAwalCont = TextEditingController(text: '0.00');
TextEditingController addresseAwalCont = TextEditingController(text: '0.00');
TextEditingController latitudeAkhirCont = TextEditingController(text: '0.00');
TextEditingController longitudeAkhirCont = TextEditingController(text: '0.00');
TextEditingController addresseAkhirCont = TextEditingController(text: '0.00');
TextEditingController latitudeBahayaCont = TextEditingController(text: '0.00');
TextEditingController longitudeBahayaCont = TextEditingController(text: '0.00');
TextEditingController addresseBahayaCont = TextEditingController(text: '0.00');
TextEditingController jenisBahayaCont =
    TextEditingController(text: 'Tidak ada Pilihan');
CustomBloc pilihanBahaya = CustomBloc();
CustomBloc latAwal = CustomBloc();
CustomBloc latAkhir = CustomBloc();

class WAHomeScreen extends StatelessWidget {
  WAHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListMapBloc listMapBlocBahaya = context.read<ListMapBloc>();
    listMapBlocBahaya.getDocs();
    // setData() {
    //   DocumentReference documentReference = FirebaseFirestore.instance
    //       .collection("teman")
    //       .doc(addresseBahayaCont.text);

    //   Map<String, dynamic> teman = {
    //     "latitude": double.parse(latitudeBahayaCont.text),
    //     "longitude": double.parse(longitudeBahayaCont.text),
    //     "adress": addresseBahayaCont.text,
    //     'bahaya': jenisBahayaCont.text
    //   };
    //   documentReference.set(teman).whenComplete(() => print('created'));
    //   print('Create');
    // }

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
                top: -200,
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
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/loginhome');
                                                  },
                                                  text: 'Login',
                                                  iconData: Icons.dashboard,
                                                  color: WAInfo2,
                                                  textStyle: primaryTextStyle(
                                                      color: WAInfo4),
                                                  iconColor: WAInfo4,
                                                ),
                                                5.height,
                                                IconsButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        '/tambahbahaya');
                                                  },
                                                  text: 'Tambah Lokasi Bahaya',
                                                  iconData: Icons.dangerous,
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "akan selalu memastikan Travelling Anda aman",
                                  style: primaryTextStyle(
                                      size: 14, color: WASecondary4)),
                              10.height,
                              Text("Lokasi Awal ",
                                  style: boldTextStyle(
                                      size: 14, color: WASecondary4)),
                              8.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 0.75 *
                                        MediaQuery.of(context).size.width,
                                    child: AppTextField(
                                      decoration: waInputDecoration(
                                          bgColor: WASecondary4,
                                          hint: 'Masukkan Lokasi Awal',
                                          prefixIcon: Icons.key),
                                      textFieldType: TextFieldType.NAME,
                                      keyboardType: TextInputType.name,
                                      controller: addresseAwalCont,
                                    ),
                                  ),
                                  5.width,
                                  Container(
                                    decoration: BoxDecoration(
                                        color: WASecondary4,
                                        borderRadius: BorderRadius.all(
                                            radiusCircular(10))),
                                    child: IconButton(
                                        color: WASecondary4,
                                        onPressed: () async {
                                          Dialogs.materialDialog(
                                              title: "Get Location",
                                              customView: GetMaps(
                                                type: 'awal',
                                              ),
                                              customViewPosition:
                                                  CustomViewPosition
                                                      .BEFORE_ACTION,
                                              color: Colors.white,
                                              context: context,
                                              actions: [
                                                IconsButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    text: 'Selesai',
                                                    iconData: Icons.check,
                                                    textStyle: TextStyle(
                                                        color: Colors.white),
                                                    iconColor: Colors.white,
                                                    color: WAInfo1),
                                              ]);
                                        },
                                        icon: Icon(Icons.map,
                                            color: WAPrimaryColor1)),
                                  )
                                ],
                              ),
                              16.height,
                              Text("Lokasi Tujuan ",
                                  style: boldTextStyle(
                                      size: 14, color: WASecondary4)),
                              8.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 0.75 *
                                        MediaQuery.of(context).size.width,
                                    child: AppTextField(
                                      decoration: waInputDecoration(
                                          bgColor: WASecondary4,
                                          hint: 'Masukkan Lokasi Tujuan',
                                          prefixIcon: Icons.key),
                                      textFieldType: TextFieldType.NAME,
                                      keyboardType: TextInputType.name,
                                      controller: addresseAkhirCont,
                                    ),
                                  ),
                                  5.width,
                                  Container(
                                    decoration: BoxDecoration(
                                        color: WASecondary4,
                                        borderRadius: BorderRadius.all(
                                            radiusCircular(10))),
                                    child: IconButton(
                                        color: WASecondary4,
                                        onPressed: () async {
                                          Dialogs.materialDialog(
                                              title: "Get Location",
                                              customView: GetMaps(
                                                type: 'akhir',
                                              ),
                                              customViewPosition:
                                                  CustomViewPosition
                                                      .BEFORE_ACTION,
                                              color: Colors.white,
                                              context: context,
                                              actions: [
                                                IconsButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    text: 'Selesai',
                                                    iconData: Icons.check,
                                                    textStyle: TextStyle(
                                                        color: Colors.white),
                                                    iconColor: Colors.white,
                                                    color: WAInfo1),
                                              ]);
                                        },
                                        icon: Icon(Icons.map,
                                            color: WAPrimaryColor1)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        10.height,
                        // Container(
                        //   alignment: Alignment.center,
                        //   child: Text("Rute Map  ",
                        //       style: primaryTextStyle(
                        //           size: 14, color: WASecondary4)),
                        // ),
                        // 5.height,

                        // Center(
                        //   child:
                        // )
                        //     child: Container(
                        //   width: 0.9 * MediaQuery.of(context).size.width,
                        //   height: 0.6 * MediaQuery.of(context).size.height,
                        //   margin: EdgeInsets.symmetric(horizontal: 5),
                        //   padding: EdgeInsets.only(
                        //       left: 16, right: 16, bottom: 30, top: 8),
                        //   decoration: boxDecorationRoundedWithShadow(
                        //     10,
                        //     backgroundColor: WASecondary4,
                        //     blurRadius: 10.0,
                        //     spreadRadius: 4.0,
                        //     shadowColor: WASecondary1.withAlpha(50),
                        //   ),
                        //   child: ElevatedButton(
                        //       onPressed: () {}, child: Text('Cek Map')),
                        // ))
                        // // FlutterMap(
                        // //   options: MapOptions(
                        // //     center: LatLng(0, 0),
                        // //     zoom: 1,
                        // //     maxZoom: 19,
                        // //   ),
                        // //   children: [
                        // //     TileLayerWidget(
                        // //       options: TileLayerOptions(
                        // //         urlTemplate:
                        // //             'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        // //         subdomains: ['a', 'b', 'c'],
                        // //         maxZoom: 19,
                        // //       ),
                        // //     ),
                        // //     // LocationMarkerLayerWidget(),
                        // //   ],
                        // // ),
                        // // BlocBuilder(
                        // //     bloc: latAkhir,
                        // //     buildWhen: (previous, current) {
                        // //       if (current != previous) {
                        // //         return true;
                        // //       } else {
                        // //         return false;
                        // //       }
                        // //     },
                        // //     builder: (context, state) {
                        // //       return FlutterMap(
                        // //         options: MapOptions(
                        // //           center: LatLng(
                        // //               double.parse(
                        // //                   latitudeAwalCont.text),
                        // //               double.parse(
                        // //                   longitudeAwalCont.text)),
                        // //           zoom: 15,
                        // //           maxZoom: 19,
                        // //         ),
                        // //         children: [
                        // //           TileLayerWidget(
                        // //             options: TileLayerOptions(
                        // //               urlTemplate:
                        // //                   'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        // //               subdomains: ['a', 'b', 'c'],
                        // //               maxZoom: 19,
                        // //             ),
                        // //           ),
                        // //           MarkerLayerWidget(
                        // //               options: MarkerLayerOptions(
                        // //                   markers: List.generate(
                        // //                       bahayaAll
                        // //                           .state
                        // //                           .listDataList
                        // //                           .length,
                        // //                       (index) => Marker(
                        // //                             point: LatLng(
                        // //                                 bahayaLat
                        // //                                         .state
                        // //                                         .listDataList[
                        // //                                     index],
                        // //                                 bahayaLong
                        // //                                         .state
                        // //                                         .listDataList[
                        // //                                     index]),
                        // //                             builder:
                        // //                                 (BuildContext
                        // //                                     context) {
                        // //                               return Icon(
                        // //                                   Icons
                        // //                                       .flag);
                        // //                             },
                        // //                           ))))
                        // //         ],
                        // //       );
                        // //     })))
                        20.height,
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.3 * MediaQuery.of(context).size.width),
                          width: 0.4 * MediaQuery.of(context).size.width,
                          child: IconsButton(
                            color: WASecondary4,
                            onPressed: () {
                              if (latitudeAwalCont.text != '0.00' ||
                                  longitudeAwalCont.text != '0.00' ||
                                  latitudeAkhirCont.text != '0.00' ||
                                  longitudeAkhirCont.text != '0.00') {
                                Navigator.pushNamed(context, '/map');
                              } else {
                                Dialogs.materialDialog(
                                    barrierDismissible: true,
                                    color: Colors.white,
                                    title: 'Peringatan',
                                    customView: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                          'Isikan field terlebih dahulu',
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          style: primaryTextStyle(
                                              color: Colors.black54, size: 16)),
                                    ),
                                    customViewPosition:
                                        CustomViewPosition.BEFORE_ACTION,
                                    context: context,
                                    actions: [
                                      IconsButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: 'Kembali',
                                        iconData: Icons.arrow_back,
                                        color: WAInfo1,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        iconColor: Colors.white,
                                      ),
                                    ]);
                              }
                            },
                            text: 'Cek Map',
                            textStyle: boldTextStyle(color: WAPrimaryColor2),
                          ),
                        )
                      ]),
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

                if (widget.type == 'awal') {
                  latitudeAwalCont.text =
                      pickedData.latLong.latitude.toString();
                  longitudeAwalCont.text =
                      pickedData.latLong.longitude.toString();
                  addresseAwalCont.text = address.toString();
                  latAwal.changeVal(pickedData.latLong.latitude.toString());
                } else if (widget.type == 'akhir') {
                  latitudeAkhirCont.text =
                      pickedData.latLong.latitude.toString();
                  longitudeAkhirCont.text =
                      pickedData.latLong.longitude.toString();
                  addresseAkhirCont.text = address.toString();
                  latAkhir.changeVal(pickedData.latLong.latitude.toString());
                } else {
                  latitudeBahayaCont.text =
                      pickedData.latLong.latitude.toString();
                  longitudeBahayaCont.text =
                      pickedData.latLong.longitude.toString();
                  addresseBahayaCont.text = address.toString();
                }

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Lokasi telah ditandai',
                    style: boldTextStyle(color: Colors.white),
                  ),
                  backgroundColor: WAInfo1,
                ));
              }
            }),
      ),
    );
  }
}

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
