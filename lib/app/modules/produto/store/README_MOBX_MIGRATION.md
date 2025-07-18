# Migração do Produto Controller para MobX

Este documento explica a migração do controller de produto de Bloc/Cubit para MobX.

## Arquivos Criados

### 1. `lib/app/modules/produto/store/produto_store.dart`
Este é o novo controller/store usando MobX que substitui o `ProdutoController` baseado em Cubit.

#### Características principais:
- **@observable**: Para propriedades que podem ser observadas (error, success, isLoading, produtos)
- **@action**: Para métodos que modificam o estado (load, save, remove)
- **@computed**: Para valores calculados (hasError, hasProducts, productsCount)

### 2. `lib/app/app_provider.dart`
Nova versão do provider que usa MobX em vez de Bloc.

#### Mudanças principais:
- Usa `MultiProvider` em vez de `MultiBlocProvider`
- Usa `Provider<ProdutoStore>` em vez de `BlocProvider<ProdutoController>`
- Mantém a mesma lógica de instanciação dos services e repositories

## Como Usar a Nova Store

### 1. Injeção de Dependência
A store é injetada através do Provider no `app_provider.dart`:

```dart
Provider<ProdutoStore>(
  create: (context) {
    return ProdutoStore(
      produtoService: ProdutoServiceImpl(/* ... */),
    );
  },
),
```

### 2. Consumo na UI
Para usar a store em uma página, você precisa:

#### a) Obter a referência da store:
```dart
final produtoStore = context.read<ProdutoStore>();
```

#### b) Observar mudanças de estado:
```dart
Observer(
  builder: (_) {
    if (produtoStore.isLoading) {
      return CircularProgressIndicator();
    }
    
    if (produtoStore.hasError) {
      return Text(produtoStore.error!);
    }
    
    return ListView.builder(
      itemCount: produtoStore.produtos.length,
      itemBuilder: (context, index) {
        final produto = produtoStore.produtos[index];
        return ListTile(
          title: Text(produto.nome),
          subtitle: Text('R\$ \${produto.precoDeVenda.toStringAsFixed(2)}'),
        );
      },
    );
  },
)
```

#### c) Chamar ações:
```dart
// Carregar produtos
produtoStore.load();

// Salvar produto
produtoStore.save(produtoMap);

// Remover produto
produtoStore.remove(produto);
```

## Dependências Adicionadas

### pubspec.yaml
```yaml
dependencies:
  mobx: ^2.5.0
  flutter_mobx: ^2.3.0

dev_dependencies:
  build_runner: ^2.4.8
  mobx_codegen: ^2.6.1
```

## Comandos para Geração de Código

### Gerar uma vez:
```bash
flutter packages pub run build_runner build
```

### Gerar em modo watch (para desenvolvimento):
```bash
flutter packages pub run build_runner watch
```

## Vantagens do MobX

1. **Código mais limpo**: Menos boilerplate comparado ao Bloc
2. **Reatividade automática**: O Observer reconstrói automaticamente quando observables mudam
3. **Computed values**: Valores derivados são recalculados automaticamente
4. **Debugging**: Facilita o debug com as ferramentas do MobX DevTools

## Migração das Páginas Existentes

Para migrar páginas que usam o `ProdutoController` (Bloc):

### Antes (Bloc):
```dart
BlocBuilder<ProdutoController, ProdutoState>(
  builder: (context, state) {
    if (state.isLoading) {
      return CircularProgressIndicator();
    }
    // ...
  },
)
```

### Depois (MobX):
```dart
Observer(
  builder: (_) {
    if (produtoStore.isLoading) {
      return CircularProgressIndicator();
    }
    // ...
  },
)
```

## Observações Importantes

1. **Arquivo .g.dart**: O arquivo `produto_store.g.dart` é gerado automaticamente pelo build_runner. Não edite manualmente.

2. **Context**: Use `context.read<ProdutoStore>()` para obter a store, e `Observer` para observar mudanças.

3. **Testes**: Para testes, você pode instanciar a store diretamente sem precisar do Provider.
