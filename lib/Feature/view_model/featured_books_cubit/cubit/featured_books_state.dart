part of 'featured_books_cubit.dart';

class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksError extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksError(this.errorMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> featuredBooks;

  const FeaturedBooksSuccess(this.featuredBooks);
}
