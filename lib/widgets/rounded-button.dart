import 'package:flutter/material.dart';
import 'package:snu_traffik/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,

    @required this.buttonName,this.onPress
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
