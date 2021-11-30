import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String text;
  final String userName;

  const Description({
    Key? key,
    required this.text,
    required this.userName,
  }) : super(key: key);

  @override
  DescriptionState createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  String firstHalf = '';
  String secondHalf = '';

  bool isExpanded = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 10) {
      firstHalf = widget.text.substring(0, 10);
      secondHalf = widget.text.substring(10, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : !isExpanded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      isExpanded ? (firstHalf + "... ") : (firstHalf + secondHalf),
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isExpanded ? (' $firstHalf ... ') : (firstHalf + secondHalf),
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            isExpanded ? "ещё" : "",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                  ],
                ),
    );
  }
}
