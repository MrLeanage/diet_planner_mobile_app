class DietPlannerQuestion{
  String _dietPlannerParameter = '';
  String _dietPlannerQuestion = '';
  String _dietPlannerAnswer = '';

  DietPlannerQuestion();

  DietPlannerQuestion.initAll(this._dietPlannerParameter, this._dietPlannerQuestion,
      this._dietPlannerAnswer);

  DietPlannerQuestion.fromJson(var json){
    this._dietPlannerParameter = json['parameter'];
    this._dietPlannerQuestion = json['question'];
    this._dietPlannerAnswer = json['answer'];
  }

  // ignore: unnecessary_getters_setters
  String get dietPlannerAnswer => _dietPlannerAnswer;

  // ignore: unnecessary_getters_setters
  set dietPlannerAnswer(String value) {
    _dietPlannerAnswer = value;
  }

  // ignore: unnecessary_getters_setters
  String get dietPlannerQuestion => _dietPlannerQuestion;

  // ignore: unnecessary_getters_setters
  set dietPlannerQuestion(String value) {
    _dietPlannerQuestion = value;
  }

  // ignore: unnecessary_getters_setters
  String get dietPlannerParameter => _dietPlannerParameter;

  // ignore: unnecessary_getters_setters
  set dietPlannerParameter(String value) {
    _dietPlannerParameter = value;
  }
}