import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    // currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1; //shortcut
    setState(() {
    currentQuestionIndex++;
    });
  }


  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //usa la massima larghezza disponibile
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //con lo spread op prendo tutti i valori di un elenco, li estrae
            //e li colloca come valori separati da virgole, quindi avrò
            // dei pulsanti di risposta singoli, completamente separati da virgole
            ...currentQuestion.getShuffledAnswers().map((answer){ //map trasforma il valore della lista che ho in una lista di widgets
              //e non cambia la lista originale, ma ritorna un nuovo elenco
              return AnswerButton(answerText: answer, 
              onTap: () {
                answerQuestion(answer); //viene esguita quando la funzione anonima viene attivata
              },);
            }),
          ],
        ),
      ),
    );
  }
}
