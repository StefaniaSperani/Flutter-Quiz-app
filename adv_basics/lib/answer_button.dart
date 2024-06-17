import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  //aggiungo required perche in dart gli argomenti con nome sono opzionali
  //e grazie al this possono ricevere valori con le proprietà che hanno gli stessi nomi

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 18, 17, 124),
        foregroundColor: Colors.white,
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    );
  }
}
