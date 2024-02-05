import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class JrTitleRow extends StatelessWidget {
  final String title;
  final Widget child;
  final bool expandedTitle;
  final TextStyle? style;
  final TextAlign titleAlign;

  const JrTitleRow({
    super.key,
    required this.title,
    required this.child,
    this.expandedTitle = false,
    this.style,
    this.titleAlign =  TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = JrText(
      title,
      style: style,
      textAlign: titleAlign,
      overflow: TextOverflow.ellipsis,
    );

    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          expandedTitle ? Expanded(child: titleWidget) : titleWidget,
          const SizedBox(width: Dimens.l),
          expandedTitle
              ? child
              : Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: child,
                  ),
                ),
        ],
      ),
    );
  }
}
