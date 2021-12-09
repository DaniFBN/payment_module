import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/presenter/payment_model.dart';
import 'package:payment_module/src/core/presenter/payment_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, PaymentStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            StoreAvailability(),
            ProductsList(),
            PurchaseList(),
          ],
        ),
      ),
    );
  }
}

class PurchaseList extends StatelessWidget {
  const PurchaseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: Modular.get<PaymentStore>(),
      onState: (_, PaymentModel model) {
        return Column(
          children: model.purchases
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Product: ${e.productID}'),
                      Text('Status: ${e.status}'),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}

class StoreAvailability extends StatelessWidget {
  const StoreAvailability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: Modular.get<PaymentStore>(),
      onError: (_, e) => const Card(
        child: ListTile(title: Text('Erro ao carregar a loja')),
      ),
      onLoading: (_) => const Card(
        child: ListTile(title: Text('Conectando...')),
      ),
      onState: (_, PaymentModel model) {
        return Card(
          child: ListTile(
            leading: Icon(
              model.available ? Icons.check : Icons.block,
              color: model.available ? Colors.green : Colors.red,
            ),
            title: Text(
              'Loja ' + (model.available ? 'disponivel.' : 'indisponivel.'),
            ),
          ),
        );
      },
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  ListTile _emptyProducts() {
    return const ListTile(
      title: Text(
        'Não foi encontrado nenhum produto',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  ListTile _productNotFound(String id) {
    return ListTile(
      title: Text(
        'O produto $id não foi encontrado',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  ListTile _buildProduct(ProductStore product) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(product.description),
      trailing: TextButton(
        child: Text(product.formattedPrice),
        style: TextButton.styleFrom(
          backgroundColor: Colors.green[800],
          primary: Colors.white,
        ),
        onPressed: () {
          Modular.get<PaymentStore>().buy(product);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ScopedBuilder(
        store: Modular.get<PaymentStore>(),
        onLoading: (_) => const ListTile(
          leading: CircularProgressIndicator(),
          title: Text('Carregando os produtos'),
        ),
        onError: (_, e) => Text(e.toString()),
        onState: (_, PaymentModel model) {
          final products = <ListTile>[];

          // If dont have products
          if (model.products.isEmpty) return _emptyProducts();

          // If not found any product
          if (model.notFoundProducts.isNotEmpty) {
            products.addAll(model.notFoundProducts.map(_productNotFound));
          }

          products.addAll(model.products.map(_buildProduct));

          return Column(
            children: [
              const ListTile(
                leading: Icon(Icons.store),
                title: Text('Produtos à venda'),
              ),
              ...products,
            ],
          );
        },
      ),
    );
  }
}
