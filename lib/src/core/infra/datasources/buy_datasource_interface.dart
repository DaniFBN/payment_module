import 'package:payment_module/src/core/domain/entities/buy_entity.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class IBuyDatasource {
  Future<BuyEntity> buy(BuyPayload payload);
}
