// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarrinhoStore on _CarrinhoStore, Store {
  Computed<Map<String, Carrinho>>? _$itemsMapComputed;

  @override
  Map<String, Carrinho> get itemsMap =>
      (_$itemsMapComputed ??= Computed<Map<String, Carrinho>>(
        () => super.itemsMap,
        name: '_CarrinhoStore.itemsMap',
      )).value;
  Computed<int>? _$quantidadeItemComputed;

  @override
  int get quantidadeItem => (_$quantidadeItemComputed ??= Computed<int>(
    () => super.quantidadeItem,
    name: '_CarrinhoStore.quantidadeItem',
  )).value;
  Computed<double>? _$valorTotalComputed;

  @override
  double get valorTotal => (_$valorTotalComputed ??= Computed<double>(
    () => super.valorTotal,
    name: '_CarrinhoStore.valorTotal',
  )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: '_CarrinhoStore.hasError',
  )).value;
  Computed<bool>? _$hasItemsComputed;

  @override
  bool get hasItems => (_$hasItemsComputed ??= Computed<bool>(
    () => super.hasItems,
    name: '_CarrinhoStore.hasItems',
  )).value;
  Computed<int>? _$itemsCountComputed;

  @override
  int get itemsCount => (_$itemsCountComputed ??= Computed<int>(
    () => super.itemsCount,
    name: '_CarrinhoStore.itemsCount',
  )).value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(
    () => super.isEmpty,
    name: '_CarrinhoStore.isEmpty',
  )).value;

  late final _$errorAtom = Atom(name: '_CarrinhoStore.error', context: context);

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
    name: '_CarrinhoStore.success',
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
    name: '_CarrinhoStore.isLoading',
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

  late final _$itemsAtom = Atom(name: '_CarrinhoStore.items', context: context);

  @override
  List<Carrinho> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Carrinho> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_CarrinhoStoreActionController = ActionController(
    name: '_CarrinhoStore',
    context: context,
  );

  @override
  void add(Produto produto) {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
      name: '_CarrinhoStore.add',
    );
    try {
      return super.add(produto);
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String produtoId) {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
      name: '_CarrinhoStore.remove',
    );
    try {
      return super.remove(produtoId);
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSingleItem(String produtoId) {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
      name: '_CarrinhoStore.removeSingleItem',
    );
    try {
      return super.removeSingleItem(produtoId);
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
      name: '_CarrinhoStore.clear',
    );
    try {
      return super.clear();
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
      name: '_CarrinhoStore.resetState',
    );
    try {
      return super.resetState();
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
success: ${success},
isLoading: ${isLoading},
items: ${items},
itemsMap: ${itemsMap},
quantidadeItem: ${quantidadeItem},
valorTotal: ${valorTotal},
hasError: ${hasError},
hasItems: ${hasItems},
itemsCount: ${itemsCount},
isEmpty: ${isEmpty}
    ''';
  }
}
