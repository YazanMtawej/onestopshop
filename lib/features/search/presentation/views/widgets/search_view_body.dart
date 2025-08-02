import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:onestopshop/features/search/presentation/views/widgets/search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: kIconColor.shade100,
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: const Text(
            'Find your favorite perfume',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    context.read<SearchCubit>().search(keyword: value);
                  },
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search for perfumes...',
                    hintStyle: const TextStyle(color: kIconColor),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100.withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Colors.blueAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 4,
                      ),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        size: 20,
                        Icons.delete_sharp,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        controller.clear();
                        context.read<SearchCubit>().clear();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Result:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: const SearchListView()),
            ],
          ),
        ),
      ),
    );
  }
}
