import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/pointsLlnechart.dart';
import '../components/table.dart';

class NotForProfitFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotForProfitFragState();
}

class NotForProfitFragState extends State<NotForProfitFrag> {
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _controller.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset - 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _controller.animateTo(offset - 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset + 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _controller.animateTo(offset + 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
    return Container(
      child: RawKeyboardListener(
          autofocus: true,
          onKey: _handleKeyEvent,
          focusNode: _focusNode,
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isMobile()
                        ? SizedBox()
                        : Image.asset(
                            "assets/images/lgOne.png",
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                    isMobile()
                        ? SizedBox()
                        : SizedBox(
                            width: 20,
                          ),
                    Expanded(
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        children: [
                          SizedBox(
                            width: isMobile()
                                ? MediaQuery.of(context).size.width
                                : 500,
                            child: Text(
                              "Hi Robina Primary School.",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: isMobile() ? 25 : 40,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Here is what happening today",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    isMobile()
                        ? SizedBox()
                        : SizedBox(
                            width: 25,
                          ),
                    isMobile()
                        ? SizedBox()
                        : Container(
                            width: 150,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/genref.png",
                                  fit: BoxFit.fill,
                                  width: 150,
                                ),
                                OutlinedButton(
                                  child: const Text(
                                    'Generate',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: LinearProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  minHeight: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                  semanticsLabel: "40%",
                                  semanticsValue: "40",
                                  value: 40),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$1,904 raised",
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              "\$6,000 goal",
                              style: TextStyle(
                                  color: Colors.deepPurple[100],
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(15),
                    child: StaggeredGrid.count(
                      mainAxisSpacing: 6,
                      crossAxisCount: isMobile() ? 2 : 4,
                      crossAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxDecoration
                                    child: Center(
                                        child: Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.vertical,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blue),
                                          child: Icon(
                                            Icons.social_distance_sharp,
                                            color: Colors.yellow,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Total Sales",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "\$ 0.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                                  ), //Container
                                ), //Flexible
                                SizedBox(
                                  width: 20,
                                ),

                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxDecoration
                                    child: Center(
                                        child: Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.vertical,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.pinkAccent),
                                          child: Icon(
                                            Icons.ac_unit_outlined,
                                            color: Colors.yellow,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Memberships Solds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "33",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                                  ), //Container
                                ), //Flexible
                                SizedBox(
                                  width: 20,
                                ),
                                isMobile()
                                    ? SizedBox()
                                    : Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ), //BoxDecoration
                                          child: Center(
                                              child: Wrap(
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.vertical,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.pinkAccent),
                                                child: Icon(
                                                  Icons
                                                      .account_balance_wallet_sharp,
                                                  color: Colors.blue,
                                                  size: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Commission Make",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "\$ 1000",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          )),
                                        ), //Container
                                      ), //Flexible
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      "Top NFPs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                ThisMonthChartDiff()
                              ],
                            ),
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.bar_chart_sharp,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Total Sales",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                ThisMonthChart()
                              ],
                            ),
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          child: Container(
                              height: 500,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    "Top Volunteers",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Divider(),
                                  TableWidgetTwo(),
                                ],
                              )),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 4,
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "Order History",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Refunded",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 26),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add To Cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 26),
                                    ),
                                  ],
                                ),
                                Divider(),
                                isMobile()
                                    ? SizedBox()
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: '22-08-2022',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                              width: 250,
                                              child: const TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: '22-10-2022',
                                                ),
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          OutlinedButton(
                                            child: const Text(
                                              'Go',
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.orange,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            onPressed: () {},
                                          ),
                                          Flexible(child: Container()),
                                          OutlinedButton(
                                            child: const Text(
                                              'Export',
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.orange,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Table(children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Colors.black,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('ID',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Date',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Name',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Email',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Subscription',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Activated',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Publication',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('QTY',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Expiry',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Status',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ]),
                                        ),
                                      ]),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  Widget ThisMonthChart({bool isArea = false}) {
    return Container(
      height: 300,
      child: PointsLineChart.withSampleData(),
    );
  }

  Widget ThisMonthChartDiff({bool isArea = false}) {
    return Container(
      height: 300,
      child: PointsLineChart.withSampleDataDiff(),
    );
  }
}
