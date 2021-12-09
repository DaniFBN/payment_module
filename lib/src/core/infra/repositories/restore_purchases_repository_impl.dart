import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/entities/restore_purchases_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/repositories/restore_purchases_repository_interface.dart';
import 'package:payment_module/src/core/infra/datasources/restore_purchases_datasource_interface.dart';

class RestorePurchasesRepositoryImpl implements IRestorePurchasesRepository {
  final IRestorePurchasesDatasource datasource;

  RestorePurchasesRepositoryImpl(this.datasource);

  @override
  Future<Either<PaymentException, RestorePurchasesEntity>> restore() async {
    try {
      final response = await datasource.restore();
      return Right(response);
    } on PaymentException {
      return Left(PaymentException('Error in datasource'));
    }
  }
}
