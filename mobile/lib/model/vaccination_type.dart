// ignore_for_file: constant_identifier_names

enum VaccinationType {
  Sinovac,
  Biontech,
  Turkovac,
  A,
  B,
}

extension ParseToString on VaccinationType {
  String toShortString() {
    return toString().split('.').last;
  }
}
