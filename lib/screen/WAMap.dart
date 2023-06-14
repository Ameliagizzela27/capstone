import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:teman/bloc/list_map_bloc.dart';

import '../utils/WAColors.dart';
import 'WAHomeScreen.dart';

class CustomizeMarkerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListMapBloc listMapBlocBahaya = context.read<ListMapBloc>();

    final List<Marker> markList = List.generate(
      listMapBlocBahaya.state.listDataMap.length,
      (index) => Marker(
        point: LatLng(
            double.parse(listMapBlocBahaya.state.listDataMap[index]['latitude']
                .toString()),
            double.parse(listMapBlocBahaya.state.listDataMap[index]['longitude']
                .toString())),
        width: 80,
        height: 80,
        builder: (context) => IconButton(
          icon: Icon(
            Icons.info,
            color: WAError1,
          ),
          onPressed: () {
            Dialogs.materialDialog(
                barrierDismissible: true,
                color: Colors.white,
                title: 'Peringatan',
                customView: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                          listMapBlocBahaya.state.listDataMap[index]['adress']
                              .toString(),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              color: Colors.black54, size: 16)),
                      Text(
                          listMapBlocBahaya.state.listDataMap[index]['bahaya']
                              .toString(),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style:
                              primaryTextStyle(color: Colors.black54, size: 16))
                    ],
                  ),
                ),
                customViewPosition: CustomViewPosition.BEFORE_ACTION,
                context: context,
                actions: [
                  IconsButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Kembali',
                    iconData: Icons.arrow_back,
                    color: WAInfo1,
                    textStyle: TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ]);
          },
          color: WAError1,
        ),
      ),
    );

    print(listMapBlocBahaya.state.listDataMap);
    print(listMapBlocBahaya.state.listDataMap.length);
    // List<Marker> markerLoc = List.

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Customize Marker Example'),
        // ),
        body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(double.parse(latitudeAwalCont.text),
                double.parse(longitudeAwalCont.text)),
            zoom: 15,
          ),
          layers: [
            TileLayerOptions(
              tileProvider: NetworkTileProvider(
                  headers: {'User-Agent': 'flutter_map/1.1.1)'}),
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            new MarkerLayerOptions(markers: markList),
            new MarkerLayerOptions(markers: [
              Marker(
                  point: LatLng(double.parse(latitudeAwalCont.text),
                      double.parse(longitudeAwalCont.text)),
                  builder: (context) {
                    return Icon(Icons.flag);
                  }),
              Marker(
                  point: LatLng(double.parse(latitudeAkhirCont.text),
                      double.parse(longitudeAkhirCont.text)),
                  builder: (context) {
                    return Icon(Icons.flag);
                  })
            ]),
            new PolylineLayerOptions(polylines: [
              Polyline(points: [
                LatLng(double.parse(latitudeAwalCont.text),
                    double.parse(longitudeAwalCont.text)),
                LatLng(double.parse(latitudeAkhirCont.text),
                    double.parse(longitudeAkhirCont.text)),
              ], color: Colors.red, strokeWidth: 5)
            ]),
            new PolygonLayerOptions(polygons: [
              Polygon(points: [
                LatLng(double.parse(latitudeAwalCont.text),
                    double.parse(longitudeAwalCont.text)),
                LatLng(double.parse(latitudeAkhirCont.text),
                    double.parse(longitudeAkhirCont.text)),
              ])
            ])
          ],
        ),
        Container(
          margin:
              EdgeInsets.only(top: 0.9 * MediaQuery.of(context).size.height),
          decoration: BoxDecoration(color: WASecondary4),
          height: 0.1 * MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAError1,
                    ),
                    3.width,
                    Text(
                      'Begal',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAWarning1,
                    ),
                    3.width,
                    Text(
                      'Jalan Licin',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WASuccess1,
                    ),
                    3.width,
                    Text(
                      'Jalan Sempit',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAError1,
                    ),
                    3.width,
                    Text(
                      'Begal',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAWarning1,
                    ),
                    3.width,
                    Text(
                      'Jalan Licin',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WASuccess1,
                    ),
                    3.width,
                    Text(
                      'Jalan Sempit',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAError1,
                    ),
                    3.width,
                    Text(
                      'Begal',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WAWarning1,
                    ),
                    3.width,
                    Text(
                      'Jalan Licin',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: WASuccess1,
                    ),
                    3.width,
                    Text(
                      'Jalan Sempit',
                      style: primaryTextStyle(size: 10, color: WAError1),
                    )
                  ],
                )
              ],
            )
          ]),
        )
      ],
    ));
  }
}
