import 'question.dart';

class Bank{
  int _num = 0, _res = 0;
  final List<Question> _qbank = [
    Question('Mumbai is India\'s capital', false),
    Question('Tiger is national animal of India', true),
    Question('Humans have red color blood', true),
    Question('Animals produce Chlorophyll for photosynthesis', false),
    Question('Rupees is the currency of India', true),
  ];

  String getq(){
    return _qbank[_num].q;
  }

  bool geta(){
    return _qbank[_num].ans;
  }

  void nextq(){
    if (_num < _qbank.length - 1) {
      _num++;
    } else{
      int l = _qbank.length;
      String x = 'You got $_res questions out of $l questions';
      Question q1 = Question(x, true);
      _qbank.add(q1);
      _num++;
    }
  }

  void incres(){
    _res++;
  }

  void restart(){
    _num = 0;
    _res = 0;
    _qbank.removeLast();
  }

  bool change(){
    if (_num == _qbank.length){
      return true;
    }
    else {
      return false;
    }
  }
}