import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({
    Key? key,
    this.isExpanded = false,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.physics,
    this.children = const <Widget>[],
    this.withParentColumn = false,
    this.controller,
  }) : super(key: key);

  const ScrollableColumn.expanded({
    Key? key,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.physics,
    this.children = const <Widget>[],
    this.withParentColumn = false,
    this.controller,
  })  : isExpanded = true,
        super(key: key);

  final bool isExpanded;
  final bool withParentColumn;
  final EdgeInsets? padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final ScrollPhysics? physics;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final SingleChildScrollView body = SingleChildScrollView(
      physics: physics,
      controller: controller,
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      ),
    );
    if (isExpanded) {
      if (withParentColumn) {
        return Column(children: <Widget>[Expanded(child: body)]);
      } else {
        return Expanded(child: body);
      }
    }
    return body;
  }
}
