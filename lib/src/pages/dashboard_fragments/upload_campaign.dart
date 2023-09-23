import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quil;
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:moma_web/src/pages/dashboard_fragments/sponsored_compaign.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UploadCampaignFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UploadCampaignFragState();
}

class UploadCampaignFragState extends State<UploadCampaignFrag> {
  bool isMobile() {
    return MediaQuery.of(context).size.width < 550;
  }

  int opcount = 1;
  List<double> sliderArr = [20];
  bool isAdding = false;
  bool isSubmitted = false;

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

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawKeyboardListener(
        autofocus: true,
        onKey: _handleKeyEvent,
        focusNode: _focusNode,
        child: SingleChildScrollView(
          controller: _controller,
          child: isSubmitted ? SponsoredCampaignFrag() : addCampaign(context),
        ));
  }

  Widget addCampaign(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Campaign",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 10,
        ),
        panelFirst(),
        SizedBox(
          height: 10,
        ),
        panelSecond(context),
        SizedBox(
          height: 15,
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              opcount++;
              sliderArr.add(20);
            });
          },
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(20),
          child: Text(
            "+ Add Another Option",
            style: TextStyle(color: Colors.white),
          ),
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(
          height: 15,
        ),
        panelThree(context),
        SizedBox(
          height: 10,
        ),
        panelFour(context),
        SizedBox(
          height: 10,
        ),
        panelFive(context),
        SizedBox(
          height: 10,
        ),
        panelFinal(context),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Container panelFinal(BuildContext context) {
    int total = 0;
    bool isc1 = false;
    bool isc2 = false;
    bool isc3 = false;
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
          margin: EdgeInsets.only(left: 5),
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's review and sign your contract",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 15),
              Text(
                "Tip: Check the box to indicate that you've read and agree to the Terms and conditions, to sign in then enter your name to sign the contract on behakf of the merchant.",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width:
                    MediaQuery.of(context).size.width - (isMobile() ? 50 : 450),
                margin: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UBOMI Merchant Agreement",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Efective Date 08/24/2022",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "The UBOMI Merchant Agreement (\"Agreement\")  entered into by :\n\nUBOMI Merchant Services,LLC(\"GMS\")\n600 West Chicago Ave, Suite 620 \nChicago IL 60654\n\nMoma(\"Merchant\")\n11 West 53rd Street\nNewyork NY 10019\nUS",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "The agreement is governed by Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2)),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'I duly authorized representative of merchant and my checking the box confirms that Merchants consent bound to be this agreement and the terms and condition.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Your Full Name Then Submit",
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
                  hintText: 'Enter Your Full Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sponsor Your Campaign',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sponsor your campaign to be at the top of every page within your desired market place',
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 400,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Highlights',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Make your ad pop with a colourful background. It\'ll help you stand out from the crowd and attract more visits',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$10",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  leading: Checkbox(
                    value: isc1,
                    onChanged: (bool? value) {
                      setState(() {
                        isc1 = value!;
                      });
                      if (value == true) {
                        setState(() {
                          total += 10;
                        });
                      }
                      if (value == false) {
                        setState(() {
                          total -= 10;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 400,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Homepage Gallery',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Want to be center of attraction ? Place your ad in the gallery on our homepage , where no one can miss it.',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$20",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  leading: Checkbox(
                    value: isc2,
                    onChanged: (bool? value) {
                      setState(() {
                        isc2 = value!;
                      });
                      if (value == true) {
                        setState(() {
                          total += 20;
                        });
                      }
                      if (value == false) {
                        setState(() {
                          total -= 20;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 400,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Notify anyone within your area of your latest and greatest deals',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$15",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  leading: Checkbox(
                    value: isc3,
                    onChanged: (bool? value) {
                      setState(() {
                        isc3 = value!;
                      });
                      if (value == true) {
                        setState(() {
                          total += 15;
                        });
                      }
                      if (value == false) {
                        setState(() {
                          total -= 15;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Total Will Be ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$ $total",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                child: Text(
                  'Sponsor Your Campaign',
                  style: TextStyle(fontSize: 20),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  setState(() {
                    isSubmitted = true;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Container panelFive(BuildContext context) {
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
          margin: EdgeInsets.only(left: 5),
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Describe What's Included in this Campaign",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Options",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$60 Worth of Rodizio Dinners for Two Adults; Valid Sunday-Friday",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$120 Worth of Rodizio Dinners for Four Adults; Valid Sunday-Friday",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Campaign Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: richTextEditor(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Highlights Your Campaign",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sumamarize the best aspects of your Campaign here , keep it short, 1-2 sentences.",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Campaign Highlights",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: richTextEditor(),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "140 words remaining",
                style: TextStyle(fontSize: 14),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Describe Your Business",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "About The Meusuem of Modern Art",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: richTextEditor(),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "140 words remaining",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text('Show Fine Prints',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Where will customers redeem their vouchers?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Select where and how customers will redeem thier vouchers at: your business location when you travel to their location , or on your website.',
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading:
                    Radio(groupValue: "t", value: "rapl", onChanged: (ab) {}),
                title: Text(
                  "Redeem At Physical Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Text(
                'MoMa\n11 West 53rd Street \nNewyork NY 10019\n(445 500-5151)',
              ),
              SizedBox(
                height: 15,
              ),
              Text("+ Add another location",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                  )),
              Divider(),
              ListTile(
                leading:
                    Radio(groupValue: "t", value: "tmc", onChanged: (ab) {}),
                title: Text(
                  "I will travel to my client",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Divider(),
              ListTile(
                leading:
                    Radio(groupValue: "t", value: "ro", onChanged: (ab) {}),
                title: Text(
                  "Redeem Online",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Is an appointment required?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: FractionalOffset.center,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            value: "mt",
                            onChanged: (value) {},
                            groupValue: "rt",
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(
                            'No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                            value: "t",
                            onChanged: (value) {},
                            groupValue: "rt",
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "How should customer contact you for an appointment?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Method",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Phone',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              minLines: 1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Example :  20955523233230',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "This is the number customer will call to make your appointment . It will printed on your voucher",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "When do you want to start offering your Campaign on UBOMI?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tips : UBOMI requires a few days to review and apporve your Campaign',
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SfDateRangePicker(
                    selectionColor: Theme.of(context).colorScheme.primary,
                    view: DateRangePickerView.decade,
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Full Name",
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
                  hintText: 'Example : James Smith',
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget richTextEditor() {
    var _controller = quil.QuillController.basic();
    var quillEditor = quil.QuillEditor.basic(
      controller: _controller,
      readOnly: false,
    );

    var toolbar = quil.QuillToolbar.basic(
      controller: _controller,
      showAlignmentButtons: true,
      afterButtonPressed: _focusNode.requestFocus,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: toolbar,
        ),
        Container(height: 300, padding: EdgeInsets.all(20), child: quillEditor)
      ],
    );
  }

  Container panelFour(BuildContext context) {
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
          margin: EdgeInsets.only(left: 5),
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add photos to your Campaign page",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Give Customers an idea of what they can expect with photos with your business",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 250,
                child: Center(
                    child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud,
                      color: Theme.of(context).colorScheme.primary,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Drag And Drop",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "Browse More",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 18),
                    )
                  ],
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Requirements",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5 photos maximum",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Photos must be in landscape orientation",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Files must not be greater then 5mb",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Accepted Files Types: .jpg , .png  or .jpeg",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Minimum Resolution : 720 x 400 px",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "We,ll review the photos you upload after you submit your Campaign. Photos that not meet UBOMI's requirements may be replaced with a photo from our stock library.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ));
  }

  Container panelThree(BuildContext context) {
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
          margin: EdgeInsets.only(left: 5),
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How would you like to providing proof of pricing ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading:
                    Radio(groupValue: "ab", value: "ab", onChanged: (ab) {}),
                title: Text(
                  "Business Website (Public)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              ListTile(
                leading:
                    Radio(groupValue: "ab", value: "ab", onChanged: (ab) {}),
                title: Text(
                  "Upload Photos Of Receipts/Invoices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              ListTile(
                leading:
                    Radio(groupValue: "ab", value: "ab", onChanged: (ab) {}),
                title: Text(
                  "Uload Phots Of My Menu or Service List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Use My Business Website",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Provide a link of specific web page on your busness website that shows current pricing information for these options",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Business Website',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width:
                    MediaQuery.of(context).size.width - (isMobile() ? 50 : 500),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Example : http://www.mybusinesswebsite.com/pricing",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container panelSecond(BuildContext context) {
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
        margin: EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Choose the price and vouchers you want to offer for each option",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  opcount,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Option ${index + 1}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Option Name",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  'Rodizio Dinner for Two with Bottle of House wine or two desserts,Valid Sunday~Thursday',
                            ),
                          ),
                          Text(
                            "33 Remaining",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Regular Price (\$)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        minLines: 1,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: '106.9',
                                        ),
                                      ),
                                      Text(
                                        "Regular Price should be between \$1 to \$99",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Monthly Voucher Cap",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextField(
                                          minLines: 1,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '105',
                                          ),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Maximum Discount Uses",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Limit number of times offer can be used',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: SizedBox(
                              width: 150,
                              child: TextField(
                                minLines: 1,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Limit to one use per customer',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Choose Your Discount",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("49%",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Recommeded discount",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: sliderArr[index] * 1.0,
                                    onChanged: (value) {
                                      setState(() {
                                        sliderArr[index] = value;
                                      });
                                    },
                                  ),
                                  width: 450,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Stay within the for optimal performance",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(30.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Customer Pays",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Text(
                                                "\$55.00",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "You Get",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Text(
                                                "\$33.00*",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "UBOMI Gets",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Text(
                                                "\$22.00",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width -
                                      (isMobile() ? 50 : 500),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[200]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("*Promotional Programs",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        child: Text(
                                            "You can raise Campaign awareness and increases sales by up to 30% through promotional programs.During these promotions, Groupons put your Campaigns up for an additional discount for an limited time to give you more exposure and sales Extra cost up to 20% apply.\n\n*Based on UBOMI internal data as of March 2022. UBOMI gurantee any sales performance and result will vary.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ))),
        ]),
      ),
    );
  }

  Container boxTwo() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(
            "assets/images/steakTwo.png",
            width: 300,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: 300,
          child: Text(
              "\$50 Toward Food And Drinks; Valid Monday, Thursday for dine in Only 1 Per Table \n\n\$100 Toward Food And Drinks for four and more, a minimum of 4 full priced dinner; Valid Monday, Thursday for dine in Only 1 Per Table "),
        )
      ]),
    );
  }

  Container boxOne() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(
            "assets/images/steakOne.png",
            width: 300,
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: 300,
          child: Text(
              "\$60 Worth of Rodizio dinner for Two Adults, Valid Sunday Friday\n\n\$120 Worth of Rodizio dinner for Four Adults, Valid Sunday Friday"),
        )
      ]),
    );
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        margin: EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Add Campaign Name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            minLines: 1,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Campaign Name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Select Business Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Row(),
          Container(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                selectButton(
                    Icon(
                      Icons.ac_unit,
                      color: Colors.pink,
                    ),
                    "Health / Beauty / Wellness"),
                selectButton(
                    Icon(
                      Icons.access_time,
                      color: Colors.blue,
                    ),
                    "Activities & Leasure"),
                selectButton(
                    Icon(
                      Icons.report_gmailerrorred,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    "Retail And Store"),
                selectButton(
                    Icon(
                      Icons.food_bank_outlined,
                      color: Colors.blueGrey,
                    ),
                    "Food And Drinks"),
                selectButton(
                    Icon(
                      Icons.event,
                      color: Colors.amber,
                    ),
                    "Ticket And Event"),
                selectButton(
                    Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                    "Home And Auto Services"),
                selectButton(SizedBox(), "Other Services"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Enter ther Service(s) that you offer (You can choose upto 3 services)")
        ]),
      ),
    );
  }

  Widget selectButton(Widget w, String text) {
    return SizedBox(
        width: ((MediaQuery.of(context).size.width - (isMobile() ? 50 : 400)) /
                3) -
            40,
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
          child: MaterialButton(
            onPressed: null,
            padding: EdgeInsets.all(20),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                w,
                SizedBox(
                  width: 10,
                ),
                Text(text)
              ],
            ),
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5)),
          ),
        ));
  }

  Container addProduct(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 175, 232, 166),
            Color.fromARGB(255, 2, 174, 199),
          ],
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 5),
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Edit Product",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  child: Text(
                    'Online',
                    style: TextStyle(fontSize: 10),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(50, 10),
                    padding: EdgeInsets.all(3),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {},
                ),
                Flexible(
                  child: Container(),
                ),
                OutlinedButton(
                  child: Text(
                    'View Products',
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isMobile()
                      ? MediaQuery.of(context).size.width - 70
                      : MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Title',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            "Permalink : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            "https://momo.xcodelist.com/",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                            child: Text(
                              'Edit',
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0))),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Product Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Product Type',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: FractionalOffset.center,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                child: ListTile(
                                  title: Text(
                                    'Downloadable',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Checkbox(
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                ),
                              ),
                              Flexible(
                                child: ListTile(
                                  title: Text(
                                    'Virtual',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Checkbox(
                                    value: true,
                                    onChanged: (bool? value) {},
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: FractionalOffset.center,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      Text(
                                        'Price ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '( You Earn \$ 0)',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.price_change),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Discounted Price ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.price_change),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tags",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search Product Tags',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Offer Types",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Offer Types',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "About Your Deals",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        minLines: 8,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter About Deals',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "About Your Business",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        minLines: 8,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter About Your Business',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Loaction",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Loaction',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Terms And Condition",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          'You accept terms and conditions for Moma platform',
                        ),
                        leading: Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Sponsor Your Campaign",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          'Sponsor your Campaign in my MoMa.',
                        ),
                        leading: Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 250,
                    child: Center(
                        child: Wrap(
                      children: [
                        Icon(Icons.cloud, color: Colors.grey[900]),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "UPLOAD CPRODUCT COVER IMAGE",
                          style: TextStyle(color: Colors.grey[900]),
                        )
                      ],
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Short Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: HtmlEditor(
                htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.aboveEditor, //by default
                    toolbarType: ToolbarType.nativeScrollable, //b
                    buttonBorderColor: Colors.black),
                controller: HtmlEditorController(), //required
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "Your text here...",
                  //initalText: "text content initial, if any",
                ),
                otherOptions: OtherOptions(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black, width: 1)),
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: HtmlEditor(
                htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.aboveEditor, //by default
                    toolbarType: ToolbarType.nativeScrollable, //b
                    buttonBorderColor: Colors.black),
                controller: HtmlEditorController(), //required
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "Your text here...",
                  //initalText: "text content initial, if any",
                ),
                otherOptions: OtherOptions(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black, width: 1)),
                  height: 200,
                ),
              ),
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.inventory, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Inventory',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Manage inventor for the product',
                        style: TextStyle(color: Colors.grey[900]),
                      )
                    ],
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
                                    children: [
                                      Text(
                                        'SKU ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '(Stock Keeping Unit)',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.price_change),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Stock Stack',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.price_change),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Enable product stock management',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Allow only one quntity of this product to be bougth in a simple order.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              paddingListBottom: 0,
              paddingListTop: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.local_shipping, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  content: Container(
                      alignment: FractionalOffset.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              'The product requires shipping',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                  child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Weight (kg)",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2),
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: "Length (cm)",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2),
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Width (cm)",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2),
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: "Height (cm)",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Shipping Class",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Shipping Class',
                            ),
                          )
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.countertops, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Discount Options',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Set your discounts',
                        style: TextStyle(color: Colors.grey[900]),
                      )
                    ],
                  ),
                  content: Container(
                      alignment: FractionalOffset.center,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Enable Bulk Discount.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.roundabout_left, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'RMA',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Set your return and warranty settings for override global settings',
                        style: TextStyle(color: Colors.grey[900]),
                      )
                    ],
                  ),
                  content: Container(
                      alignment: FractionalOffset.center,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Override your default RMA setiings for this product.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.shopping_cart, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Whole Sale',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'If you want to sell this product as wholesale then set your setting right away ',
                        style: TextStyle(color: Colors.grey[900]),
                      )
                    ],
                  ),
                  content: Container(
                      alignment: FractionalOffset.center,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Enable Wholesale for this product.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Accordion(
              contentBorderRadius: 0,
              headerBorderRadius: 0,
              paddingListHorizontal: 0,
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              openAndCloseAnimation: true,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,

                  leftIcon: Icon(Icons.settings, color: Colors.black),
                  headerBackgroundColor: Colors.grey[200],
                  headerBackgroundColorOpened: Colors.grey[200],

                  header: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Other Options',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Set your product other setting',
                        style: TextStyle(color: Colors.grey[900]),
                      )
                    ],
                  ),
                  content: Container(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    children: [
                                      Text(
                                        'Product Status ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Visibility',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 2),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Purchase Note',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            autocorrect: true,
                            maxLines: 4,
                            minLines: 3,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              ),
                            ),
                          )
                        ],
                      )),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.teal[300],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MAKE YOUR AD POP WITH COLOURFULL BACKGROUND IT'LL HELP YOU STAND OUT FROM CROWD AND ATTRACT MORE VISITS ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "HIGHLIGHT",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.file_copy,
                              color: Colors.white,
                              size: 60,
                            )
                          ])),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          child: Text('Add To Cart',
                              style: TextStyle(fontSize: 20)),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                          ),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KEEP YOUR AD AT TOP OF IT CATEGORY. IT'LL APPEARS IN A NOTATION ABOVE THE SEARCH RESULTS FOR SEVERAL DAYS, HELPING YOUR AD GET NOTICED BY MORE PEOPLE",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "TOP ADD",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 60,
                            )
                          ])),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          child: Text('Add To Cart',
                              style: TextStyle(fontSize: 20)),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                          ),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NOTIFY PEAPLE IN YOUR AREA OF YOUR OFFERS WITH OUR APP NOTIFICATIONS AND EMAILS",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "NOTIFICATION",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 60,
                            )
                          ])),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          child: Text('Add To Cart',
                              style: TextStyle(fontSize: 20)),
                          style: OutlinedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                          ),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OutlinedButton(
                  child: Text(
                    'Save Product',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
