import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/widgets/custom_text_field.dart';
import 'package:onestopshop/features/search/presentation/views/widgets/search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar( backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text('Find your favorite perfume', style: TextStyle(fontSize:18,color: Colors.black)),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(hinttext: 'Search',inputType: TextInputType.name,),
            ),
            const SizedBox(height: 10,),
          const  Text('Result :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
         const   SizedBox(
              height: 600,
              child: SearchListView()),
           
          ],
        ),
      ),
    ),);
  }
}