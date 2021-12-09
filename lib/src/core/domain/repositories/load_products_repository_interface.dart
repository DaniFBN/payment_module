import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/entities/load_products_entity.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class ILoadProductsRepository {
  Future<Either<PaymentException, LoadProductsEntity>> loadProducts(
    LoadProductsPayload payload,
  );
}
