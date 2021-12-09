import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/entities/load_products_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:payment_module/src/core/domain/repositories/load_products_repository_interface.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/infra/datasources/load_products_datasource_interface.dart';

class LoadProductsRepositoryImpl implements ILoadProductsRepository {
  final ILoadProductsDatasource datasource;

  LoadProductsRepositoryImpl(this.datasource);

  @override
  Future<Either<PaymentException, LoadProductsEntity>> loadProducts(
    LoadProductsPayload payload,
  ) async {
    try {
      final response = await datasource.loadProducts(payload);
      return Right(response);
    } on NotFoundException {
      return Left(NotFoundException('Item not found'));
    } on PaymentException {
      return Left(PaymentException('Error in datasource'));
    }
  }
}
