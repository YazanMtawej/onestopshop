import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/Home/presentation/views/widgets/perfum_list_view_item.dart';
import 'package:onestopshop/features/search/presentation/view_models/cubit/search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, List>(
      builder: (context, perfumes) {
        if (perfumes.isEmpty) {
          return const Center(child: Text("No results found"));
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemCount: perfumes.length,
          itemBuilder: (context, index) {
            return _AnimatedSearchItem(
              delay: Duration(milliseconds: 100 * index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.black,
                  shadowColor: kCardColor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kButtonColor,
                          kCardColor.shade100,
                          kCardColor.shade200,
                          kCardColor.shade700,
                          kCardColor.shade100,
                          kCardColor.shade200,
                          kCardColor.shade700,
                          kIconColor,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: PerfumeListViewItem(perfume: perfumes[index]),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _AnimatedSearchItem extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _AnimatedSearchItem({required this.child, required this.delay});

  @override
  State<_AnimatedSearchItem> createState() => _AnimatedSearchItemState();
}

class _AnimatedSearchItemState extends State<_AnimatedSearchItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fade = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
