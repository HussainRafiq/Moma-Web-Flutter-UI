import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moma_web/src/pages/dashboard_fragments/upload_campaign.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:intl/intl.dart';
import '../components/pointsLlnechart.dart';
import '../components/table.dart';

class HomeFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeFragState();
}

class HomeFragState extends State<HomeFrag> {
  bool isMobile() {
    return MediaQuery.of(context).size.width < 550;
  }

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  bool isAdding = false;
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
                  isAdding
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 45,
                                padding: const EdgeInsets.all(8),
                                child: OutlinedButton(
                                  child: const Text('Cancel Upload Campaign'),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.red[700],
                                    primary: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isAdding = false;
                                    });
                                  },
                                )),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 45,
                                padding: const EdgeInsets.all(8),
                                child: OutlinedButton(
                                  child: const Text('Upload Campaign'),
                                  style: OutlinedButton.styleFrom(
                                    primary:
                                        Theme.of(context).colorScheme.primary,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isAdding = true;
                                    });
                                  },
                                )),
                            Container(
                              padding: EdgeInsets.all(4),
                              width: 45,
                              height: 45,
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Icon(
                                  Icons.notifications,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                        color: Colors.grey.withOpacity(0.8),
                                        width: 1.5)),
                              ),
                            )
                          ],
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  !isAdding
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Text(
                                "Hi Brazilian Flame Bar and Grill, here is whats happening today.",
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            isMobile()
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : const SizedBox(),
                            Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LinearProgressIndicator(
                                        backgroundColor: Colors.white,
                                        minHeight: 15,
                                        semanticsLabel: "40%",
                                        semanticsValue: "40",
                                        value: 40),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: OutlinedButton(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          'Today',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                  onPressed: () {
                                    _showDateRangeDialog();
                                  },
                                )),
                            widgets(context),
                          ],
                        )
                      : UploadCampaignFrag()
                ],
              ),
            )));
  }

  Container widgets(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: StaggeredGrid.count(
          mainAxisSpacing: 6,
          crossAxisCount: isMobile() ? 2 : 4,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sales",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ 0.00",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Earning",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ 0.00",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Paginview",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                          "Sales This Month",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Orders",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Total",
                        style: TextStyle(color: Colors.amber),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Completed",
                        style: TextStyle(color: Colors.blue),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Pending",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Processing",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Cancelled",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "on Hold",
                        style: TextStyle(color: Colors.orange),
                      ),
                      trailing: Text(
                        "0",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
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
                          Icons.announcement,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Last Announcement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            primary: Theme.of(context).colorScheme.primary,
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                          onPressed: () {},
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      child: Center(
                          child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: [
                          Icon(
                            Icons.announcement_rounded,
                            color: Colors.grey[200],
                            size: 100,
                          ),
                          Text(
                            "No Announcement",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200],
                                fontSize: 16),
                          ),
                        ],
                      )),
                    )
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
                          Icons.reviews,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Spam",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Trash",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Pending",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
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
                          Icons.compass_calibration,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Campaign",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Total",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Pending Review",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 4,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Live Campaign",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Table(children: [
                      TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                   <--- left side
                                color: Theme.of(context).colorScheme.primary,
                                width: 3.0,
                              ),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Campaign',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Status',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Action',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          ]),
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Up To 38% off on Musuem at The Museum of Art',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('To Be Launched 2-Jun-2022',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Draft',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.more_horiz))
                            ]),
                      ]),
                    ]),
                  ],
                ),
              ),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(),
                    isMobile()
                        ? SizedBox()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ID',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Date',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Name',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Email',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Subscription',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Activated',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Publication',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('QTY',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Expiry',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Status',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          ]),
                    ]),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.fit(
                crossAxisCellCount: 4,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "SPONSORED CAMPAIGN RESULTS",
                    style: TextStyle(fontSize: 26),
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                  SizedBox(
                    height: 10,
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> _showDateRangeDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        DateTime start = DateTime.now(), end = DateTime.now();

        return AlertDialog(
          content: dateRangePickerWidget(start: start, end: end),
        );
      },
    );
  }

  Widget ThisMonthChart({bool isArea = false}) {
    return Container(
      height: 300,
      child: PointsLineChart.withSampleData(),
    );
  }
}

class dateRangePickerWidget extends StatefulWidget {
  const dateRangePickerWidget({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  final DateTime start;
  final DateTime end;

  @override
  State<dateRangePickerWidget> createState() => _dateRangePickerWidgetState();
}

class _dateRangePickerWidgetState extends State<dateRangePickerWidget> {
  DateTime start = DateTime.now(), end = DateTime.now();
  List<String> filter = [
    "Today",
    "Yesterday",
    "Last 7 Days",
    "Last 30 Days",
    "Last Month",
    "Last Year",
  ];

  String currentRang = "";
  DateRangePickerController drpc = DateRangePickerController();
  @override
  initState() {
    super.initState();
    setState(() {
      start = widget.start;
      end = widget.end;
      currentRang = filter[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: MediaQuery.of(context).size.width > 950
            ? 900
            : MediaQuery.of(context).size.width - 50,
        child: Row(
          children: [
            Expanded(
              child: SfDateRangePicker(
                controller: drpc,
                enableMultiView: true,
                viewSpacing: 20,
                initialSelectedDates: [widget.start, widget.end],
                toggleDaySelection: true,
                selectionMode: DateRangePickerSelectionMode.range,
                headerStyle:
                    DateRangePickerHeaderStyle(textAlign: TextAlign.center),
                onSubmit: (vl) {
                  Navigator.pop(context);
                },
                onCancel: () {
                  Navigator.pop(context);
                },
                showActionButtons: true,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs val) =>
                    {
                  setState(() {
                    if (val.value.startDate != null) {
                      start = val.value.startDate as DateTime;
                    }
                    if (val.value.endDate != null) {
                      end = val.value.endDate as DateTime;
                    }
                  })
                },
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 0.5, color: Colors.black))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date Range",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Please select Date Range',
                        border: OutlineInputBorder()),
                    isEmpty: currentRang == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: currentRang,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            currentRang = newValue!;
                          });
                          if (currentRang == filter[0]) {
                            setState(() {
                              start = DateTime.now();
                              end = DateTime.now();
                            });
                          } else if (currentRang == filter[1]) {
                            setState(() {
                              start =
                                  DateTime.now().subtract(Duration(days: 1));
                              end = DateTime.now();
                            });
                          } else if (currentRang == filter[2]) {
                            setState(() {
                              start =
                                  DateTime.now().subtract(Duration(days: 7));
                              end = DateTime.now();
                            });
                          } else if (currentRang == filter[3]) {
                            setState(() {
                              start =
                                  DateTime.now().subtract(Duration(days: 30));
                              end = DateTime.now();
                            });
                          } else if (currentRang == filter[4]) {
                            setState(() {
                              start = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                              );
                              end = DateTime.now();
                            });
                          } else if (currentRang == filter[5]) {
                            setState(() {
                              start = DateTime(
                                DateTime.now().year,
                              );
                              end = DateTime.now();
                            });
                          }
                          setState(() {
                            drpc.selectedRange = PickerDateRange(start, end);
                          });
                        },
                        items: filter.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Start Date",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: TextEditingController(
                        text: DateFormat('yyyy-MM-dd').format(
                            start)), //editing controller of this TextField

                    decoration: InputDecoration(border: OutlineInputBorder()),
                    keyboardType: TextInputType.datetime,
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "End Date",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: TextEditingController(
                        text: DateFormat('yyyy-MM-dd').format(
                            end)), //editing controller of this TextField
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}
