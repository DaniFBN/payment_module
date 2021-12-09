import 'package:payment_module/src/core/domain/entities/purchase_stream_entity.dart';
import 'package:payment_module/src/core/domain/repositories/purchase_stream_repository_interface.dart';

abstract class IPurchaseStreamUsecase {
  PurchaseStreamEntity call();
}

class PurchaseStreamUsecase implements IPurchaseStreamUsecase {
  final IPurchaseStreamRepository repository;

  PurchaseStreamUsecase(this.repository);

  @override
  PurchaseStreamEntity call() {
    return repository.getPurchaseStream();
  }
}
