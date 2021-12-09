import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/restore_purchases_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';

abstract class IRestorePurchasesRepository {
  Future<Either<PaymentException, RestorePurchasesEntity>> restore();
}
