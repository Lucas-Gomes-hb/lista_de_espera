import 'package:fila_espera/services/database_services.dart';
import 'package:flutter/material.dart';

class ReserveUpdateDialog extends StatelessWidget {
  final String name;
  final String cellphone;
  final String numberOfPeople;
  final String id;

  final newName = TextEditingController();
  final newCellphone = TextEditingController();
  final newNumberOfPeople = TextEditingController();

  ReserveUpdateDialog({
    required this.name,
    required this.cellphone,
    required this.id,
    required this.numberOfPeople,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      backgroundColor: Colors.grey.shade800,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reserva:",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.clear_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      children: [
        TextField(
          controller: newName,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: name,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          keyboardType: TextInputType.name,
        ),
        TextField(
          controller: newCellphone,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: cellphone,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          controller: newNumberOfPeople,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: numberOfPeople,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          keyboardType: TextInputType.number,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade900),
          ),
          onPressed: () async {
            await DatabaseServices.updateClient(
              (newName.text.isEmpty ? name : newName.text),
              (newCellphone.text.isEmpty ? cellphone : newCellphone.text),
              (newNumberOfPeople.text.isEmpty
                  ? numberOfPeople
                  : newNumberOfPeople.text),
              id,
            );
            Navigator.of(context).pop();
          },
          child: Text(
            "Atualizar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
