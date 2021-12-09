import 'package:payment_module/src/core/domain/entities/load_products_entity.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/infra/datasources/load_products_datasource_interface.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';

class LoadProductsDatasourceImpl implements ILoadProductsDatasource {
  final IPaymentService _service;

  LoadProductsDatasourceImpl(this._service);

  @override
  Future<LoadProductsEntity> loadProducts(LoadProductsPayload payload) async {
    final response = await _service.getProducts(payload.products);

    return LoadProductsEntity(
      products: response.products,
      notFoundIDs: response.notFoundIDs,
    );
  }
}
