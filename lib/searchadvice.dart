import 'package:api_homework/quoteapi.dart';
import 'package:flutter/material.dart';
import 'apiservices.dart';

class SearchAdvice extends StatefulWidget {
  const SearchAdvice({super.key});

  @override
  State<SearchAdvice> createState() => _SearchAdviceState();
}

class _SearchAdviceState extends State<SearchAdvice> {
  late QuoteApi quoteapi;

  @override
  void initState() {
    super.initState();
    quoteapi = QuoteApi();
  }

  @override
  Widget build(BuildContext context) {
    String year = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Advice Search ID',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Please enter Id:',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                    hintText: 'Enter a Id',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    year = value; // Capture the input IP address
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Action when button is pressed
                    await Apiservices()
                        .request(year)
                        .then((QuoteApi quoteapi) {
                          setState(() {
                            this.quoteapi = quoteapi;
                          });
                        })
                        .catchError((error) {
                          showSnackBar('Error: $error');
                        });
                  },
                  child: const Text('Search Quote'),
                ),
              ),
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
                  : Container(child: ListTile(title: Text('not found',style:TextStyle(color: Colors.red),))),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
