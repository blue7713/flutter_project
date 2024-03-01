import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackForm());
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 0;
  String _successMessage = '';
  double _sliderValue = 0;
  bool _agreeToTerms = false;
  String _name = '';
  String _email = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Feedback Form',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Dave Lee',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty){
                       return 'Please enter your name';
                      }
                      return null;
                      },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'dream@fun-coding.org',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Tell us about your experience',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text(
                    'How would you rate our app?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Text(
                    '$_rating',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(5, (index){
                    return Radio<int>(
                        value: index + 1,
                        groupValue: _rating,
                        onChanged: (int? value) {
                          setState(() {
                            _rating = value!;
                          });
                        },
                      activeColor: Colors.deepPurple,
                        );
                  }),
                ),
                ListTile(
                  title: Text(
                    'How satisfied are you with our customer service?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Text(
                    '${_sliderValue.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: Colors.deepPurple,
                    label: _sliderValue.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    }),
                CheckboxListTile(
                  title: Text('Subscribe to our newsletter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                    value: _agreeToTerms,
                    onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                    },
                  activeColor: Colors.deepPurple,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        setState(() {
                          _successMessage = 'Submission Complete!';
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal:24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                    child: Text(
                      'submit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                ),
                Padding(
                    padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      _successMessage,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
