import 'package:payment_module/src/services/types.dart';

class PurchaseStreamEntity {
  final Stream<Set<CustomPurchaseDetails>> purchases;

  PurchaseStreamEntity({required this.purchases});
}
