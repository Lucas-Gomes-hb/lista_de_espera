import 'package:fila_espera/screens/reserve/widgets/reserve_add_dialog.dart';
import 'package:fila_espera/screens/reserve/widgets/reserve_builder.dart';
import 'package:fila_espera/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ReserveList extends StatelessWidget {
  static List<String> userIds = [];

  void setId() async {
    await DatabaseServices.setNewPhoneId(await OneSignal.shared
        .getDeviceState()
        .then((value) => value!.userId as String));
  }

  @override
  Widget build(BuildContext context) {
    setId();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fila de espera",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return ReserveAddDialog(
                  userIds: userIds,
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ReserveBuilder(),
      ),
    );
  }
}
