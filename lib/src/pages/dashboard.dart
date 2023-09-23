import 'package:flutter/material.dart';
import 'package:moma_web/src/pages/dashboard_fragments/admin.dart';
import 'package:moma_web/src/pages/dashboard_fragments/Compaign.dart';
import 'package:moma_web/src/pages/dashboard_fragments/feedback.dart';
import 'package:moma_web/src/pages/dashboard_fragments/home.dart';
import 'package:moma_web/src/pages/dashboard_fragments/not_for_profit_dashboard.dart';
import 'package:moma_web/src/pages/dashboard_fragments/sponsored_Compaign.dart';
import 'package:moma_web/src/pages/dashboard_fragments/sponsored_Compaign_analytics.dart';
import 'package:moma_web/src/pages/dashboard_fragments/withdraw.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  bool isExtend = true;
  var controller = SidebarXController(selectedIndex: 0, extended: true);
  int activeIndex = 0;
  bool isMobile() {
    return MediaQuery.of(context).size.width < 550;
  }

  @override
  initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        activeIndex = -1;
      });
      setState(() {
        isExtend = controller.extended;
        activeIndex = controller.selectedIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(alignment: Alignment.topLeft, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/vector5.png",
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Image.asset(
          "assets/images/vector3.png",
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
        isMobile() && !isExtend
            ? IconButton(
                onPressed: () {
                  controller.toggleExtended();
                },
                icon: const Icon(Icons.menu, color: Colors.white))
            : const SizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidebarX(
              headerBuilder: (context, extended) {
                return extended
                    ? Image.network(
                        "assets/images/logo_header_div.png",
                      )
                    : Container(
                        margin: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10, right: 10),
                        child: Image.network(
                          "assets/images/logo.png",
                        ),
                      );
              },
              extendedTheme: SidebarXTheme(
                  textStyle: const TextStyle(color: Colors.white),
                  iconTheme: const IconThemeData(color: Colors.white),
                  selectedItemDecoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  selectedItemTextPadding: const EdgeInsets.only(left: 10),
                  selectedTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  itemTextPadding: const EdgeInsets.only(left: 10),
                  width: isMobile()
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    transform: GradientRotation(-45),
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ))),
              theme: SidebarXTheme(
                  width: isMobile() ? 0 : 70,
                  textStyle: const TextStyle(color: Colors.white),
                  iconTheme: const IconThemeData(color: Colors.white),
                  selectedItemDecoration: const BoxDecoration(
                    color: Color.fromRGBO(50, 173, 247, 1),
                  ),
                  selectedItemTextPadding: const EdgeInsets.only(left: 10),
                  selectedTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  itemTextPadding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(50, 173, 247, 1),
                      Color.fromRGBO(126, 225, 252, 1),
                    ],
                  ))),
              controller: controller,
              items: const [
                SidebarXItem(icon: Icons.dashboard, label: 'Home'),
                SidebarXItem(icon: Icons.cases, label: 'Campaigns'),
                SidebarXItem(icon: Icons.shopping_cart, label: 'Orders'),
                SidebarXItem(icon: Icons.pie_chart_sharp, label: 'NFP'),
                // SidebarXItem(
                //     icon: Icons.assignment_sharp, label: 'Request Quotes'),
                SidebarXItem(
                    icon: Icons.card_giftcard_outlined,
                    label: 'Sponsored Campaigns'),
                SidebarXItem(icon: Icons.reviews, label: 'Reviews'),
                SidebarXItem(
                    icon: Icons.account_balance_wallet, label: 'Withdraw'),
                SidebarXItem(icon: Icons.roundabout_left, label: 'Admin'),
                // SidebarXItem(icon: Icons.analytics, label: 'Analytics'),
                // // SidebarXItem(icon: Icons.announcement, label: 'Announcement'),
                // SidebarXItem(icon: Icons.build, label: 'Tools'),
              ],
            ),
            isMobile() && isExtend
                ? Container()
                : Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: EdgeInsets.only(
                            top: 50,
                            left: isMobile() ? 0 : 40,
                            right: isMobile() ? 0 : 40),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Color.fromARGB(255, 231, 255, 248),
                        ),
                        child: getFrag(activeIndex)))
          ],
        )
      ]),
    );
  }

  Widget getFrag(index) {
    switch (index) {
      case 0:
        return HomeFrag();
      case 1:
        return CampaignFrag();
      case 3:
        return NotForProfitFrag();
      case 4:
        return SponsoredCampaignAnalyticFrag();
      case 5:
        return FeedbackFrag(
          isLoading: true,
        );
      // case 5:
      //   return FeedbackFrag();
      case 6:
        return WithdrawFrag();
      case 7:
        return AdminFrag();
      default:
        return Container();
    }
  }
}
