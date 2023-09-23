import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class FeedbackFrag extends StatefulWidget {
  final bool isLoading;

  const FeedbackFrag({Key? key, this.isLoading = false}) : super(key: key);
  @override
  State<StatefulWidget> createState() => FeedbackFragState();
}

class FeedbackFragState extends State<FeedbackFrag> {
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
                  "Feedback",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                ),
                Stack(
                  children: [
                    items(),
                    widget.isLoading
                        ? Center(
                            child: Container(
                            width: isMobile()
                                ? MediaQuery.of(context).size.width - 100
                                : 500,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "You don't have any custome feedback",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "After groupon customer visited your business , they will have a chance to rate their exprience and provide feedback and visit your page to view your rating and rspond to feedback .",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Learn more about Feedback",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ))
                        : Container()
                  ],
                )
              ],
            ),
          )),
    );
  }

  Opacity items() {
    return Opacity(
        opacity: widget.isLoading ? 0.5 : 1,
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            perItem(),
            SizedBox(
              height: 10,
            ),
            perItem(),
            SizedBox(
              height: 10,
            ),
            perItem(),
            SizedBox(
              height: 10,
            ),
            perItem(),
          ]),
        ));
  }

  Container perItem() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: isMobile()
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  firstPanell(),
                  SizedBox(
                    height: 10,
                  ),
                  secondPanel()
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [firstPanell(), Expanded(child: secondPanel())],
              ));
  }

  Widget secondPanel() {
    return widget.isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            enabled: true,
            child: Column(
              children: [
                Container(
                  color: Colors.grey,
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  color: Colors.grey,
                  height: 40,
                ),
              ],
            ))
        : Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          );
  }

  SizedBox firstPanell() {
    return SizedBox(
      width: isMobile() ? MediaQuery.of(context).size.width : 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          widget.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  enabled: true,
                  child: Container(
                    color: Colors.grey,
                    width: 350,
                    height: 40,
                  ))
              : Text(
                  "Abcdef Ghi Jkl MnoP Qresj",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
          SizedBox(
            height: 10,
          ),
          widget.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  enabled: true,
                  child: Container(
                    color: Colors.grey,
                    width: 250,
                    height: 40,
                  ))
              : Text(
                  "Abcdef Ghi Jkl",
                  style: TextStyle(fontSize: 22),
                )
        ],
      ),
    );
  }
}
