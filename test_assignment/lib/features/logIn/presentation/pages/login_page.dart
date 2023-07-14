import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/features/logIn/presentation/getx_login/login_controller.dart';
import 'package:test_assignment/features/signUp/presentation/pages/sign_up_page.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';
import '../../../../shared/widgets/submit_button_widget.dart';
import '../../domain/entities/login_request_entity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

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
                      "Welcome User",
                      style: ConstantTextStyles.bodyBold16(context).copyWith(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in",
                    style: ConstantTextStyles.titleBold18(context),
                  ),
                ),
                // SizedBox(height: 4),
                // ContactUsRow(problemText: "Sign in Problem?"),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: ConstantTextStyles.subTitle14(context),
                    ),
                    SizedBox(height: 8),
                    Container(
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
                          hintText: "Enter your mail address",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: AppConstant.textFieldBorderColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Password",
                      style: ConstantTextStyles.subTitle14(context),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.light ? AppConstant.neutral30 : AppConstant.neutral70,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        style: ConstantTextStyles.body16(context),
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: AppConstant.neutral30),
                          suffix: Container(
                            child: isObscure
                                ? Column(
                                    children: [
                                      SizedBox(height: 27),
                                      InkWell(
                                        onTap: () {
                                          setState(
                                            () {
                                              isObscure = !isObscure;
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Show",
                                          style: TextStyle(
                                            color: AppConstant.primary60,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(height: 27),
                                      InkWell(
                                        onTap: () {
                                          setState(
                                            () {
                                              isObscure = !isObscure;
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Hide",
                                          style: TextStyle(
                                            color: AppConstant.primary60,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                SizedBox(height: AppConstant.paddingSmall),
                InkWell(
                  onTap: () {
                    LoginRequestEntity loginRE = LoginRequestEntity();
                    loginRE.address = mailController.text;
                    loginRE.password = passwordController.text;
                    loginController.login(loginRE, context);
                  },
                  child: SubmitButtonWidget(title: "Sign in"),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "or ",
                      style: TextStyle(
                        color: Color.fromRGBO(127, 135, 147, 1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                        style: ConstantTextStyles.bodyBold16(context, AppConstant.primary60),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
