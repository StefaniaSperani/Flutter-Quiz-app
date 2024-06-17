import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity, //usa la massima larghezza disponibile
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          //con lo spread op prendo tutti i valori di un elenco, li estrae
          //e li colloca come valori separati da virgole, quindi avrò
          // dei pulsanti di risposta singoli, completamente separati da virgole
          ...currentQuestion.answers.map((answer){ //map trasforma il valore della lista che ho in una lista di widgets
            //e non cambia la lista originale, ma ritorna un nuovo elenco
            return AnswerButton(answerText: answer, onTap: (){});
          }),
        ],
      ),
    );
  }
}
