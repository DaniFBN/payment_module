import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/available_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';

abstract class IAvailableRepository {
  Future<Either<PaymentException, AvailableEntity>> isAvailable();
}
