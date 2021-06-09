import 'package:dartz/dartz.dart';

import '../entities/search-result.dart';
import '../errors/errors.dart';
import '../repositories/search-repository.dart';

abstract class SearchByText {
  Future<Either<SearchFailure, List<SearchResult>>?> call(String? searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<SearchFailure, List<SearchResult>>?> call(String? searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }

    return await repository.search(searchText);
  }
}
