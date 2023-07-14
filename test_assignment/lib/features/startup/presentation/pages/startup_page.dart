import 'package:flutter/material.dart';
import 'package:test_assignment/features/dashboard/presentation/pages/home_page.dart';
import 'package:test_assignment/features/logIn/presentation/pages/login_page.dart';

import '../../../../core/data_manager.dart';
import '../../../../core/user_info.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  late Future future;
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _configureRoute();
  }

  void _configureRoute() async {
    final _dataManager = DataManager();
    final String _token = await _dataManager.getAuthToken();

    if (_token.isNotEmpty) {
      setState(() {
        userInfo.authToken = _token;
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            // isLoggedIn == null ? CircularProgressIndicator() : (isLoggedIn == true ? SignUpPage() : HomePage()),
            isLoggedIn == null ? CircularProgressIndicator() : (isLoggedIn == true ? DashBoardPage() : LoginPage()),
          ],
        ),
      ),
    );
  }
}
