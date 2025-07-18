// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuarioStore on _UsuarioStore, Store {
  Computed<User>? _$userComputed;

  @override
  User get user => (_$userComputed ??= Computed<User>(
    () => super.user,
    name: '_UsuarioStore.user',
  )).value;
  Computed<Stream<User?>>? _$authStateComputed;

  @override
  Stream<User?> get authState =>
      (_$authStateComputed ??= Computed<Stream<User?>>(
        () => super.authState,
        name: '_UsuarioStore.authState',
      )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: '_UsuarioStore.hasError',
  )).value;
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??= Computed<bool>(
    () => super.isLoggedIn,
    name: '_UsuarioStore.isLoggedIn',
  )).value;
  Computed<bool>? _$isAnonymousComputed;

  @override
  bool get isAnonymous => (_$isAnonymousComputed ??= Computed<bool>(
    () => super.isAnonymous,
    name: '_UsuarioStore.isAnonymous',
  )).value;

  late final _$errorAtom = Atom(name: '_UsuarioStore.error', context: context);

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
    name: '_UsuarioStore.success',
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
    name: '_UsuarioStore.isLoading',
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

  late final _$registerAsyncAction = AsyncAction(
    '_UsuarioStore.register',
    context: context,
  );

  @override
  Future<void> register(String name, String email, String password) {
    return _$registerAsyncAction.run(
      () => super.register(name, email, password),
    );
  }

  late final _$loginAsyncAction = AsyncAction(
    '_UsuarioStore.login',
    context: context,
  );

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$googleLoginAsyncAction = AsyncAction(
    '_UsuarioStore.googleLogin',
    context: context,
  );

  @override
  Future<void> googleLogin() {
    return _$googleLoginAsyncAction.run(() => super.googleLogin());
  }

  late final _$loginAnonimoAsyncAction = AsyncAction(
    '_UsuarioStore.loginAnonimo',
    context: context,
  );

  @override
  Future<void> loginAnonimo() {
    return _$loginAnonimoAsyncAction.run(() => super.loginAnonimo());
  }

  late final _$converterContaAnonimaEmPermanenteAsyncAction = AsyncAction(
    '_UsuarioStore.converterContaAnonimaEmPermanente',
    context: context,
  );

  @override
  Future<void> converterContaAnonimaEmPermanente(
    String email,
    String password,
  ) {
    return _$converterContaAnonimaEmPermanenteAsyncAction.run(
      () => super.converterContaAnonimaEmPermanente(email, password),
    );
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_UsuarioStore.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$esqueceuSenhaAsyncAction = AsyncAction(
    '_UsuarioStore.esqueceuSenha',
    context: context,
  );

  @override
  Future<void> esqueceuSenha(String email) {
    return _$esqueceuSenhaAsyncAction.run(() => super.esqueceuSenha(email));
  }

  late final _$_UsuarioStoreActionController = ActionController(
    name: '_UsuarioStore',
    context: context,
  );

  @override
  void _setLoading(bool loading) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore._setLoading',
    );
    try {
      return super._setLoading(loading);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setError(String? errorMessage) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore._setError',
    );
    try {
      return super._setError(errorMessage);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setSuccess(bool successValue) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore._setSuccess',
    );
    try {
      return super._setSuccess(successValue);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetState() {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore._resetState',
    );
    try {
      return super._resetState();
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSuccess() {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore.clearSuccess',
    );
    try {
      return super.clearSuccess();
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
      name: '_UsuarioStore.reset',
    );
    try {
      return super.reset();
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
success: ${success},
isLoading: ${isLoading},
user: ${user},
authState: ${authState},
hasError: ${hasError},
isLoggedIn: ${isLoggedIn},
isAnonymous: ${isAnonymous}
    ''';
  }
}
