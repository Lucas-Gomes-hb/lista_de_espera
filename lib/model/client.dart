class Client {
  final String? id;
  final String name;
  final String cellphone;
  final String numberOfPeople;

  Client({
    required this.name,
    required this.cellphone,
    required this.numberOfPeople,
    this.id,
  });
}
