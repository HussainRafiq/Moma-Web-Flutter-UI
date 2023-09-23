import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../components/table.dart';

class SponsoredCampaignFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SponsoredCampaignFragState();
}

class SponsoredCampaignFragState extends State<SponsoredCampaignFrag> {
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
                  Text(
                    "Top Ad",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  panelFirst(),
                  SizedBox(
                    height: 5,
                  ),
                  panelTwo(),
                  SizedBox(
                    height: 5,
                  ),
                  panelThree(),
                  SizedBox(
                    height: 5,
                  ),
                  panelFour(),
                ],
              ),
            )));
  }

  Container panelFirst() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Binding",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Accordion(
            contentBorderRadius: 0,
            headerBorderRadius: 0,
            paddingListHorizontal: 0,
            maxOpenSections: 3,
            headerBackgroundColorOpened: Colors.black54,
            paddingListBottom: 0,
            openAndCloseAnimation: true,
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,

                headerBackgroundColor: Colors.grey[200],
                headerBackgroundColorOpened: Colors.grey[200],

                header: const Text(
                  '',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: const [
                                    Text(
                                      'What do you want to focus on?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder()),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: "0",
                                        items: [
                                          DropdownMenuItem<String>(
                                              value: "0",
                                              child: Text("Clicks")),
                                          DropdownMenuItem<String>(
                                              value: "1", child: Text("Views")),
                                          DropdownMenuItem<String>(
                                              value: "2",
                                              child: Text("Conversions"))
                                        ],
                                        onChanged: (Object? value) {},
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Recommendation for your Campaign',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: const Text(
                                    'Set a maximum cost per click bid limit',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Checkbox(
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: const [
                                    Text(
                                      'Maximum CPC Bid Limit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder()),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        items: [
                                          DropdownMenuItem<String>(
                                              child: Text("A\$"))
                                        ],
                                        onChanged: (Object? value) {},
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 550),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                            "The Campaign will use the maximize clicks bid strategy to help you get the most click at the cost per click at or below your bid limit"),
                                      )
                                    ],
                                  ),
                                )
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                child: const Text('Next'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () {},
              )
            ],
          )
        ]),
      ),
    );
  }

  Container panelTwo() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Accordion(
            contentBorderRadius: 0,
            headerBorderRadius: 0,
            paddingListHorizontal: 0,
            maxOpenSections: 3,
            paddingListTop: 0,
            headerBackgroundColorOpened: Colors.black54,
            paddingListBottom: 0,
            openAndCloseAnimation: true,
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Colors.grey[200],
                headerBackgroundColorOpened: Colors.grey[200],

                header: const Text(
                  'Location',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: const [
                                    Text(
                                      'Select locations to target',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Radio(
                                      groupValue: "bt",
                                      value: "sp",
                                      onChanged: (ab) {}),
                                  title: Text(
                                    "All countries and territories",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                ListTile(
                                  leading: Radio(
                                      groupValue: "bt",
                                      value: "rp",
                                      onChanged: (ab) {}),
                                  title: Text(
                                    "Add another location",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                ListTile(
                                  leading: Radio(
                                      groupValue: "bt",
                                      value: "tp",
                                      onChanged: (ab) {}),
                                  title: Text(
                                    "Austrailia",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
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
        ]),
      ),
    );
  }

  Container panelThree() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Keyboards and ads',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ad groups help you organize your ads around a common theme. For the best result, Focus your ads and keywords on one product or service',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Accordion(
            contentBorderRadius: 0,
            headerBorderRadius: 0,
            paddingListHorizontal: 0,
            maxOpenSections: 3,
            paddingListTop: 0,
            headerBackgroundColorOpened: Colors.black54,
            paddingListBottom: 0,
            openAndCloseAnimation: true,
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Colors.grey[200],
                headerBackgroundColorOpened: Colors.grey[200],

                header: const Text(
                  'Keywords',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),

                content: Container(
                    alignment: FractionalOffset.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get keyword suggestions',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 450,
                          child: OutlinedButton(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.link,
                                      color: Colors.grey[900],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Product (Select Product Here)',
                                      style: TextStyle(color: Colors.grey[900]),
                                    )
                                  ]),
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: 450,
                            child: OutlinedButton(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shop,
                                        color: Colors.grey[900],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Enter product of services',
                                        style:
                                            TextStyle(color: Colors.grey[900]),
                                      )
                                    ]),
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {},
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Enter Keywords',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Keywords are phrase or words that are used to match your ads with the terms people are serching for',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          minLines: 7,
                          maxLines: 10,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Match types help control which searches can triggers your ads',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Keyword = board match "keyword" = Pres match [keyword] >> Exact match',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10),
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
        ]),
      ),
    );
  }

  Container panelFour() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Budgets',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Select the average you want to spend each day.',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Accordion(
            contentBorderRadius: 0,
            headerBorderRadius: 0,
            paddingListHorizontal: 0,
            maxOpenSections: 3,
            paddingListTop: 0,
            headerBackgroundColorOpened: Colors.black54,
            paddingListBottom: 0,
            openAndCloseAnimation: true,
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                headerBackgroundColor: Colors.grey[200],
                headerBackgroundColorOpened: Colors.grey[200],

                header: Text(
                  'Budget',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),

                content: Container(
                    alignment: FractionalOffset.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Set your average daily budget for this Campaign',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: TextField(
                                      minLines: 1,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          hintText: "\$5",
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            flex: 2,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 300),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        width: 1, color: Colors.grey))),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, right: 5),
                            child: Text(
                              "For the month, you wasnot pay more then your daily budget times the average the number of days in a month. Some days you might spend less then your daily budget and on others you might spend upto twice as much.",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ])),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
