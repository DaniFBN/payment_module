import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/buy_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class IBuyRepository {
  Future<Either<PaymentException, BuyEntity>> buy(BuyPayload payload);
}
