import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/widgets/common/app_boxdecoration.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double height;
  final bool isLogin;
  final bool isLoading;
  final BuildContext? context;
  final void Function()? func;
  const LoginButton({
    super.key,
    this.width = 325,
    this.height = 50,
    this.isLogin = true,
    this.func,
    this.context,
    this.buttonName = '',
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.52, vertical: 12.78),
      child: GestureDetector(
        onTap: isLoading ? null : func,
        child: Container(
          width: width,
          height: height,
          decoration: appboxdecoration(
            radius: 8.52,
            color: AppColors.buttoncolor,
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: AppColors.buttontextcolor)
                : Text17Normal(
                    text: buttonName,
                    color: AppColors.buttontextcolor,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),
    );
  }
}

class Addorsubbutton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double height;
  final bool isLogin;
  final bool isLoading;
  final BuildContext? context;
  final void Function()? func;
  const Addorsubbutton({
    super.key,
    this.width = 40,
    this.height = 40,
    this.isLogin = true,
    this.func,
    this.context,
    this.buttonName = '',
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.52),
      child: GestureDetector(
        onTap: isLoading ? null : func,
        child: Container(
          width: width,
          height: height,
          decoration: appboxdecoration(
            radius: 8.52,
            color: AppColors.buttoncolor,
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: AppColors.buttontextcolor)
                : Text17Normal(
                    text: buttonName,
                    color: AppColors.buttontextcolor,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),
    );
  }
}
