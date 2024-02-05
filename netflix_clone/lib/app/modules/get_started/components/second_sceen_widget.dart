import 'package:flutter/material.dart';
import 'package:netflix_clone/app/modules/get_started/components/appbar_section_widget.dart';
import 'package:netflix_clone/app/modules/get_started/components/bottom_section_widget.dart';

class SecondScreenWidget extends StatelessWidget {
  const SecondScreenWidget({
    Key? key,
    required this.imageAssets,
    required this.title,
  }) : super(key: key);

  final String imageAssets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBarSectionWidget(),
          SizedBox(height: 20,),
          Image.asset(imageAssets),
          BottomSectionWidget(title: title)
        ],
      ),
    );
  }
}