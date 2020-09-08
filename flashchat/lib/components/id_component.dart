import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class IdWidget extends StatefulWidget {
  final String actionLabel;
  final String heroButtonTag;
  final Color color;
  final Function(String, String) authAction;

  const IdWidget({
    Key key,
    this.actionLabel,
    this.heroButtonTag,
    this.color,
    this.authAction,
  }) : super(key: key);

  @override
  IdWidgetState createState() => IdWidgetState();
}

class IdWidgetState extends State<IdWidget> {
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: mHorizontalLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                      height: 200, child: Image.asset('images/logo.png')),
                ),
              ),
              SizedBox(height: 48),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (email) => this.email = email,
                decoration: _inputDecoration('Enter your email', widget.color),
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (password) => this.password = password,
                decoration:
                    _inputDecoration('Enter your password', widget.color),
              ),
              SizedBox(height: 24),
              Hero(
                tag: widget.heroButtonTag,
                child: roundedButton(
                  title: widget.actionLabel,
                  color: widget.color,
                  onPressed: () async {
                    setState(() => showSpinner = true);
                    await widget.authAction(email, password);
                    setState(() => showSpinner = false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration(String hint, Color color) => InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      border: OutlineInputBorder(borderRadius: kBorderRadius),
      enabledBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: color, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kBorderRadius,
        borderSide: BorderSide(color: color, width: 2),
      ),
    );
