class ClienteModel {
  final int id;
  final String name;
  final String email;
  final String pix;

  ClienteModel({
    required this.id,
    required this.name,
    required this.email,
    required this.pix,
  });

  static ClienteModel fromJson(element) {
    return ClienteModel(
      id: element['id'],
      name: element['name'],
      email: element['email'],
      pix: element['pix'],
    );
  }
}