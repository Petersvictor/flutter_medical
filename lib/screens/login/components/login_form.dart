import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical/components/default_button.dart';
import 'package:flutter_medical/components/form_errors.dart';
import 'package:flutter_medical/screens/doctors/doctors_list.dart';
import 'package:flutter_medical/screens/home/home_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_medical/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final formKey = GlobalKey<FormState>();
  final List <String> errors = [];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool remember = false;

  void addError ({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError ({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30,),
          buildPasswordFormField(),
          SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                  'Remember me'
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Text('Forgot Password', style: TextStyle(decoration: TextDecoration.underline),))
            ],
          ),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenWidth(20),),
          DefaultButton(
            text: 'Continue',
            press: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
              }
              final UserCredential userCredential = await context.read<Authentication>().signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text);
              if(userCredential != null)
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DoctorsList()));
            },
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Enter your email',
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.mail_outline,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0
        ),
      ),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length <5 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0
        ),
      ),
    );
  }
}
