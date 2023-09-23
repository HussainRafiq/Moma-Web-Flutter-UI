import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? Container(
            height: 220,
            child: ListView(
                scrollDirection: Axis.horizontal, children: [table_C(context)]),
          )
        : table_C(context);
  }

  Table table_C(BuildContext context) {
    return Table(
        border: TableBorder.all(
          color: Colors.grey,
          width: 1.0,
        ),
        columnWidths: MediaQuery.of(context).size.width < 600
            ? {
                0: FixedColumnWidth(70),
                1: FixedColumnWidth(MediaQuery.of(context).size.width > 750
                    ? (MediaQuery.of(context).size.width - 1250)
                    : 170),
                2: FixedColumnWidth(170),
                3: FixedColumnWidth(80),
                4: FixedColumnWidth(180),
                5: FixedColumnWidth(180),
                6: FixedColumnWidth(130),
              }
            : {
                0: FixedColumnWidth(70),
              },
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
                        child: Text('Name',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('Order From Highlights',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Views',
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
                      child: Text('Cost Per Sale Date',
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Pikled Pig Brewery',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Carrier Golf Mini',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('100%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Brazillian Flame Bar',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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

class TableWidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1.0,
        ),
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
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
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('First Name',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 10.0),
                        child: Text('Last Name',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Age',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('School',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Fund Raised',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Membership Sold',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10.0),
                      child: Text('Pikled Pig Brewery',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
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
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Carrier Golf Mini',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Carrier Golf Mini',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('100%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Brazillian Flame Bar',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 10, right: 10),
                      child: Text('Carrier Golf Mini',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('70%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text('\$2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))),
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
