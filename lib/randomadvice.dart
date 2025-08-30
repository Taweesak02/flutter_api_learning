import 'package:api_homework/apiservices.dart';
import 'package:api_homework/quoteapi.dart';
import 'package:flutter/material.dart';

class RandomAdvice extends StatefulWidget {
  const RandomAdvice({super.key});

  State<RandomAdvice> createState() => _RandomState();
}

class _RandomState extends State<RandomAdvice> {
  late QuoteApi quoteapi;

  void initState() {
    super.initState();
    quoteapi = QuoteApi();
    fetchAdvice();
  }

  Future<void> fetchAdvice() async {
    try {
      final result = await Apiservices().request('');
      setState(() {
        quoteapi = result;
      });
    } catch (error) {
      showSnackBar('Error: $error');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Advice")),
      body: Column(
        children: [
          SizedBox(height: 20),
          quoteapi.slip != null
              ? Container(
                child: ListTile(
                  title: Text(
                    quoteapi.slip!.advice.toString(),
                    textScaler: TextScaler.linear(2),
                  ),
                ),
              )
              : Container(child: ListTile(title: Text('have some problem',style:TextStyle(color: Colors.red),))),
          SizedBox(height: 20),
          Card(
            child: InkWell(
                onTap: () async {
                  // Action when button is pressed
                  await Apiservices()
                      .request('')
                      .then((QuoteApi quoteapi) {
                        setState(() {
                          this.quoteapi = quoteapi;
                        });
                      })
                      .catchError((error) {
                        showSnackBar('Error: $error');
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Click"),
                ),
              ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
