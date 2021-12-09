import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/load_products_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/repositories/load_products_repository_interface.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class ILoadProductsUsecase {
  Future<Either<PaymentException, LoadProductsEntity>> call(
      LoadProductsPayload payload);
}

class LoadProductsUsecase implements ILoadProductsUsecase {
  final ILoadProductsRepository repository;

  LoadProductsUsecase(this.repository);

  @override
  Future<Either<PaymentException, LoadProductsEntity>> call(payload) async {
    return await repository.loadProducts(payload);
  }
}
