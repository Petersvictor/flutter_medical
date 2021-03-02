import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/constants.dart';
import 'package:flutter_medical/provider/user_provider.dart';
import 'package:flutter_medical/routes.dart';
import 'package:flutter_medical/screens/doctors/doctors_list.dart';
import 'package:flutter_medical/screens/unboard/unboard_screen.dart';
import 'package:flutter_medical/services/database.dart';
import 'package:flutter_medical/services/storage.dart';
import 'package:flutter_medical/size_config.dart';
import 'file:///C:/Users/Peters/AndroidStudioProjects/flutter_medical/lib/provider/image_upload_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_medical/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Authentication>(
          create: (_) => Authentication(),
        ),
        Provider<Database> (
          create: (_) => Database(),
        ),
        Provider<Storage> (
          create: (_) => Storage(),
        ),
        StreamProvider(
          create: (context) => context.read<Authentication>().authStateChanges,
        ),
        ChangeNotifierProvider<ImageUploadProvider>(
          create: (_) => ImageUploadProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        theme: ThemeData(
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ),
          scaffoldBackgroundColor: kPrimaryLightColor
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper ({
    Key key,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    if (user != null) {
      return DoctorsList();
    }
    return UnboardScreen();
  }
}



