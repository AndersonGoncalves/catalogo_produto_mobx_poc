// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoStore on _ProdutoStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: '_ProdutoStore.hasError',
  )).value;
  Computed<bool>? _$hasProductsComputed;

  @override
  bool get hasProducts => (_$hasProductsComputed ??= Computed<bool>(
    () => super.hasProducts,
    name: '_ProdutoStore.hasProducts',
  )).value;
  Computed<int>? _$productsCountComputed;

  @override
  int get productsCount => (_$productsCountComputed ??= Computed<int>(
    () => super.productsCount,
    name: '_ProdutoStore.productsCount',
  )).value;

  late final _$errorAtom = Atom(name: '_ProdutoStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successAtom = Atom(
    name: '_ProdutoStore.success',
    context: context,
  );

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ProdutoStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$produtosAtom = Atom(
    name: '_ProdutoStore.produtos',
    context: context,
  );

  @override
  List<Produto> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<Produto> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  late final _$loadAsyncAction = AsyncAction(
    '_ProdutoStore.load',
    context: context,
  );

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$saveAsyncAction = AsyncAction(
    '_ProdutoStore.save',
    context: context,
  );

  @override
  Future<void> save(Map<String, dynamic> map) {
    return _$saveAsyncAction.run(() => super.save(map));
  }

  late final _$removeAsyncAction = AsyncAction(
    '_ProdutoStore.remove',
    context: context,
  );

  @override
  Future<void> remove(Produto produto) {
    return _$removeAsyncAction.run(() => super.remove(produto));
  }

  @override
  String toString() {
    return '''
error: ${error},
success: ${success},
isLoading: ${isLoading},
produtos: ${produtos},
hasError: ${hasError},
hasProducts: ${hasProducts},
productsCount: ${productsCount}
    ''';
  }
}
