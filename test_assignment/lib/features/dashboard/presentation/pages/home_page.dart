import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_assignment/features/dashboard/presentation/getx/messages_controller.dart';

import '../../../../constants/app_constant.dart';
import '../../../../constants/text_styles.dart';
import '../../../../shared/Helpers/image_helper.dart';
import '../../../../shared/Helpers/string_helper.dart';
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
    final getMessagesController = Get.put(MessagesController());

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
                GetX<MessagesController>(builder: (controller) {
                  // if(controller.)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.messages.value.hydramember == null ? 0 : controller.messages.value.hydramember!.length,
                        itemBuilder: (context2, messageIndex) {
                          isSectionOpen.add(false);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: 2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        isSectionOpen[messageIndex] = !isSectionOpen[messageIndex];
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
                                          Expanded(
                                            child: Text(
                                              // "Data",
                                              controller.messages.value.hydramember![messageIndex].subject.toString(),
                                              style: ConstantTextStyles.body16(context),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            StringHelper.convertTimeToAgoShort(
                                              DateTime.parse(controller.messages.value.hydramember![messageIndex].createdAt.toString()),
                                            ),
                                            style: ConstantTextStyles.bodySM14(context),
                                          ),
                                          if (isSectionOpen[messageIndex])
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
                                  if (isSectionOpen[messageIndex]) SizedBox(height: 16),
                                  if (isSectionOpen[messageIndex])
                                    Container(
                                      padding: EdgeInsets.only(left: 32, right: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("From: " + controller.messages.value.hydramember![messageIndex].from!.address.toString()),
                                          Text("Name: " + controller.messages.value.hydramember![messageIndex].from!.name.toString()),
                                          SizedBox(height: 16),
                                          Text(
                                            "Subject: " + controller.messages.value.hydramember![messageIndex].subject.toString(),
                                          ),
                                          SizedBox(height: 16),
                                          Text(controller.messages.value.hydramember![messageIndex].intro.toString()),
                                          SizedBox(height: 16),
                                          Text(
                                            "Sent at: " +
                                                DateFormat('hh:mm a, EEE, dd-MM-yyyy')
                                                    .format(DateTime.parse(controller.messages.value.hydramember![messageIndex].createdAt.toString())
                                                        .toLocal())
                                                    .toString(),
                                            style: ConstantTextStyles.bodySM14(context),
                                          ),
                                          SizedBox(height: 16),
                                        ],
                                      ),
                                    ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}