// ignore_for_file: constant_identifier_names

enum VaccinationTypeEnum {
  Sinovac,
  PfizerBiontech,
  NotVaccinated,
}

extension ParseToString on VaccinationTypeEnum {
  String toShortString() {
    return toString().split('.').last;
  }
}
