import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:teman/bloc/inisiasi_bloc.dart';
import 'package:teman/bloc/kegiatan_pertanian_bloc.dart';
import 'package:teman/bloc/list_bloc.dart';
import 'package:teman/bloc/lokasi_sawah_bloc.dart';
import 'package:teman/bloc/list_map_bloc.dart';
import 'package:teman/bloc/updateData/update_hama.dart';
import 'package:teman/bloc/updateData/update_kegiatan_pertanian.dart';
import 'package:teman/bloc/updateData/update_panen.dart';
import 'package:teman/bloc/updateData/update_pemberian_pestisida.dart';
import 'package:teman/bloc/updateData/update_pemberian_pupuk.dart';
import 'package:teman/bloc/updateData/update_penyakit.dart';
import 'package:teman/route/routes.dart';

import 'bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = MyRoute();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InisiasiBloc()),
          BlocProvider(create: (context) => ListMapBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => LokasiSawahBloc()),
          BlocProvider(create: (context) => KegiatanPertanianBloc()),
          BlocProvider(create: (context) => ListBloc()),
          BlocProvider(create: (context) => UpdateKegiatanPertanianBloc()),
          BlocProvider(create: (context) => ListBlocLokasiSawahId()),
          BlocProvider(create: (context) => UpdatePemberianPupukBloc()),
          BlocProvider(create: (context) => UpdatePemberianPestisidaBloc()),
          BlocProvider(create: (context) => UpdateHamaBloc()),
          BlocProvider(create: (context) => UpdatePenyakitBloc()),
          BlocProvider(create: (context) => UpdatePanenBloc()),
        ],
        child: MaterialApp(
          initialRoute: "/",
          onGenerateRoute: router.onRoute,
          title: 'Tandur Brambang Apps',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          // home: WASplashScreen(),
        ));
  }
}
