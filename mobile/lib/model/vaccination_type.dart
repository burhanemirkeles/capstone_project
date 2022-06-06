// ignore_for_file: constant_identifier_names

enum VaccinationType {
  Sinovac,
  PfizerBiontech,
  NotVaccinated,
}

extension ParseToString on VaccinationType {
  String toShortString() {
    return toString().split('.').last;
  }
}
