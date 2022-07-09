import 'package:fashion/common/brand_color.dart';
import 'package:fashion/common/brand_text.dart';
import 'package:fashion/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  static const routeName = "Login";

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: BrandColor.brandColor,
            body: SafeArea(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: BrandColor.light,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const _LoginForm(),
                ),
              ),
            ),
          );
        });
  }
}

class _LoginForm extends ViewModelWidget<LoginViewModel> {
  const _LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BrandText.commonText(text: "Login", fontSize: 25.0, fontWeight: BrandText.bold, color: BrandColor.brandColor),
          const SizedBox(height: 16.0),
          const _LoginTextFeild(
            lable: "Email",
            type: LoginType.email,
          ),
          const SizedBox(height: 8.0),
          const _LoginTextFeild(
            lable: "Password",
            type: LoginType.password,
          ),
          const SizedBox(height: 12.0),
          const _Button(),
          if (viewModel.errorText != "")
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BrandText.commonText(
                text: viewModel.errorText,
                fontSize: 14.0,
                color: BrandColor.warning,
                fontWeight: BrandText.medium,
              ),
            )
        ],
      ),
    );
  }
}

class _LoginTextFeild extends ViewModelWidget<LoginViewModel> {
  final String lable;
  final LoginType type;

  const _LoginTextFeild({Key? key, required this.lable, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: BrandText.commonText(text: lable, fontSize: 16.0, fontWeight: BrandText.medium),
            )),
        const SizedBox(width: 8.0),
        Expanded(flex: 3, child: _TextFeild(type: type)),
      ],
    );
  }
}

class _TextFeild extends ViewModelWidget<LoginViewModel> {
  final LoginType type;
  const _TextFeild({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      keyboardType: type == LoginType.email ? TextInputType.emailAddress : TextInputType.visiblePassword,
      textInputAction: type == LoginType.email ? TextInputAction.next : TextInputAction.done,
      style: BrandText.textStyle(fontSize: 16.0, color: BrandColor.dark),
      obscureText: type == LoginType.password,
      decoration: InputDecoration(
        filled: true,
        fillColor: BrandColor.glass,
        errorMaxLines: 2,
        errorText: "",
        errorStyle: BrandText.textStyle(fontSize: 11.0, fontStyle: FontStyle.italic, color: BrandColor.warning, height: 0.8),
        contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        border: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
      ),
      validator: (value) => viewModel.validateTextFeild(value, type: type),
      onChanged: (value) => viewModel.onTextChange(value, type: type),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
        borderSide: BorderSide(color: BrandColor.dark, width: 1.5),
        borderRadius: BorderRadius.circular(0.0),
      );
}

class _Button extends ViewModelWidget<LoginViewModel> {
  const _Button({Key? key}) : super(key: key, reactive: false);
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => viewModel.onSignIn(context),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          decoration: BoxDecoration(
              color: BrandColor.brandColor.withOpacity(0.4),
              border: Border.all(
                color: BrandColor.brandColor,
                width: 1.5,
              )),
          child: BrandText.commonText(text: "Sign-in", fontSize: 16.0),
        ),
      ),
    );
  }
}
