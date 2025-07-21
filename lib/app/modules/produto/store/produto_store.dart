import 'package:mobx/mobx.dart';
import 'package:catalogo_produto_poc/app/core/models/produto.dart';
import 'package:catalogo_produto_poc/app/services/produto/produto_service.dart';

part 'produto_store.g.dart';
// flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs

class ProdutoStore = _ProdutoStore with _$ProdutoStore;

abstract class _ProdutoStore with Store {
  final ProdutoService _produtoService;

  _ProdutoStore({required ProdutoService produtoService})
    : _produtoService = produtoService;

  @observable
  String? error;

  @observable
  bool success = false;

  @observable
  bool isLoading = false;

  @observable
  List<Produto> produtos = [];

  @action
  Future<void> load() async {
    error = null;
    success = false;
    isLoading = true;

    try {
      await _produtoService.get();
      produtos = _produtoService.produtos;
      success = true;
    } catch (e) {
      error = 'Erro ao carregar produtos: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> save(Map<String, dynamic> map) async {
    error = null;
    success = false;
    isLoading = true;

    try {
      await _produtoService.save(map);
      await _produtoService.get();
      produtos = _produtoService.produtos;
      success = true;
    } catch (e) {
      error = 'Erro ao cadastrar produto: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> remove(Produto produto) async {
    error = null;
    success = false;
    isLoading = true;

    try {
      await _produtoService.delete(produto);
      await _produtoService.get();
      produtos = _produtoService.produtos;
      success = true;
    } catch (e) {
      error = 'Erro ao remover produto: ${e.toString()}';
      success = false;
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get hasError => error != null;

  @computed
  bool get hasProducts => produtos.isNotEmpty;

  @computed
  int get productsCount => produtos.length;
}
