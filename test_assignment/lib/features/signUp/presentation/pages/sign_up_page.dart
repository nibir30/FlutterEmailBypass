import 'package:flutter/material.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';
import '../../../../core/utils/toast.dart';
import '../../../../router/routing_variables.dart';
import '../../../../shared/widgets/submit_button_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String domainName = "@example.com";
  List<String> collegeNames = [];
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;

  // RegistrationBloc registrationBloc = RegistrationBloc();
  // AllCollegeBloc collegeBloc = AllCollegeBloc();

  @override
  void initState() {
    // collegeBloc.add(AllCollegeRequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            controller: fullNameController,
                            decoration: InputDecoration(
                              hintText: "Enter your full name",
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
                                domainName + " ",
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
                // BlocListener(
                //   bloc: registrationBloc,
                //   listener: (context, state) {
                //     if (state is RegistrationSuccessState) {
                //       if (agreeToTerms == true) {
                //         // Navigator.pushReplacementNamed(
                //         //   context,
                //         //   // Navigation.otpPage,
                //         //   Navigation.categoryPage,
                //         //   arguments: state.registrationResponseEntity.username,
                //         // );
                //       }
                //     }
                //   },
                //   child: InkWell(
                //     onTap: () {
                //       // registrationBloc.add(RegistrationLoadingEvent());
                //       // RegistrationRequestEntity registrationReqEnt = RegistrationRequestEntity();
                //       // registrationReqEnt.fullName = fullNameController.text;
                //       // registrationReqEnt.nickName = nickNameController.text;

                //       // if (registrationReqEnt.password != registrationReqEnt.passwordConfirmation) {
                //       //   toastMsg("Password doesn't match");
                //       // } else {
                //       // registrationBloc.add(RegistrationRequestEvent(registrationReqEnt));
                //       // Navigator.pushNamed(
                //       //   context,
                //       //   Navigation.categoryPage,
                //       //   arguments: registrationReqEnt,
                //       // );
                //       // }
                //     },
                //     child: SubmitButtonWidget(title: "Next"),
                //   ),
                // ),

                // SizedBox(height: 16),
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
