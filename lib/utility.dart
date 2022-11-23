class Utility{
  static bool isContainNumber(String value){
    return value.contains(new RegExp(r'[0-9]'));
  }
  static String separateNumberFromText(String value){
    return value.replaceAll(RegExp(r'[^0-9]'),'');
  }
}