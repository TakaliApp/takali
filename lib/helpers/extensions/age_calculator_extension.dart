extension AgeCalculator on DateTime {
  int get age {
    final DateTime aujourdHui = DateTime.now();
    int age = aujourdHui.year - year;

    if (aujourdHui.month < month ||
        (aujourdHui.month == month && aujourdHui.day < day)) {
      age--;
    }
    return age;
  }
}
