import 'package:flutter/material.dart';
import 'bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Icon right(){
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 35.0,
    );
  }
  Icon wrong(){
    return const Icon(
      Icons.close,
      color: Colors.red,
      size: 35.0,
    );
  }

  List<Widget> score = [];

  Bank b = Bank();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(child: Center(
          child: TextButton(
            onPressed: (){
              setState(() {
                b.restart();
                score.clear();
              });
            },
            style: TextButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text(
                'Restart',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        )),
        Expanded (
          flex: 5,
          child: Padding(
            padding:  const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                b.getq(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                bool ca = b.geta();
                if (ca == true){
                  setState(() {
                    score.add(right());
                    b.incres();
                  });
                }
                else{
                  setState(() {
                    score.add(wrong());
                  });
                }
                setState(() {
                  b.nextq();
                });
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                bool ca = b.geta();
                if (ca == false){
                  setState(() {
                    score.add(right());
                    b.incres();
                  });
                }
                else{
                  setState(() {
                    score.add(wrong());
                  });
                }
                setState(() {
                  b.nextq();
                });
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}

