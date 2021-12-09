import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/buy_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/repositories/buy_repository_interface.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class IBuyUsecase {
  Future<Either<PaymentException, BuyEntity>> call(BuyPayload payload);
}

class BuyUsecase implements IBuyUsecase {
  final IBuyRepository repository;

  BuyUsecase(this.repository);

  @override
  Future<Either<PaymentException, BuyEntity>> call(BuyPayload payload) async {
    return await repository.buy(payload);
  }
}
