import 'package:flutter/material.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/app_textstyle.dart';

class PedalaText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? alignment;

  const PedalaText.headingOne(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align,
        super(key: key);
  const PedalaText.headingTwo(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading2Style,
        alignment = align,
        super(key: key);
  const PedalaText.headingThree(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align,
        super(key: key);
  const PedalaText.headline(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align,
        super(key: key);
  const PedalaText.subheading(this.text,
      {Key? key, TextAlign align = TextAlign.start, this.style, this.alignment})
      : super(key: key);

  const PedalaText.caption(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align,
        super(key: key);
  PedalaText.body(this.text,
      {Key? key,
      Color color = AppColors.pedalaBody,
      TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
    );
  }
}
