import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:moma_web/src/pages/dashboard_fragments/Compaign_list.dart';
import 'package:moma_web/src/pages/dashboard_fragments/sponsored_Compaign.dart';
import 'package:moma_web/src/pages/dashboard_fragments/upload_campaign.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CampaignFrag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CampaignFragState();
}

class CampaignFragState extends State<CampaignFrag> {
  bool isMobile() {
    return MediaQuery.of(context).size.width < 550;
  }

  bool isAdding = false;

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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
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
                                primary: Theme.of(context).colorScheme.primary,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
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
              !isAdding ? CampaignListFrag() : UploadCampaignFrag()
            ],
          ),
        ));
  }
}
