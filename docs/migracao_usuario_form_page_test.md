# Migração do BlocProvider para Provider no usuario_form_page_test.dart

## Visão Geral
Este documento descreve a migração do `BlocProvider<UsuarioController>` para `Provider<UsuarioStore>` no arquivo de testes `usuario_form_page_test.dart`.

## Mudanças Realizadas

### 1. Imports Atualizados
**Adicionado:**
- `import 'package:provider/provider.dart';` - Para usar Provider em vez de BlocProvider

**Removido:**
- `import 'package:flutter_bloc/flutter_bloc.dart';` - Não é mais necessário

### 2. Substituição do BlocProvider por Provider

**Antes (BlocProvider):**
```dart
BlocProvider<UsuarioController>(
  create: (_) =>
      UsuarioController(usuarioService: MockUsuarioServiceImpl()),
  child: const UsuarioFormPage(usuarioAnonimo: true),
)
```

**Depois (Provider):**
```dart
Provider<UsuarioStore>(
  create: (_) =>
      UsuarioStore(usuarioService: MockUsuarioServiceImpl()),
  child: const UsuarioFormPage(usuarioAnonimo: true),
)
```

## Principais Diferenças

### 1. Provider vs BlocProvider
**Antes:** `BlocProvider<UsuarioController>`
**Depois:** `Provider<UsuarioStore>`

### 2. Instanciação
**Antes:** `UsuarioController(usuarioService: MockUsuarioServiceImpl())`
**Depois:** `UsuarioStore(usuarioService: MockUsuarioServiceImpl())`

### 3. Padrão de Injeção
**Antes:** Usa BlocProvider para injeção de dependência
**Depois:** Usa Provider para injeção de dependência

## Estrutura dos Testes

### Test Widget Structure
```dart
await tester.pumpWidget(
  MaterialApp(
    home: Provider<UsuarioStore>(
      create: (_) => UsuarioStore(usuarioService: MockUsuarioServiceImpl()),
      child: const UsuarioFormPage(usuarioAnonimo: true),
    ),
  ),
);
```

### Testes Atualizados

#### 1. Teste de Exibição do Campo Email
```dart
testWidgets(
  'deve exibir o campo de email na tela quando estiver com usuario anônimo',
  (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Provider<UsuarioStore>(
          create: (_) => UsuarioStore(usuarioService: MockUsuarioServiceImpl()),
          child: const UsuarioFormPage(usuarioAnonimo: true),
        ),
      ),
    );

    final emailField = find.byKey(const Key('email_key'));
    expect(emailField, findsOneWidget);
  },
);
```

#### 2. Teste de Validação de Email
```dart
testWidgets('deve exibir a mensagem de email inválido', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Provider<UsuarioStore>(
        create: (_) => UsuarioStore(usuarioService: MockUsuarioServiceImpl()),
        child: const UsuarioFormPage(usuarioAnonimo: true),
      ),
    ),
  );

  final entrarButton = find.byKey(const Key('usuario_form_entrar_key'));
  await tester.tap(entrarButton);
  await tester.pumpAndSettle();
  final emailError = find.text('Informe um email válido');
  expect(emailError, findsOneWidget);
});
```

## Implementação de Mocks

### FakeUsuarioRepository
```dart
class FakeUsuarioRepository implements UsuarioRepository {
  @override
  Stream<User?> get authState => throw UnimplementedError();

  @override
  Future<User?> converterContaAnonimaEmPermanente(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> esqueceuSenha(String email) {
    throw UnimplementedError();
  }

  @override
  Future<User?> googleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<User?> login(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<User?> loginAnonimo() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<User?> register(String name, String email, String password) {
    throw UnimplementedError();
  }

  @override
  User get user => throw UnimplementedError();
}
```

### MockUsuarioServiceImpl
```dart
class MockUsuarioServiceImpl extends UsuarioServiceImpl {
  MockUsuarioServiceImpl() : super(usuarioRepository: FakeUsuarioRepository());
}
```

## Vantagens da Migração

### 1. **Consistência**
- Todos os testes agora usam o mesmo padrão (Provider)
- Não mistura Bloc com MobX

### 2. **Simplicidade**
- Provider é mais simples que BlocProvider
- Menos boilerplate code

### 3. **Compatibilidade**
- Totalmente compatível com o padrão MobX
- Funciona perfeitamente com Observer

### 4. **Testabilidade**
- Testes continuam funcionando sem problemas
- Fácil de mockar e testar

## Resultados dos Testes

### ✅ Testes Passando
```
00:13 +2: All tests passed!
```

### ✅ Testes Executados
1. **Campo Email:** Verifica se o campo de email é exibido corretamente
2. **Validação:** Verifica se a mensagem de erro é exibida para email inválido

### ✅ Funcionalidades Testadas
- Renderização do formulário
- Validação de campos
- Exibição de mensagens de erro
- Interação com botões

## Considerações Importantes

### 1. **Injeção de Dependência**
- Provider substitui BlocProvider perfeitamente
- Mesmo padrão de injeção usado na aplicação

### 2. **Mocking**
- Mocks continuam funcionando normalmente
- FakeUsuarioRepository implementa todos os métodos necessários

### 3. **Widget Testing**
- Testes de widget funcionam normalmente
- Pump e PumpAndSettle funcionam como esperado

### 4. **Compatibilidade**
- Totalmente compatível com flutter_test
- Funciona com todas as versões do Flutter

## Próximos Passos

### 1. **Expandir Testes**
- Adicionar testes para todas as funcionalidades
- Testar cenários de sucesso e erro
- Testar loading states

### 2. **Mock Completo**
- Implementar mocks funcionais para cenários específicos
- Testar fluxos completos de autenticação

### 3. **Testes de Integração**
- Testar integração com Firebase Auth
- Testar fluxos end-to-end

### 4. **Cobertura de Testes**
- Aumentar cobertura de testes
- Incluir testes para todos os métodos do UsuarioStore

## Exemplo de Teste Futuro

```dart
testWidgets('deve fazer login com sucesso', (tester) async {
  // Arrange
  final mockService = MockUsuarioServiceImpl();
  when(mockService.login(any, any))
      .thenAnswer((_) async => MockUser());

  await tester.pumpWidget(
    MaterialApp(
      home: Provider<UsuarioStore>(
        create: (_) => UsuarioStore(usuarioService: mockService),
        child: const UsuarioFormPage(),
      ),
    ),
  );

  // Act
  await tester.enterText(
    find.byKey(const Key('email_key')), 
    'test@email.com'
  );
  await tester.enterText(
    find.byKey(const Key('password_key')), 
    '123456'
  );
  await tester.tap(find.byKey(const Key('usuario_form_entrar_key')));
  await tester.pumpAndSettle();

  // Assert
  verify(mockService.login('test@email.com', '123456')).called(1);
});
```

Este exemplo mostra como expandir os testes para cobrir funcionalidades específicas do UsuarioStore.
