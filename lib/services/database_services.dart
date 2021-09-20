import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_espera/model/clientHour.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection("Clientes");
final CollectionReference _userId = _firestore.collection("Users");

class DatabaseServices {
//CRUD do firebase
  static Future createNewClient(
    String name,
    String cellphone,
    String numberOfPeople,
    String hour,
  ) async {
    DocumentReference ref = _mainCollection.doc();
    await ref.set({
      "name": name,
      "cellphone": cellphone,
      "numberOfPeople": numberOfPeople,
      "hour": hour,
      "id": ClientHour.getTimeMist(),
    });
  }

  static Future setNewPhoneId(String userId) async {
    DocumentReference ref = _userId.doc();
    await ref.set({
      "UserID": userId,
    });
  }

  static Future updateClient(
    String name,
    String cellphone,
    String numberOfPeople,
    String id,
  ) async {
    DocumentReference ref = _mainCollection.doc(id);
    await ref.update({
      "name": name,
      "cellphone": cellphone,
      "numberOfPeople": numberOfPeople,
    });
  }

  static Future deleteClient(String id) async {
    DocumentReference ref = _mainCollection.doc(id);
    await ref.delete();
  }

  static Stream<QuerySnapshot> listClients() {
    Query ref = _mainCollection.orderBy("id", descending: false);

    return ref.snapshots();
  }

  static Stream<QuerySnapshot> listUsers() {
    Query ref = _userId;

    return ref.snapshots();
  }
}
