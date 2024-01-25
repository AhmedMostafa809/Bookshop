import 'package:bookshop/Feature/data/book_model/book_model/book_model.dart';
import 'package:bookshop/Feature/repos/home_repo.dart';
import 'package:bookshop/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:bookshop/core/errors/failure.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failures, List<BookModel>>> fethcBestSeller() async {
    try {
      var data = await apiServices.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioErrors(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fethcFeatureBooks() async {
    try {
      var data = await apiServices.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:science");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioErrors(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
