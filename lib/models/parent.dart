class Parent {
  final String name;
  final String childName;
  final String vehicleNumber;
  final String lastPickup;

  Parent({
    required this.name,
    required this.childName,
    required this.vehicleNumber,
    required this.lastPickup,
  });

  // factory Parent.fromJson(Map<String, dynamic> json) {
  //   return Parent(
  //     name: json['name'],
  //     childName: json['child_name'],
  //     vehicleNumber: json['vehicle_number'],
  //     lastPickup: json['last_pickup'] ?? 'No record',
  //   );
  // }
}
