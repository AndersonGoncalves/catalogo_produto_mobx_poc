# Migração do UsuarioController para UsuarioStore

## Visão Geral
Este documento descreve a migração do `UsuarioController` (Cubit) para o `UsuarioStore` (MobX) na aplicação de catálogo de produtos.

## Arquivo Criado

### usuario_store.dart
Localização: `lib/app/modules/usuario/store/usuario_store.dart`

**Estrutura do MobX Store:**

#### Observables (Estados Observáveis)
- `String? error` - Mensagem de erro
- `bool success` - Indicador de sucesso
- `bool isLoading` - Indicador de carregamento

#### Computed Properties (Propriedades Calculadas)
- `User get user` - Usuário atual do Firebase
- `Stream<User?> get authState` - Stream do estado de autenticação
- `bool get hasError` - Verifica se há erro
- `bool get isLoggedIn` - Verifica se usuário está logado
- `bool get isAnonymous` - Verifica se usuário é anônimo

#### Actions (Ações)
- `register()` - Registrar novo usuário
- `login()` - Fazer login
- `googleLogin()` - Login com Google
- `loginAnonimo()` - Login anônimo
- `converterContaAnonimaEmPermanente()` - Converter conta anônima
- `logout()` - Fazer logout
- `esqueceuSenha()` - Recuperar senha
- `clearError()` - Limpar erro
- `clearSuccess()` - Limpar sucesso
- `reset()` - Resetar estado

#### Actions Privadas (Auxiliares)
- `_setLoading()` - Definir estado de carregamento
- `_setError()` - Definir erro
- `_setSuccess()` - Definir sucesso
- `_resetState()` - Resetar estado interno

## Diferenças Principais

### 1. Padrão de Estado
**Antes (Cubit):**
```dart
class UsuarioController extends Cubit<UsuarioState> {
  UsuarioController() : super(UsuarioState());
  
  void login() {
    emit(state.copyWith(isLoading: true));
  }
}
```

**Depois (MobX):**
```dart
class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  @observable
  bool isLoading = false;
  
  @action
  void login() {
    isLoading = true;
  }
}
```

### 2. Reatividade
**Antes:** Utilizava `BlocConsumer` ou `BlocBuilder` para escutar mudanças
**Depois:** Utiliza `Observer` para reatividade automática

### 3. Gerenciamento de Estado
**Antes:** Estados imutáveis com `copyWith()`
**Depois:** Estados mutáveis com observables

## Arquivos Atualizados

### 1. app_provider.dart
- Substituído `UsuarioController` por `UsuarioStore`
- Atualizado import para usar o novo store

### 2. home_page.dart
- Atualizado import para usar `UsuarioStore`
- Substituído `context.read<UsuarioController>()` por `context.read<UsuarioStore>()`

## Vantagens da Migração

### 1. Reatividade Automática
- O Observer reage automaticamente a mudanças nos observables
- Não é necessário gerenciar streams manualmente

### 2. Computed Properties
- Valores calculados são automaticamente atualizados
- Cache automático evita recálculos desnecessários

### 3. Sintaxe Mais Limpa
- Menos boilerplate code
- Estados podem ser modificados diretamente

### 4. Melhor Performance
- Apenas componentes que usam valores alterados são reconstruídos
- Computed properties são lazy por padrão

## Exemplo de Uso

### Na UI (Observer)
```dart
Observer(
  builder: (context) {
    final usuarioStore = context.read<UsuarioStore>();
    
    if (usuarioStore.isLoading) {
      return CircularProgressIndicator();
    }
    
    if (usuarioStore.hasError) {
      return Text('Erro: ${usuarioStore.error}');
    }
    
    return Text('Usuário: ${usuarioStore.user.displayName}');
  },
)
```

### Chamada de Ação
```dart
onPressed: () {
  final usuarioStore = context.read<UsuarioStore>();
  usuarioStore.login(email, password);
}
```

## Próximos Passos

1. **Migrar páginas de usuário** - Substituir BlocConsumer por Observer nas páginas que usam UsuarioController
2. **Testes** - Atualizar testes para usar UsuarioStore
3. **Validação** - Verificar se todas as funcionalidades estão funcionando corretamente

## Considerações Importantes

### 1. Tratamento de Erros
- Erros agora são tratados diretamente nos observables
- Use `WidgetsBinding.instance.addPostFrameCallback` para mostrar SnackBars

### 2. Estados Assíncronos
- Actions podem ser async sem problemas
- Use `runInAction` se precisar modificar observables após await

### 3. Dispose
- MobX gerencia automaticamente a limpeza de recursos
- Não é necessário dispose manual como no Cubit

## Geração de Código

O arquivo `usuario_store.g.dart` é gerado automaticamente pelo build_runner:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Este arquivo contém o código gerado para:
- Observables
- Computed properties
- Actions
- Notificações de mudança
