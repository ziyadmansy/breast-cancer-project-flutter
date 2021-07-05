import 'package:flutter/material.dart';

class Temblet extends StatefulWidget {
  final String hint;
  final Function onClick;
  final IconData iconData;
  final IconData sufIcon;
  bool showpass;
  ValueChanged<String> onChanged;

  Temblet(
      {Key key,
      this.hint,
      this.onClick,
      this.iconData,
      this.sufIcon,
      this.onChanged});

  @override
  _TembletState createState() => _TembletState();
}

class _TembletState extends State<Temblet> {
  error_message() {
    switch (widget.hint) {
      case "Enter your Full Name":
        return "Please Enter your Full Name";
      case "Enter Your Email":
        return " Please Enter your Email";
        break;
      case "Enter Your Password":
        return "Please Enter your Password ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 6),
      child: TextFormField(
        onChanged: widget.onChanged,
        onSaved: widget.onClick,
        obscureText: widget.hint == "Enter Your Password" ? true : false,
        validator: (value) {
          if (value.isEmpty) {
            return error_message();
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: Icon(widget.iconData),
        ),
      ),
    );
  }
}
