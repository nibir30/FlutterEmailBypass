import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/features/signUp/domain/entities/hydra_member_entity.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_request_entity.dart';
import 'package:test_assignment/features/signUp/presentation/get_signup/create_account_controller.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';
import '../../../../router/routing_variables.dart';
import '../../../../shared/widgets/submit_button_widget.dart';
import '../get_signup/available_domains_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String domainName = "example.com";
  String? choosenDomain;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final availableDomainsController = Get.put(AvailableDomainsController());
    final createAccountController = Get.put(CreateAccountController());
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Create Account",
                      style: ConstantTextStyles.titleBold18(context),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select from the available domains",
                          style: ConstantTextStyles.subTitle14(context),
                        ),
                        SizedBox(height: 8),
                        GetX<AvailableDomainsController>(
                          builder: (controller) {
                            return Container(
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppConstant.neutral30),
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: AppConstant.neutral20,
                                borderRadius: BorderRadius.circular(16),
                                elevation: 0,
                                icon: Icon(Icons.keyboard_arrow_down),
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text(
                                  "Select Domain",
                                  style: TextStyle(
                                    color: AppConstant.neutral60,
                                    fontSize: 14,
                                  ),
                                ),
                                value: choosenDomain,
                                items: controller.availableDomains.value.hydramember != null
                                    ? controller.availableDomains.value.hydramember!.map<DropdownMenuItem<String>>(
                                        (HydraMemberEntity value) {
                                          return DropdownMenuItem<String>(
                                            value: value.domain,
                                            child: Container(
                                              child: Text(value.domain.toString()),
                                            ),
                                          );
                                        },
                                      ).toList()
                                    : ["No Available Domain"].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                              child: Text(value.toString()),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    choosenDomain = newValue;
                                    domainName = newValue!;
                                    // genderController.text = newValue.toString();
                                  });
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create a mail address",
                          style: ConstantTextStyles.subTitle14(context),
                        ),
                        SizedBox(height: 8),
                        Container(
                          // height: 60,
                          padding: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.light ? AppConstant.neutral30 : AppConstant.neutral70,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            style: ConstantTextStyles.body16(context),
                            controller: mailController,
                            decoration: InputDecoration(
                              suffix: Text(
                                "@" + domainName + " ",
                                style: ConstantTextStyles.bodySM14(context).copyWith(color: Colors.black),
                              ),
                              hintText: "Enter username",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: AppConstant.textFieldBorderColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: ConstantTextStyles.subTitle14(context),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.light ? AppConstant.neutral30 : AppConstant.neutral70,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: TextField(
                              style: ConstantTextStyles.body16(context),
                              obscureText: isObscure,
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: AppConstant.textFieldBorderColor,
                                ),
                                suffix: TextButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isObscure = !isObscure;
                                      },
                                    );
                                  },
                                  child: isObscure
                                      ? Text(
                                          "Show",
                                          style: TextStyle(
                                            color: AppConstant.primary60,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          "Hide",
                                          style: TextStyle(
                                            color: AppConstant.primary60,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password Confirmation",
                          style: ConstantTextStyles.subTitle14(context),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.light ? AppConstant.neutral30 : AppConstant.neutral70,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: TextField(
                              style: ConstantTextStyles.body16(context),
                              obscureText: isObscure,
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: AppConstant.textFieldBorderColor,
                                ),
                                suffix: TextButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isObscure = !isObscure;
                                      },
                                    );
                                  },
                                  child: isObscure
                                      ? Text(
                                          "Show",
                                          style: TextStyle(
                                            color: Color.fromRGBO(61, 97, 152, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          "Hide",
                                          style: TextStyle(
                                            color: Color.fromRGBO(61, 97, 152, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    SignupRequestEntity signupRequestEntity = SignupRequestEntity();
                    signupRequestEntity.address = mailController.text + "@" + domainName;
                    signupRequestEntity.password = passwordController.text;
                    createAccountController.createAccount(signupRequestEntity, context);
                  },
                  child: SubmitButtonWidget(title: "Create Account"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color.fromRGBO(127, 135, 147, 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Navigation.authPage);
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color.fromRGBO(11, 171, 203, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
