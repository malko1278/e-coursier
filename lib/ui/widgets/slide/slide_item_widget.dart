
import 'package:flutter/material.dart';

import 'package:social_navig/models/slide/slide_model.dart';

class SlideItemWidget extends StatelessWidget {
  final int index;
  final List<SlideModel> listSlides;
  const SlideItemWidget({required this.index, required this.listSlides, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listSlides.elementAt(index).widgets;
  }
}