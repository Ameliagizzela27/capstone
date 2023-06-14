import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:teman/firebase_options.dart';
import 'package:teman/screen/WASplashScreen.dart';
import 'package:teman/screen/home_screen.dart';
import 'package:teman/screen/login_email_password_screen.dart';
import 'package:teman/screen/login_screen.dart';
import 'package:teman/screen/phone_screen.dart';
import 'package:teman/screen/signup_email_password_screen.dart';
import 'package:teman/service/firebase_auth_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (kIsWeb) {
  //   FacebookAuth.i.webInitialize(
  //     appId: "projectcapstone-123123",
  //     cookie: true,
  //     xfbml: true,
  //     version: "v12.0",
  //   );
  // }
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = MyRoute();
  
    return MultiBlocProvider(
        providers: [
                  Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
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
          title: 'Teman Apps',
           theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          EmailPasswordSignup.routeName: (context) =>
              const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
             home: WASplashScreen(),
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}



