import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CampaignListFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CampaignListFragState();
}

class CampaignListFragState extends State<CampaignListFrag> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              color: Colors.white,
              width: 150,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'All Dates',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.white,
              width: 200,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: '-Select Categories-',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.white,
              width: 150,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Product Time',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.white,
              width: 150,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: '-Select Filter-',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  'FIlters',
                ),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))),
              ),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              color: Colors.white,
              width: 200,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: '-Bulk Action-',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  'Appy',
                ),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        isMobile()
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [table(context)],
                ),
              )
            : table(context),
      ],
    );
  }

  Table table(BuildContext context) {
    return Table(
        columnWidths: isMobile()
            ? {
                0: FixedColumnWidth(70),
                1: FixedColumnWidth(100),
                2: FixedColumnWidth(250),
                3: FixedColumnWidth(80),
                4: FixedColumnWidth(50),
                5: FixedColumnWidth(70),
                6: FixedColumnWidth(90),
                7: FixedColumnWidth(120),
                8: FixedColumnWidth(100),
                9: FixedColumnWidth(70),
                10: FixedColumnWidth(80),
                11: FixedColumnWidth(70),
                12: FixedColumnWidth(90),
                13: FixedColumnWidth(150),
              }
            : {0: FixedColumnWidth(70)},
        border: TableBorder.all(
          color: Color.fromRGBO(158, 158, 158, 1),
          width: 1.0,
        ),
        children: [
          TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  //                   <--- left side
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Checkbox(value: true, onChanged: (tick) {})),
                ),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('Image',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('Name',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('Status',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Icon(
                        Icons.circle_notifications_sharp,
                        color: Colors.red,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('SKU',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Stock',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Price',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Earning',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Type',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Orders',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('View',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Conversion Rate',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Date',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  //                   <--- left side
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Checkbox(value: true, onChanged: (tick) {})),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/img.jpeg",
                      width: 50,
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Pikled Pig Brewery',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Container(
                        width: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Online",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Icon(
                        Icons.circle_notifications_sharp,
                        color: Colors.grey,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('__',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('In Stock',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Wrap(
                        children: [
                          Text('\$5.00',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.lineThrough)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('\$ 3.00',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline))
                        ],
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('\$ 13.50',
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('August 7,2022 Published',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  //                   <--- left side
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Checkbox(value: true, onChanged: (tick) {})),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/img.jpeg",
                      width: 50,
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Carrara Mini Golf',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Container(
                        width: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Online",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Icon(
                        Icons.circle_notifications_sharp,
                        color: Colors.grey,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('__',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('In Stock',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Wrap(
                        children: [
                          Text('\$5.00',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.lineThrough)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('\$ 3.00',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline))
                        ],
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('\$ 2.70',
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('100%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('August 7,2022 Published',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
              ]),
          TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  //                   <--- left side
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Checkbox(value: true, onChanged: (tick) {})),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/img.jpeg",
                      width: 50,
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Brazillizan Flame Bar and Grill',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Container(
                        width: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Online",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Icon(
                        Icons.circle_notifications_sharp,
                        color: Colors.grey,
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('__',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('In Stock',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Wrap(
                        children: [
                          Text('\$5.00',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.lineThrough)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('\$ 3.00',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline))
                        ],
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('\$ 10.70',
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('August 7,2022 Published',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
              ]),
        ]);
  }
}
