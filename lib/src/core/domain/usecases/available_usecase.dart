import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/available_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/repositories/available_repository_interface.dart';

abstract class IAvailableUsecase {
  Future<Either<PaymentException, AvailableEntity>> call();
}

class AvailableUsecase implements IAvailableUsecase {
  final IAvailableRepository repository;

  AvailableUsecase(this.repository);

  @override
  Future<Either<PaymentException, AvailableEntity>> call() async {
    return await repository.isAvailable();
  }
}
