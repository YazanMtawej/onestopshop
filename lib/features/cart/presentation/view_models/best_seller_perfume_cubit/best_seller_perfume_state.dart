part of 'best_seller_perfume_cubit.dart';

sealed class BestSellerPerfumeState extends Equatable {
  const BestSellerPerfumeState();

  @override
  List<Object> get props => [];
}

final class BestSellerPerfumeInitial extends BestSellerPerfumeState {}
final class BestSellerPerfumeLoading extends BestSellerPerfumeState {}
final class BestSellerPerfumeSuccess extends BestSellerPerfumeState {
  final List<PerfumeModel> perfume;

 const BestSellerPerfumeSuccess({required this.perfume});
}
final class BestSellerPerfumeFailure extends BestSellerPerfumeState {
  final String errMessage;

const  BestSellerPerfumeFailure({required this.errMessage}); 
}
