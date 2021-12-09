import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/entities/available_entity.dart';
import 'package:payment_module/src/core/domain/repositories/available_repository_interface.dart';
import 'package:payment_module/src/core/infra/datasources/available_datasource_interface.dart';

class AvailableRepositoryImpl implements IAvailableRepository {
  final IAvailableDatasource datasource;

  AvailableRepositoryImpl(this.datasource);

  @override
  Future<Either<PaymentException, AvailableEntity>> isAvailable() async {
    try {
      final response = await datasource.isAvailable();
      return Right(response);
    } on PaymentException {
      return Left(PaymentException('Shop is unavailable'));
    }
  }
}
