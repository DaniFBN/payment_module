import 'package:payment_module/src/core/domain/entities/restore_purchases_entity.dart';

abstract class IRestorePurchasesDatasource {
  Future<RestorePurchasesEntity> restore();
}
