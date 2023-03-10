class Nutrient {
  int enercKal;
  int procnt;
  int fat;
  int chocf;
  int fibtg;

  Nutrient(
      {required this.enercKal,
      required this.procnt,
      required this.fat,
      required this.chocf,
      required this.fibtg});

  factory Nutrient.fromJson(Map<String, dynamic> parsedJson) {
    return Nutrient(
      enercKal: parsedJson['ENERC_KAL'],
      procnt: parsedJson['PROCNT'],
      fat: parsedJson['FAT'],
      chocf: parsedJson['CHOCF'],
      fibtg: parsedJson['FIBTG'],
    );
  }
}
