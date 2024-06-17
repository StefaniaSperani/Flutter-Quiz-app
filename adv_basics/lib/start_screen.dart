import 'package:flutter/material.dart';


const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {
  //aggiungo come argomento una funzione(startQuiz) con () perchè non prende argomenti,
  //(switchScreen in quiz.dart non prende argomenti), 
  //e sarà void perchè non mi restituisce nessun valore

  // const StartScreen(void Function() startQuiz,{super.key});

  //startQuiz da sola non è sufficiente, perchè gli argomenti che accetto nella funzione costruttore
  //non posso usarli nel metodo di costruzione(in questo caso onPressed)
  //quindi imposto una variabile final, perchè la imposterò una sola volta
  //quando verrà creato il widget startScreen, e sarà del tipo void Function(),
  //quindi posso togliere dal costruttore questi due elementi:

  const StartScreen(this.startQuiz,{super.key});
  //siccome il nome della mia variabile finale è uguale a startQuiz,
  //posso utilizzare la scorciatoia this. così in automatico impostiamo il valore
  //che otteniamo da questo argomento come valore per la variabile.
  //Quindi quando la classe viene creata, e l'oggetto istanziato, la variabile
  //startQuiz viene impostata sul valore che riceve dall'argomento startQuiz,
  //ed ora che ho la variabile startQuiz, posso utilizzarla ovunque nella classe, 
  //e di conseguenza nel mio metodo onPressed

  final void Function() startQuiz;


  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset('assets/images/quiz-logo.png', width: 300,),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 240, 237, 237),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); //funzionerà solo premendo il bottone
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start quiz!'),
          ),
        ],
      ),
    );
  }
}
