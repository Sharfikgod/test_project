import 'package:flutter/material.dart';

class TextMore extends StatefulWidget {
  final String text;
  final String userName;

  const TextMore({
    Key? key,
    required this.text,
    required this.userName,
  }) : super(key: key);

  @override
  _TextMoreState createState() => _TextMoreState();
}

class _TextMoreState extends State<TextMore> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

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
          : !flag
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      flag ? (firstHalf + "... ") : (firstHalf + secondHalf),
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
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
                      flag ? (' $firstHalf ... ') : (firstHalf + secondHalf),
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            flag ? "ещё" : "",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                    ),
                  ],
                ),
    );
  }
}
