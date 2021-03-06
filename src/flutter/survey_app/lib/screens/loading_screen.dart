import 'package:flutter/material.dart';
import 'package:surveyapp/constants.dart';
import 'package:surveyapp/questions.dart';
import 'package:surveyapp/screens/survey_page.dart';

class LoadingScreen extends StatefulWidget {
  var hospitalId;
  LoadingScreen(this.hospitalId);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() async {
    var questions = await Questions().getQuestions(widget.hospitalId);  // TODO: get hospital id from front page

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SurveyPage(questions: questions)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loadingScreenWidget,
      ),
    );
  }
}