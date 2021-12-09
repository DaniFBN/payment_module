import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/entities/buy_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/repositories/buy_repository_interface.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/infra/datasources/buy_datasource_interface.dart';

class BuyRepositoryImpl implements IBuyRepository {
  final IBuyDatasource datasource;

  BuyRepositoryImpl(this.datasource);

  @override
  Future<Either<PaymentException, BuyEntity>> buy(BuyPayload payload) async {
    try {
      final response = await datasource.buy(payload);
      return Right(response);
    } on PaymentException {
      return Left(PaymentException('Error in datasource'));
    }
  }
}
