import 'package:payment_module/src/core/domain/entities/available_entity.dart';

abstract class IAvailableDatasource {
  Future<AvailableEntity> isAvailable();
}
