import 'package:flutter/gestures.dart';
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
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableText(
          widget.text,
          trimLines: 1,
        ),
      ],
    );
    // return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Flexible(
    //       child: RichText(
    //         // overflow: TextOverflow.clip,
    //         text: TextSpan(
    //           text: '${widget.text} ',
    //           style: const TextStyle(
    //             color: Colors.black,
    //           ),
    //           children: [
    //             TextSpan(
    //               text: 'more',
    //               style: const TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               recognizer: TapGestureRecognizer()
    //                 ..onTap = () => setState(() {
    //                       isExpanded = true;
    //                       print(isExpanded);
    //                     }),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     // Flexible(
    //     //   child: RichText(
    //     //     overflow: TextOverflow.ellipsis,
    //     //     softWrap: false,
    //     //     text: TextSpan(
    //     //       text: widget.text,
    //     //       recognizer: ,
    //     //       style: const TextStyle(
    //     //         color: Colors.black,
    //     //       ),
    //     //     ),
    //     //   ),

    //     // Text(
    //     //    widget.text,
    //     //   maxLines: 1,
    //     //   overflow: !isExpanded ? TextOverflow.ellipsis : TextOverflow.visible,
    //     // ),

    //     // if (!isExpanded)
    //     //   TextButton(
    //     //     clipBehavior: Clip.none,
    //     //     style: ButtonStyle(
    //     //       padding: MaterialStateProperty.all(
    //     //         EdgeInsets.zero,
    //     //       ),
    //     //       alignment: Alignment.topLeft,
    //     //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     //     ),
    //     //     onPressed: () {
    //     //       setState(() {
    //     //         isExpanded = true;
    //     //       });
    //     //     },
    //     //     child: const Text(
    //     //       'ещё',
    //     //       style: TextStyle(
    //     //         color: Colors.grey,
    //     //       ),
    //     //     ),
    //     //   )
    //   ],
    // );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final colorClickableText = Colors.grey;
    final widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? " more" : "",
        style: TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(
          text: widget.text,
        );
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: TextStyle(
              color: widgetColor,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
