import 'package:payment_module/src/core/domain/entities/purchase_stream_entity.dart';

abstract class IPurchaseStreamRepository {
  PurchaseStreamEntity getPurchaseStream();
}
