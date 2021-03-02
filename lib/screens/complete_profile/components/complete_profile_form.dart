import 'package:flutter/material.dart';
import 'package:flutter_medical/components/default_button.dart';
import 'package:flutter_medical/components/form_errors.dart';
import 'package:flutter_medical/screens/home/home_screen.dart';
import 'package:flutter_medical/services/auth_service.dart';
import 'package:flutter_medical/services/database.dart';
import 'package:flutter_medical/services/storage.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final ImagePicker _picker = ImagePicker();
  File _imageFile;

  Future<File> pickImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
    return _imageFile;
  }

  Users user = Users(
    bloodGroup: "",
    name: "",
    address: "",
    height: "",
    weight: "",
    uid: '',
    diseases: [],
    maps: {},
  );

  final formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

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
          InkWell(
            onTap: () async {
              // final File _image = await pickImage();
              await pickImage().whenComplete(() async {
                await context.read<Storage>().uploadFile(
                      _imageFile,
                    );
              });
            },
            child: Container(
              height: getProportionateScreenWidth(100),
              width: getProportionateScreenWidth(100),
              child: Icon(
                Icons.add,
                size: getProportionateScreenWidth(50),
              ),
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  shape: BoxShape.circle),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth / 2.3,
                child: buildHeightFormField(),
              ),
              Container(
                width: SizeConfig.screenWidth / 2.3,
                child: buildWeightFormField(),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
              }
              String url = await context.read<Storage>().downloadURL();
              final String uid = await context.read<Authentication>().getCurrentUserId();
              user.name = nameController.text;
              user.address = addressController.text;
              user.uid = uid;
              user.phoneNumber = phoneNumberController.text;
              user.height = heightController.text;
              user.weight = weightController.text;
              user.url = url;
              context.read<Database>().firestore.collection('users').doc(uid).set(user.toJson(),)
                  .whenComplete(() => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())));
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.location_on),
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
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
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

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
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
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.account_circle),
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

  TextFormField buildHeightFormField() {
    return TextFormField(
      controller: heightController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kHeightNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kHeightNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Height",
        hintText: "Height",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: Icon(Icons.account_circle),
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

  TextFormField buildWeightFormField() {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kWidthNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kWidthNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Height",
        hintText: "Height",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: Icon(Icons.account_circle),
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
