import 'package:flutter/material.dart';
import 'package:flutter_medical/components/default_button.dart';
import 'package:flutter_medical/components/form_errors.dart';
import 'package:flutter_medical/screens/complete_profile/complete_profile.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_medical/services/auth_service.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String confirmPass;
  bool remember = false;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
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
          SizedBox(height: 30,),
          buildConfirmPasswordFormField(),
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
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ))
            ],
          ),
          FormErrors(errors: errors),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
              }
              context
                  .read<Authentication>()
                  .registerWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              )
                  .whenComplete(() => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CompleteProfile())));
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
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
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
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
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
        suffixIcon: Icon(
          Icons.mail_outline,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
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
        } else if (value.length < 5 && !errors.contains(kShortPassError)) {
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
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPass = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty &&
            passwordController.text == confirmPass &&
            errors.contains(kMatchPassError)) {
          removeError(error: kMatchPassError);
        }
        confirmPass = value;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if ((passwordController.text != value &&
            !errors.contains(kMatchPassError))) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Re-enter your password',
        labelText: ' Confirm Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: nameController,
      onChanged: (value) {
        if (value.isNotEmpty && value.length >= 6) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && value.length < 6) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your Full Name',
        labelText: 'Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.account_circle,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneNumberController,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kPhoneNumberNullError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: kPhoneNumberNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 0),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 0),
      ),
    );
  }
}
