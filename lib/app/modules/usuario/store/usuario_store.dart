import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalogo_produto_poc/app/core/exceptions/auth_exception.dart';
import 'package:catalogo_produto_poc/app/services/usuario/usuario_service_impl.dart';

part 'usuario_store.g.dart';

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  final UsuarioServiceImpl _usuarioService;

  _UsuarioStore({required UsuarioServiceImpl usuarioService})
    : _usuarioService = usuarioService;

  // Observables - Estados da aplicação
  @observable
  String? error;

  @observable
  bool success = false;

  @observable
  bool isLoading = false;

  // Computed - Propriedades calculadas
  @computed
  User get user => _usuarioService.user;

  @computed
  Stream<User?> get authState => _usuarioService.authState;

  @computed
  bool get hasError => error != null && error!.isNotEmpty;

  @computed
  bool get isLoggedIn => _usuarioService.user.uid.isNotEmpty;

  @computed
  bool get isAnonymous => _usuarioService.user.isAnonymous;

  // Actions - Métodos que modificam o estado
  @action
  void _setLoading(bool loading) {
    isLoading = loading;
  }

  @action
  void _setError(String? errorMessage) {
    error = errorMessage;
  }

  @action
  void _setSuccess(bool successValue) {
    success = successValue;
  }

  @action
  void _resetState() {
    error = null;
    success = false;
  }

  @action
  Future<void> register(String name, String email, String password) async {
    _setLoading(true);
    _resetState();

    try {
      final user = await _usuarioService.register(name, email, password);
      if (user != null) {
        _setLoading(false);
        _setSuccess(true);
      } else {
        _setLoading(false);
        _setError('Erro ao registrar usuário');
      }
    } on AuthException catch (e) {
      _setLoading(false);
      _setError('Erro ao registrar usuário: ${e.toString()}');
    } catch (e) {
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> login(String email, String password) async {
    _setLoading(true);
    _resetState();

    try {
      final user = await _usuarioService.login(email, password);
      if (user != null) {
        _setLoading(false);
        _setSuccess(true);
      } else {
        _setLoading(false);
        _setError('Usuário ou senha inválida');
      }
    } on AuthException catch (e) {
      _setLoading(false);
      _setError(e.message);
    } catch (e) {
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> googleLogin() async {
    _setLoading(true);
    _resetState();

    try {
      final user = await _usuarioService.googleLogin();
      if (user != null) {
        _setLoading(false);
        _setSuccess(true);
      } else {
        _usuarioService.logout();
        _setLoading(false);
        _setError('Erro ao realizar login com google');
      }
    } on AuthException catch (e) {
      _usuarioService.logout();
      _setLoading(false);
      _setError('Erro ao realizar login com google: ${e.toString()}');
    } catch (e) {
      _usuarioService.logout();
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> loginAnonimo() async {
    _setLoading(true);
    _resetState();

    try {
      await _usuarioService.loginAnonimo();
      _setLoading(false);
      _setSuccess(true);
    } on AuthException catch (e) {
      _setLoading(false);
      _setError(e.message);
    } catch (e) {
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> converterContaAnonimaEmPermanente(
    String email,
    String password,
  ) async {
    _setLoading(true);
    _resetState();

    try {
      final user = await _usuarioService.converterContaAnonimaEmPermanente(
        email,
        password,
      );
      if (user != null) {
        _setLoading(false);
        _setSuccess(true);
      } else {
        _setLoading(false);
        _setError('Não foi possível converter o usuário anônimo');
      }
    } on AuthException catch (e) {
      _setLoading(false);
      _setError('Não foi possível converter o usuário anônimo: ${e.message}');
    } catch (e) {
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> logout() async {
    _setLoading(true);
    _resetState();

    try {
      await _usuarioService.logout();
      _setLoading(false);
      _setSuccess(true);
    } on AuthException catch (e) {
      _setLoading(false);
      _setError(e.message);
    } catch (e) {
      _setLoading(false);
      _setError('Erro inesperado: ${e.toString()}');
    }
  }

  @action
  Future<void> esqueceuSenha(String email) async {
    _setLoading(true);
    _resetState();

    try {
      await _usuarioService.esqueceuSenha(email);
      _setLoading(false);
      _setSuccess(true);
    } on AuthException catch (e) {
      _setLoading(false);
      _setError(e.message);
    } catch (e) {
      _setLoading(false);
      _setError('Erro ao resetar senha: ${e.toString()}');
    }
  }

  @action
  void clearError() {
    error = null;
  }

  @action
  void clearSuccess() {
    success = false;
  }

  @action
  void reset() {
    _resetState();
    _setLoading(false);
  }
}
