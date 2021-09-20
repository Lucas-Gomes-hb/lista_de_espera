import 'package:fila_espera/screens/reserve/widgets/reserve_add_dialog.dart';
import 'package:fila_espera/screens/reserve/widgets/reserve_builder.dart';
import 'package:flutter/material.dart';

class ReserveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                return ReserveAddDialog();
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
