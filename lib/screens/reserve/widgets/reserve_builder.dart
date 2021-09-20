import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_espera/screens/reserve/widgets/reserve_update_dialog.dart';

import 'package:fila_espera/screens/widgets/loading.dart';
import 'package:fila_espera/services/database_services.dart';
import 'package:flutter/material.dart';

class ReserveBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DatabaseServices.listClients(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Loading(),
          );
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var information = snapshot.data.docs[index];
                String id = snapshot.data.docs[index].id;
                String name = information["name"];
                String phone = information["cellphone"];
                String hour = information["hour"];
                String number = information["numberOfPeople"];

                return Card(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ReserveUpdateDialog(
                              name: name,
                              cellphone: phone,
                              id: id,
                              numberOfPeople: number,
                            );
                          });
                    },
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.message_rounded),
                        onPressed: () {},
                      ),
                      title: Text(name),
                      subtitle: Text(phone + " " + hour),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await DatabaseServices.deleteClient(id);
                        },
                      ),
                    ),
                  ),
                );
              });
        }
        return Loading();
      },
    );
  }
}
