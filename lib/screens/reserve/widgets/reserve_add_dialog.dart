import 'package:fila_espera/model/clientHour.dart';
import 'package:fila_espera/services/database_services.dart';
import 'package:flutter/material.dart';

class ReserveAddDialog extends StatelessWidget {
  final name = TextEditingController();
  final cellphone = TextEditingController();
  final numberOfPeople = TextEditingController();

  final List<String> userIds;

  ReserveAddDialog({required this.userIds});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      backgroundColor: Colors.grey.shade800,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Nova reserva:",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              // print();
            },
            icon: Icon(Icons.clear_rounded),
            color: Colors.white,
          )
        ],
      ),
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          controller: name,
          decoration: InputDecoration(
            hintText: "Nome",
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.name,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: cellphone,
          decoration: InputDecoration(
            hintText: "Telefone",
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: numberOfPeople,
          decoration: InputDecoration(
            hintText: "Número de pessoas",
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.grey.shade900,
            ),
          ),
          onPressed: () async {
            if (name.text.isNotEmpty &&
                cellphone.text.isNotEmpty &&
                numberOfPeople.text.isNotEmpty) {
              await DatabaseServices.createNewClient(
                name.text,
                cellphone.text,
                numberOfPeople.text,
                ClientHour.getHour(),
              );

              // await OneSignal.shared.postNotification(
              //   OSCreateNotification(
              //     playerIds: userIds,
              //     content: "Nova reserva para o cliente " + name.text,
              //     heading: "Nova Reserva",
              //   ),
              // );
              Navigator.pop(context);
            }
          },
          child: Text(
            "Reservar",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
