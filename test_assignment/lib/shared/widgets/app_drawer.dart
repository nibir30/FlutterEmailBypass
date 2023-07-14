import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constant.dart';
import '../../constants/text_styles.dart';
import '../../features/logIn/presentation/logout_bloc/logout_bloc.dart';
import '../../router/routing_variables.dart';
import '../Helpers/image_helper.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  LogoutBloc logoutBloc = LogoutBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
      child: Container(
        width: 260,
        child: Drawer(
          backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : AppConstant.neutral90,
          child: Column(
            children: [
              SizedBox(
                height: 154,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // !darkThemeProvider.getDarkThemeStatus()
                    //     ? Image.asset('lib/assets/images/medibee_logo.png')
                    //     : Image.asset('lib/assets/images/logo_dark_mode.jpg'),
                    SizedBox(height: 8),
                    Text(
                      "version: 1.0.0",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppConstant.secondaryTextColor60,
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: Colors.grey),
              InkWell(
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Row(
                    children: [
                      ImageHelper.getSvg(
                        "setting",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Settings",
                        style: ConstantTextStyles.body16(context),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   Navigation.helpDeskPage,
                  // );
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Row(
                    children: [
                      ImageHelper.getSvg(
                        "message_q",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Help Desk",
                        style: ConstantTextStyles.body16(context),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Row(
                    children: [
                      ImageHelper.getSvg(
                        "info_circle",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "About Us",
                        style: ConstantTextStyles.body16(context),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   Navigation.authPage,
                  //   (route) => false,
                  // );
                  logoutBloc.add(RequestLogoutEvent());
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Row(
                    children: [
                      ImageHelper.getSvg(
                        "logout",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: AppConstant.criticalColor60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocListener(
                bloc: logoutBloc,
                listener: (context, state) {
                  if (state is LogoutErrorState) {
                  } else if (state is LogoutSuccessState) {
                    // Navigator.pushReplacementNamed(context, Navigation.authPage);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Navigation.authPage,
                      (route) => false,
                    );
                  }
                },
                child: BlocBuilder(
                  bloc: logoutBloc,
                  builder: (context, state) {
                    if (state is LogoutLoadingState) {
                      //return Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  },
                ),
              ),
              Spacer(),
              Divider(
                color: AppConstant.neutral10,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
