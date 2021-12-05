
class Packet {
  final String name;
  final String quantity;

  Packet({
    required this.name,
    required this.quantity,
  });
}

final packetsList = [
  Packet(
    name: 'Документы А4',
    quantity: 'до 1 кг',
  ),
  Packet(
    name: 'Размер S (17*12*9 см)-',
    quantity: 'до 1 кг',
  ),
  Packet(
    name: 'Размер М (21*20*11 см)-',
    quantity: 'до 3 кг',
  ),
  Packet(
    name: 'Размер L (33*25*15 см)-',
    quantity: 'до 5 кг',
  ),
];