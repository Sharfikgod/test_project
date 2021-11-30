import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  final List listData;
  final listTileFun;
  const ListViewBuilder({
    Key? key,
    required this.listData,
    required this.listTileFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: listTileFun,
    );
  }
}
