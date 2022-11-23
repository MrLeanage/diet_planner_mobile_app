class BMIAnalysis{
  String _age = '';
  String _height = '';
  String _weight = '';
  String _preference = '';
  String _ageClass = '';
  String _bmiMsg = '';
  String _bmiStatus = '';
  List<String> _suggestedFoodList = [];
  String _thankNot = '';
  String _accuracy = '';
  String _codeStatus = 'failed';

  BMIAnalysis();

  BMIAnalysis.initData(String age, String height, String weight, String preference){
    _age = age;
    _height = height;
    _weight = weight;
    _preference = preference;
  }
  BMIAnalysis.fromJson(var json){
    _age = json['input-age'];
    _height = json['input-height'];
    _weight = json['input-weight'];
    _preference = json['input-preference'];
    _ageClass = json['age-class'];
    _bmiMsg = json['bmi-message'];
    _bmiStatus = json['bmi-status'];
    List<dynamic> tempList = json['suggested-food-list'];
    for (var element in tempList) {
      _suggestedFoodList.add(element);
    }


    _thankNot = json['thank-note'];
    _accuracy = json['accuracy'];
    _codeStatus = json['code-status'];
  }

  String get codeStatus => _codeStatus;

  set codeStatus(String value) {
    _codeStatus = value;
  }

  String get accuracy => _accuracy;

  set accuracy(String value) {
    _accuracy = value;
  }

  String get thankNot => _thankNot;

  set thankNot(String value) {
    _thankNot = value;
  }

  List<String> get suggestedFoodList => _suggestedFoodList;

  set suggestedFoodList(List<String> value) {
    _suggestedFoodList = value;
  }

  String get bmiStatus => _bmiStatus;

  set bmiStatus(String value) {
    _bmiStatus = value;
  }

  String get bmiMsg => _bmiMsg;

  set bmiMsg(String value) {
    _bmiMsg = value;
  }

  String get ageClass => _ageClass;

  set ageClass(String value) {
    _ageClass = value;
  }

  String get preference => _preference;

  set preference(String value) {
    _preference = value;
  }

  String get weight => _weight;

  set weight(String value) {
    _weight = value;
  }

  String get height => _height;

  set height(String value) {
    _height = value;
  }

  String get age => _age;

  set age(String value) {
    _age = value;
  }
}