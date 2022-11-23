class WelcomeNote{
  String _greeting = '';
  String _welcomeNote_1 = '';
  String _welcomeNote_2 = '';
  String _sentenceConnector = '';

  WelcomeNote();

  WelcomeNote.init(this._greeting, this._welcomeNote_1, this._welcomeNote_2, this._sentenceConnector);

  WelcomeNote.fromJson(var json){
    _greeting = json['greeting'];
    _welcomeNote_1 = json['welcome-note-1'];
    // _welcomeNote_2 = json['welcome-note-2'];
    _sentenceConnector = json['sentence-connector'];
  }

  // ignore: unnecessary_getters_setters
  String get sentenceConnector => _sentenceConnector;

  // ignore: unnecessary_getters_setters
  set sentenceConnector(String value) {
    _sentenceConnector = value;
  }

  // ignore: unnecessary_getters_setters
  String get welcomeNote_2 => _welcomeNote_2;

  // ignore: unnecessary_getters_setters
  set welcomeNote_2(String value) {
    _welcomeNote_2 = value;
  }

  // ignore: unnecessary_getters_setters
  String get welcomeNote_1 => _welcomeNote_1;

  // ignore: unnecessary_getters_setters
  set welcomeNote_1(String value) {
    _welcomeNote_1 = value;
  }

  // ignore: unnecessary_getters_setters
  String get greeting => _greeting;

  // ignore: unnecessary_getters_setters
  set greeting(String value) {
    _greeting = value;
  }
}