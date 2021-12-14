# Módulo de pagamento

## Modulo de pagamento para flutter/android, encapsulando o package [in_app_purchase](https://pub.dev/packages/in_app_purchase).

Tópicos
=================
* [Instalação](#instalação)
* [Exemplo](#exemplo)
* [Tecnologias](#tecnologias)


## Instalação

Na raiz do projeto cria a pasta modules e clone o repositório.
```bash
git clone https://github.com/DaniFBN/payment_module
```

Importe o projeto no pubspec.yaml.
```yaml
dependencies:
  payment_module:
      path: modules/payment_module
```

Importe o módulo no seu AppModule
```dart
import 'package:payment_module/payment_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        PaymentModule(),
      ];
}
```

## Exemplo
#### Há um arquivo em lib/src/examples com a implementação do módulo.
#### Obs.: Para funcionar é necessário que o applicationID seja a mesma do app na GooglePlay
#### Por hora o ID do produto é injetado de forma fixa, então necessita que chame 'premium'

## Tecnologias

- [Modular](https://pub.dev/packages/flutter_modular)
- [Triple](https://pub.dev/packages/triple)
- [InAppPurchase](https://pub.dev/packages/in_app_purchase)
- [Dartz](https://pub.dev/packages/dartz)
