import 'package:bookshop/Feature/data/book_model/book_model/book_model.dart';
import 'package:bookshop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fethcBestSeller();
  Future<Either<Failures, List<BookModel>>> fethcFeatureBooks();
}
