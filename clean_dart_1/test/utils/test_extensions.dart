import 'package:dartz/dartz.dart';

extension EitherTestExtensions<L, R> on Either<L, R> {
  get content => fold(id, id);
}

