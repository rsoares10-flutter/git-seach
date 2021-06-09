import 'package:dartz/dartz.dart';
import 'package:git_search/modules/search/domain/entities/search-result.dart';
import 'package:git_search/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<SearchFailure, List<SearchResult>>?>? search(String? searchText);
}
