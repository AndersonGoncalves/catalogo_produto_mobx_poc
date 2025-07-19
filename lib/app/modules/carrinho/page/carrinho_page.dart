import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:catalogo_produto_poc/app/core/ui/theme_extensions.dart';
import 'package:catalogo_produto_poc/app/modules/carrinho/page/carrinho_item.dart';
import 'package:catalogo_produto_poc/app/modules/carrinho/store/carrinho_store.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context);
    final items = carrinhoStore.items.toList();

    return Scaffold(
      body: Observer(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  carrinhoStore.items.isEmpty ? '' : 'Carrinho de Compras',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              carrinhoStore.items.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Seu carrinho está vazio',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (ctx, i) =>
                            CarrinhoItem(carrinho: items[i]),
                      ),
                    ),

              Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Chip(
                        backgroundColor: context.secondaryColor,
                        label: Text(
                          'R\$${carrinhoStore.valorTotal.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),

                      CartButton(cart: carrinhoStore),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CartButton extends StatefulWidget {
  const CartButton({super.key, required this.cart});

  final CarrinhoStore cart;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: widget.cart.quantidadeItem == 0
                ? null
                : () async {
                    setState(() => _isLoading = true);
                    //TODO: Chamar a page do pedido
                    widget.cart.clear();
                    setState(() => _isLoading = false);
                  },
            child: Text(
              'COMPRAR',
              style: TextStyle(color: context.primaryColor),
            ),
          );
  }
}
