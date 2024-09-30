part of 'fetchcontents_bloc.dart';

@immutable
sealed class FetchcontentsState {}

final class FetchcontentsInitial extends FetchcontentsState {}
final class FetchcontentsLoadingState extends FetchcontentsState {}
final class FetchcontentsSuccesState extends FetchcontentsState {
      final List<ProductResponse> products;

  FetchcontentsSuccesState({required this.products});
}
final class FetchcontentsErrorState extends FetchcontentsState {}