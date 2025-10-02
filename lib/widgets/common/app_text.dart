import 'package:amrita_treatment/core/app_colors.dart';
import 'package:flutter/material.dart';

Widget text24Normal({
  String text = '',
  Color color = AppColors.primaryTextElement,
  FontWeight fontweight = FontWeight.normal,
  TextAlign textalign = TextAlign.center,
}) {
  return Text(
    text,
    textAlign: textalign,
    style: TextStyle(color: color, fontSize: 24, fontWeight: fontweight),
  );
}

class Text16Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int lines;
  const Text16Normal({
    super.key,
    this.color = AppColors.primaryTextElement,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: lines,
      style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
  }
}

class Text17Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const Text17Normal({
    super.key,
    this.color = AppColors.primaryTextElement,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: 17, fontWeight: fontWeight),
    );
  }
}

class Text18Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int lines;
  const Text18Normal({
    super.key,
    this.color = AppColors.primaryTextElement,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      maxLines: lines,
      style: TextStyle(color: color, fontSize: 18, fontWeight: fontWeight),
    );
  }
}

class Text20Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int lines;
  const Text20Normal({
    super.key,
    this.color = AppColors.primaryTextElement,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      maxLines: lines,
      style: TextStyle(color: color, fontSize: 20, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const Text14Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryTextElement,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: 14, fontWeight: fontWeight),
    );
  }
}

class Text15Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int lines;
  const Text15Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryTextElement,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: lines,
      overflow: TextOverflow.fade,
      style: TextStyle(color: color, fontSize: 15, fontWeight: fontWeight),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text10Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryTextElement,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(color: color, fontSize: 10, fontWeight: fontWeight),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text11Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryTextElement,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final int lines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const Text13Normal({
    super.key,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.lines = 1,
    this.color = AppColors.primaryTextElement,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: lines,
      style: TextStyle(color: color, fontSize: 13, fontWeight: fontWeight),
    );
  }
}

Widget bottomtext() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        color: AppColors.secondaryTextElement,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ), // default style
      children: [
        TextSpan(
          text:
              "By creating or logging into an account you are agreeing with our ",
        ),
        TextSpan(
          text: "Terms and Conditions",
          style: TextStyle(
            color: AppColors.hypertext,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        TextSpan(text: " and "),
        TextSpan(
          text: "Privacy Policy",
          style: TextStyle(
            color: AppColors.hypertext,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        TextSpan(text: "."),
      ],
    ),
  );
}
