class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers; //una lista di stringhe

  List<String> getShuffledAnswers() {
    //utilizzo of per fare una copia della lista delle risposte,
    //e con shuffle la mescolo. Lo faccio perchè
    //shuffle modifica l'elenco origanle, e siccome voglio che
    //la prima risposta del mio elenco sia sempre esatta
    //allora creo una copia delle risposte
    final shuffledList = List.of(answers);
    //shuffle non riotnra nulla, quindi memorizzo la copia in una variabile, 
    //cosi potrò avere in return l'elenco rimescolato
    shuffledList.shuffle();
    return shuffledList;
  }
}
