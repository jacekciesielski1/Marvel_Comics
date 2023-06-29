import 'package:dartz/dartz.dart';
import 'package:marvel_comics/core/error/failures.dart';
import 'package:marvel_comics/features/comics_app/domain/entities/comics.dart';

abstract class ComicsRepository {
  Future<Either<Failure?, Comics?>>? getComics(String title);
}
