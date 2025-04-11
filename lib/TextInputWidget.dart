import 'package:flutter/material.dart';

class TextInputScreen extends StatefulWidget {
  @override
  TextInputWidget createState() => TextInputWidget();
}

class TextInputWidget extends State<TextInputScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isPasswordVisible = false;
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Input Widget ShowCase')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Basic Text Input'),
              TextField(
                decoration: InputDecoration(hintText: 'Enter text here'),
              ),
              SizedBox(height: 20),
              Text('2. Text Input with Controller'),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                  suffixIcon: IconButton(
                    onPressed: () => _controller.clear(),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('3. Password input'),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('4.Multiline Text Input '),

              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter multiple lines of text...',
                ),
              ),
              SizedBox(height: 20),
              Text('5. Read-Only TextField'),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Read-Only',
                  hintText: 'you cannot edit this field',
                ),
              ),
              SizedBox(height: 20),
              Text('6. Styled TextField with Border and Icons'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'UserName',
                ),
              ),
              SizedBox(height: 20),
              Text('7. Validation & Error Handling'),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter at least 5 characters',
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                ),
                onChanged: (value) {
                  setState(() {
                    _errorText = value.length < 5 ? 'Too short!' : '';
                  });
                },
              ),
              SizedBox(height: 20),
              Text('8.Number Only input'),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter a number'),
              ),
              SizedBox(height: 20),
              Text('9. Email Input with keyboard Type'),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              Text('10. input with Character counter'),
              TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: " max 20 characters",
                  counterText: '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
