import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werry/utils/text_styles_utils.dart';

typedef ValidateFunc = bool Function(String);
typedef GetTextCb = void Function(String);

class TextInputSearch extends StatefulWidget {
  final TextEditingController controller;

  final bool isInputValid;
  final String validateErrMsg;

  TextInputSearch({this.validateErrMsg, this.controller, this.isInputValid = false});

  @override
  _TextInputSearchState createState() => _TextInputSearchState();
}

class _TextInputSearchState extends State<TextInputSearch> {
  @override
  Widget build(BuildContext context) {
    if (widget.isInputValid) {
      return _buildTextField();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextField(),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            widget.validateErrMsg,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Container(
      height: 50,
      child: TextFormField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            hasFloatingPlaceholder: false,
            labelText: 'Search',
            labelStyle: TextStylesUtils.styleAvenir14VeryLightPinkFourW400,
            fillColor: Colors.transparent ,
            filled: true,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            prefixIcon: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),),
          controller: widget.controller,
          focusNode: null,
          style: null,
          cursorColor: null,
          autofocus: false
      ),
    );
  }
}
