import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    //creo lo state che mi ritorna il QuizState
    return _QuizState();
  }
}

//creo la classe QuizState perchè è un widget statefull
class _QuizState extends State<Quiz> {
  
  // Widget activeScreen = const StartScreen(switchScreen);

  // ^ devo fare in modo che StartScreen (la mia funzione di schermata iniziale)
  //possa avere accesso alla funzione di commutazione della schermata (switchScreen),
  //Come faccio?
  //Passo un puntatore alla schermata di commutazione per avviare la schermata
  //quindi, aggiungo il nome del metodo(switchScreen) alla 
  //mia schermata iniziale (StartScreen riga 18) senza mettere le ()
  //altrimenti chiamerebbe subito la funzione, in wuesto modo utilizzo
  //la funzione ogni volta che mi serve
 
  Widget? activeScreen; //lo impostiamo su null, e aggiungo il ? per dire che activeScreen può essere anche null
                        //non ha un valore perchè verrà poi creato in initState

@override
//setto uno stato di inizializzazione
  void initState() {
    activeScreen = StartScreen(switchScreen); //imposto come schermo attivo la schermata iniziale
    super.initState(); //verrà chiamato questo initState prima di ogi cosa, in maniera tale da inizializzare prima la schermata di avvio
  }

 void switchScreen() {
    setState(() {  //imposto il cambiamento di stato
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //metto in un container cosi posso aggiungere dei decoratoir
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 68, 151)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
