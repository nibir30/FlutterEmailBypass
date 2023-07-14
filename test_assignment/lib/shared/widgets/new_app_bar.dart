import 'package:flutter/material.dart';

class MyNewAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isBackButtonEnabled;
  final String? backButtonNavigationTo;
  const MyNewAppBar({this.title, this.isBackButtonEnabled = true, this.backButtonNavigationTo = ""});

  @override
  State<MyNewAppBar> createState() => _MyNewAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _MyNewAppBarState extends State<MyNewAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(0, 164, 219, 1),
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.isBackButtonEnabled == true)
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (widget.backButtonNavigationTo == "") {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(context, widget.backButtonNavigationTo!, (route) => false);
                    }
                  },
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 10),
              ],
            ),
          Expanded(
            child: widget.title != null
                ? Text(
                    widget.title!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    "Medibee",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
