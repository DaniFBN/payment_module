import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/restore_purchases_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/repositories/restore_purchases_repository_interface.dart';

abstract class IRestorePurchasesUsecase {
  Future<Either<PaymentException, RestorePurchasesEntity>> call();
}

class RestorePurchasesUsecase implements IRestorePurchasesUsecase {
  final IRestorePurchasesRepository repository;

  RestorePurchasesUsecase(this.repository);

  @override
  Future<Either<PaymentException, RestorePurchasesEntity>> call() async {
    return await repository.restore();
  }
}
