import 'package:flutter/material.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';
import '../../../../shared/Helpers/image_helper.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/widgets/new_app_bar.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  _DashBoardPageState();

  List<bool> isSectionOpen = [false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext pageContext) {
    final size = MediaQuery.of(pageContext).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: AppDrawer(),
        appBar: MyNewAppBar(
          title: "Dashboard",
          isBackButtonEnabled: false,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Inbox",
                    style: ConstantTextStyles.titleBold18(context, AppConstant.neutral60),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context2, mySectionIndex) {
                        isSectionOpen.add(false);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 2),
                            Column(
                              children: [
                                Divider(
                                  height: 0,
                                  thickness: 1,
                                  // color: AppConstant.neutral20,
                                  color: AppConstant.neutral20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSectionOpen[mySectionIndex] = !isSectionOpen[mySectionIndex];
                                    });
                                  },
                                  child: Container(
                                    height: 56,
                                    padding: EdgeInsets.all(16),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        ImageHelper.getSvg("note_4"),
                                        SizedBox(width: 8),
                                        Text(
                                          "Data",
                                          style: ConstantTextStyles.body16(context),
                                        ),
                                        Spacer(),
                                        if (isSectionOpen[mySectionIndex])
                                          Icon(
                                            Icons.keyboard_arrow_up,
                                            color: AppConstant.neutral50,
                                          )
                                        else
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppConstant.neutral50,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: Theme.of(context).brightness == Brightness.light ? AppConstant.neutral20 : AppConstant.neutral80,
                                ),
                                if (isSectionOpen[mySectionIndex]) SizedBox(height: 16),
                                if (isSectionOpen[mySectionIndex])
                                  Container(
                                    child: Text("Inbox"),
                                  ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
