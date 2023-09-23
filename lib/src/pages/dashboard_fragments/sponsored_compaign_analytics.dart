import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/pointsLlnechart.dart';
import '../components/table.dart';

class SponsoredCampaignAnalyticFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SponsoredCampaignAnalyticFragState();
}

class SponsoredCampaignAnalyticFragState
    extends State<SponsoredCampaignAnalyticFrag> {
  bool isMobile() {
    return MediaQuery.of(context).size.width < 550;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: StaggeredGrid.count(
                mainAxisSpacing: 6,
                crossAxisCount: isMobile() ? 2 : 4,
                crossAxisSpacing: 10,
                children: [
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 4,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "SPONSORED Campaign RESULTS",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      )),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 4,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HIGHLIGHT",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 26),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TableWidget(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home Page Gallery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 26),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TableWidget(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Ad",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 26),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TableWidget(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Notification",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 26),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TableWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    ]);
  }
}
