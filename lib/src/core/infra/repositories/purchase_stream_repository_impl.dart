import 'package:payment_module/src/core/domain/entities/purchase_stream_entity.dart';
import 'package:payment_module/src/core/domain/repositories/purchase_stream_repository_interface.dart';
import 'package:payment_module/src/core/domain/usecases/purchase_stream_usecase.dart';
import 'package:payment_module/src/core/infra/datasources/purchase_stream_datasource_interface.dart';

class PurchaseStreamRepositoryImpl implements IPurchaseStreamRepository {
  final IPurchaseStreamDatasource datasource;

  PurchaseStreamRepositoryImpl(this.datasource);

  @override
  PurchaseStreamEntity getPurchaseStream() {
    return datasource.getPurchaseStream();
  }
}
