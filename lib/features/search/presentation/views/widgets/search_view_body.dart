import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar( backgroundColor: kButtonColor,
          elevation: 0,
          title: const Text('Find your favorite perfume', style: TextStyle(fontSize:18,color: Colors.black)),
          ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(hinttext: 'Search',inputType: TextInputType.name,),
          ),
        ],
      ),
    ),);
  }
}