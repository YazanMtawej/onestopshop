import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onestopshop/features/Home/data/models/perfume_model.dart';

part 'featured_perfume_state.dart';

class FeaturedPerfumeCubit extends Cubit<FeaturedPerfumeState> {
  FeaturedPerfumeCubit() : super(FeaturedPerfumeInitial());
}
