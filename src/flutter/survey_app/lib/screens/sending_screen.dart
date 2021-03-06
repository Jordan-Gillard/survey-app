// The POST request to /api/responses expects a response formatted like the
// following:
// {
//  "hospital_id": 1,
//  "responses" : [
//    {
//      "question_id": 1,
//      "option_selected": 2,
//      "response_text": null
//    },
//    {
//      "question_id": 2,
//      "option_selected": null,
//      "response_text": "I really liked my visit with my doctor. He took a lot of time to listen to me."
//    }
//  ]
//}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:surveyapp/constants.dart';
import 'package:surveyapp/questions.dart';
import 'package:surveyapp/screens/thank_you.dart';

class SendingScreen extends StatefulWidget {
  final responseDict;

  SendingScreen({this.responseDict});

  @override
  _SendingScreenState createState() => _SendingScreenState();
}

class _SendingScreenState extends State<SendingScreen> {
  @override
  void initState() {
    super.initState();
    postResponse();
  }

  void postResponse() async {
    Questions questionClass = Questions();
    await questionClass.postResponse(widget.responseDict);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThankYouScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loadingScreenWidget;
  }
}
