import 'package:mobx/mobx.dart';
import 'package:catalogo_produto_poc/app/core/models/produto.dart';
import 'package:catalogo_produto_poc/app/core/models/carrinho.dart';
import 'package:catalogo_produto_poc/app/services/carrinho/carrinho_service.dart';

part 'carrinho_store.g.dart';
// flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  final CarrinhoService _carrinhoService;

  _CarrinhoStore({required CarrinhoService carrinhoService})
    : _carrinhoService = carrinhoService;

  @observable
  String? error;

  @observable
  bool success = false;

  @observable
  bool isLoading = false;

  @observable
  List<Carrinho> items = [];

  // Getters que acessam o service
  @computed
  Map<String, Carrinho> get itemsMap => _carrinhoService.items;

  @computed
  int get quantidadeItem => _carrinhoService.quantidadeItem;

  @computed
  double get valorTotal => _carrinhoService.valorTotal;

  @computed
  bool get hasError => error != null;

  @computed
  bool get hasItems => items.isNotEmpty;

  @computed
  int get itemsCount => items.length;

  @computed
  bool get isEmpty => items.isEmpty;

  @action
  void add(Produto produto) {
    error = null;
    success = false;
    isLoading = true;

    try {
      _carrinhoService.add(produto);
      items = _carrinhoService.items.values.toList();
      success = true;
    } catch (e) {
      error = 'Erro ao adicionar produto: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  void remove(String produtoId) {
    error = null;
    success = false;
    isLoading = true;

    try {
      _carrinhoService.remove(produtoId);
      items = _carrinhoService.items.values.toList();
      success = true;
    } catch (e) {
      error = 'Erro ao remover produto: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  void removeSingleItem(String produtoId) {
    error = null;
    success = false;
    isLoading = true;

    try {
      _carrinhoService.removeSingleItem(produtoId);
      items = _carrinhoService.items.values.toList();
      success = true;
    } catch (e) {
      error = 'Erro ao remover item: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  void clear() {
    error = null;
    success = false;
    isLoading = true;

    try {
      _carrinhoService.clear();
      items = _carrinhoService.items.values.toList();
      success = true;
    } catch (e) {
      error = 'Erro ao limpar carrinho: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  void resetState() {
    error = null;
    success = false;
    isLoading = false;
  }
}
