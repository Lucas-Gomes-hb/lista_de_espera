import 'package:fila_espera/screens/reserve/reserveList.dart';
import 'package:fila_espera/screens/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<FirebaseApp> _initialFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  build(BuildContext context) {
    OneSignal.shared.setAppId('8bbe282c-f041-4053-b802-95389f80cdc1');
    return FutureBuilder(
        future: _initialFirebase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ReserveList();
          }
          return Loading();
        });
  }
}
