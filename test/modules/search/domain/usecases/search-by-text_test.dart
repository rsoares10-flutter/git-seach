import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_search/modules/search/domain/entities/search-result.dart';
import 'package:git_search/modules/search/domain/errors/errors.dart';
import 'package:git_search/modules/search/domain/repositories/search-repository.dart';
import 'package:git_search/modules/search/domain/usecases/search-by-text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('Shoud return a SearchResult list', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<SearchResult>[]));

    final result = await usecase('dummy data');
    expect(result, isA<Right>());
  });

  test('Shoud return FailureException', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<SearchResult>[]));

    final result = await usecase('');
    expect(result?.isLeft(), true);
    expect(result?.fold(id, id), isA<InvalidTextError>());
  });
}
