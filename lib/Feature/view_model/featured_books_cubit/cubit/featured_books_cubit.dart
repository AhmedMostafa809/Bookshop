import 'package:bloc/bloc.dart';
import 'package:bookshop/Feature/data/book_model/book_model/book_model.dart';
import 'package:bookshop/Feature/data/models/book_model/book_model.dart';
import 'package:bookshop/Feature/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future fetchFeatureBooksCubit() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fethcFeatureBooks();
    result.fold((failure) => emit(FeaturedBooksError(failure.errorMessage)),
        (success) => emit(FeaturedBooksSuccess(success)));
  }
}
