part of 'featured_perfume_cubit.dart';

sealed class FeaturedPerfumeState extends Equatable {
  const FeaturedPerfumeState();

  @override
  List<Object> get props => [];
}

final class FeaturedPerfumeInitial extends FeaturedPerfumeState {}
final class FeaturedPerfumeLoading extends FeaturedPerfumeState {}
final class FeaturedPerfumeSuccess extends FeaturedPerfumeState {
  final List<PerfumeModel> perfume;

 const FeaturedPerfumeSuccess(this.perfume);
}
final class FeaturedPerfumeFailure extends FeaturedPerfumeState {
  final String errMessage;
  const FeaturedPerfumeFailure(this.errMessage);
}