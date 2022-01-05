import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if(resultScore <= 26){
      resultText = "You are not so Unique!";
    }
    else if(resultScore <= 28){
      resultText = "Pretty Likeable!";
    }
    else if(resultScore <= 30){
      resultText = "You are awesome and innocent!";
    }
    else{
      resultText = "You are so Strange?!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
            FlatButton(child: Text("Try Again!"),
             textColor: Colors.blue,
             onPressed: resetHandler,)
        ],
      ),
    );
  }
}
