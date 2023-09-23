import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/pointsLlnechart.dart';
import '../components/table.dart';

class AdminFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AdminFragState();
}

class AdminFragState extends State<AdminFrag> {
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
      color: Colors.white,
      alignment: Alignment.topLeft,
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 45,
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: OutlinedButton(
                            child: const Text('Redeem'),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            onPressed: () {},
                          )),
                      Container(
                          height: 45,
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: OutlinedButton(
                            child: const Text('New Campaign'),
                            style: OutlinedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            onPressed: () {},
                          )),
                      Container(
                        padding: EdgeInsets.all(4),
                        color: Colors.white,
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
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width *
                              (isMobile() ? 1 : 0.4)) -
                          40,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Location (2)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "11 west 53rd Street New York , NY 10015",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Location attributes (WF parking cash-only).None.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "35-00-47th Avenue Long Island City, NY 11011",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Location attributes (WF parking cash-only).None.",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "COVID 19 Safety Banner",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Inactive",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Diversity Of UBOMI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Add Info",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Info",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              new InkWell(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Payment Info : Direct Deposit",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Tax Info",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              new InkWell(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Employer identification Number (EN) undefined\nBusiness Name on Record Moma",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Your Info",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name : Tim SCandeburly\nEmail Address : Tim@swammanagement.com.au",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "*************",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "What type of business are you?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(fontSize: 14),
                          ),
                          Divider(),
                          ListTile(
                            leading: Radio(
                                groupValue: "bt",
                                value: "sp",
                                onChanged: (ab) {}),
                            title: Text(
                              "Sole Provider",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Radio(
                                groupValue: "bt",
                                value: "ic",
                                onChanged: (ab) {}),
                            title: Text(
                              "Independent Contractor",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Radio(
                                groupValue: "bt",
                                value: "c",
                                onChanged: (ab) {}),
                            title: Text(
                              "Company ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Radio(
                                groupValue: "bt",
                                value: "tp",
                                onChanged: (ab) {}),
                            title: Text(
                              "Third Party",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enter Bank Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Payment owed to get you per your merchant agreement will be deposited into this account',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Bank Name",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Bank Name',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "BSB Number",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Example : 123456',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Account Number ",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Example : 123456',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Account Members (2)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  '+ Add Account Number',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                color: Colors.grey[300],
                                onPressed: () {},
                                child: Text("Admin"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MaterialButton(
                                color: Colors.grey[300],
                                onPressed: () {},
                                child: Text("Primary Content"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name : Parker Hewit\nEmail Address : parker@momaservicess.com.au",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                              ),
                              new InkWell(
                                child: new Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              new InkWell(
                                child: new Text(
                                  'Remove',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                color: Colors.grey[300],
                                onPressed: () {},
                                child: Text("Admin"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name : Tim SCandebury\nEmail Address : tim@swammanagement.com",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          !isMobile()
                              ? SizedBox(
                                  height: 10,
                                )
                              : needHelp()
                        ],
                      ),
                    ),
                    isMobile()
                        ? SizedBox(
                            height: 10,
                          )
                        : Expanded(child: needHelp())
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget needHelp() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Help",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "See answers to FAQs or get in touch with a respresentative by visitor.",
            style: TextStyle(fontSize: 14),
          ),
          new InkWell(
            child: new Text(
              'Merchant Support',
              style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: Divider(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Still need help?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: OutlinedButton(
              child: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
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
