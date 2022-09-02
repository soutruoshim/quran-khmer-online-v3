
import 'package:flutter/material.dart';
import 'package:quran_khmer_online/common_widget/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    @required Color color,
    @required Color textColor,
    VoidCallback onPressed
  }) :assert(text != null),
      super(
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 15.0),
      ),
      color: color,
      borderRadius: 4.0,
      onPressed: onPressed
  );
}
