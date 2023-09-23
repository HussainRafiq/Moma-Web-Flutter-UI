import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/pointsLlnechart.dart';
import '../components/table.dart';

class WithdrawFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WithdrawFragState();
}

class WithdrawFragState extends State<WithdrawFrag> {
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
                Text(
                  "Withdraw",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Accordion(
                  contentBorderRadius: 0,
                  headerBorderRadius: 0,
                  paddingListHorizontal: 0,
                  maxOpenSections: 3,
                  headerBackgroundColorOpened: Colors.black54,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,

                      headerBackgroundColor: Colors.grey[200],
                      headerBackgroundColorOpened: Colors.grey[200],

                      header: const Text(
                        'Balance',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),

                      content: Container(
                          alignment: FractionalOffset.center,
                          child: Column(
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Flexible(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: const [
                                          Text(
                                            'Your Balance : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            '\$ 0.00',
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: const [
                                          Text(
                                            'Withdraw Threshold : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            '0 days',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          )),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                      // onOpenSection: () => print('onOpenSection ...'),
                      // onCloseSection: () => print('onCloseSection ...'),
                    ),
                    AccordionSection(
                      isOpen: true,

                      headerBackgroundColor: Colors.grey[200],
                      headerBackgroundColorOpened: Colors.grey[200],

                      header: const Text(
                        'Payment Details',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),

                      content: Container(
                          alignment: FractionalOffset.center,
                          child: Column(
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Flexible(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Payment',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'You donot have any approved withdraw yet ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          )),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                      // onOpenSection: () => print('onOpenSection ...'),
                      // onCloseSection: () => print('onCloseSection ...'),
                    ),
                    AccordionSection(
                      isOpen: true,

                      headerBackgroundColor: Colors.grey[200],
                      headerBackgroundColorOpened: Colors.grey[200],

                      header: const Text(
                        'Payment Method',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),

                      content: Container(
                          alignment: FractionalOffset.center,
                          child: Column(
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Flexible(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: const [
                                          Text(
                                            'Paypal : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '( d.0___________@___.com)',
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          )),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                      // onOpenSection: () => print('onOpenSection ...'),
                      // onCloseSection: () => print('onCloseSection ...'),
                    ),
                  ],
                ),
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
