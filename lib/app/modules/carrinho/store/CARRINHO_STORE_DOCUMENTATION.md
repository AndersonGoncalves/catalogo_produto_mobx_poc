# CarrinhoStore - Migração de Cubit para MobX

## ✅ **CarrinhoStore Criada com Sucesso**

A `CarrinhoStore` foi criada seguindo o padrão MobX, substituindo o `CarrinhoController` (Cubit).

## 📋 **Estrutura da Store:**

### **Observables (Estado)**
```dart
@observable
String? error;           // Mensagem de erro

@observable
bool success = false;    // Indica se a última operação foi bem-sucedida

@observable
bool isLoading = false;  // Indica se há operação em andamento

@observable
List<Carrinho> items = []; // Lista de itens no carrinho
```

### **Computed Properties (Valores Derivados)**
```dart
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
```

### **Actions (Ações)**
```dart
@action
void add(Produto produto)           // Adiciona produto ao carrinho

@action
void remove(String produtoId)       // Remove produto completamente

@action
void removeSingleItem(String produtoId) // Remove apenas 1 unidade

@action
void clear()                        // Limpa todo o carrinho

@action
void resetState()                   // Reseta o estado (error, success, loading)
```

## 🔄 **Migração do Cubit para MobX:**

### **Antes (Cubit):**
```dart
class CarrinhoController extends Cubit<CarrinhoState> {
  void add(Produto produto) {
    emit(state.copyWith(isLoading: true, error: null, success: false));
    try {
      _carrinhoService.add(produto);
      emit(state.copyWith(
        items: _carrinhoService.items.values.toList(),
        isLoading: false,
        success: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: 'Erro ao adicionar produto: ${e.toString()}',
        isLoading: false,
        success: false,
      ));
    }
  }
}
```

### **Depois (MobX):**
```dart
class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
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
}
```

## 🎯 **Como Usar na UI:**

### **1. Consumir a Store:**
```dart
final carrinhoStore = context.read<CarrinhoStore>();
```

### **2. Observar Mudanças:**
```dart
Observer(
  builder: (_) {
    if (carrinhoStore.isLoading) {
      return CircularProgressIndicator();
    }
    
    if (carrinhoStore.hasError) {
      return Text('Erro: ${carrinhoStore.error}');
    }
    
    if (carrinhoStore.isEmpty) {
      return Text('Carrinho vazio');
    }
    
    return ListView.builder(
      itemCount: carrinhoStore.itemsCount,
      itemBuilder: (context, index) {
        final item = carrinhoStore.items[index];
        return ListTile(
          title: Text(item.produto.nome),
          subtitle: Text('Quantidade: ${item.quantidade}'),
          trailing: Text('R\$ ${item.valorTotal.toStringAsFixed(2)}'),
        );
      },
    );
  },
)
```

### **3. Chamar Actions:**
```dart
// Adicionar produto
carrinhoStore.add(produto);

// Remover produto completamente
carrinhoStore.remove(produtoId);

// Remover apenas 1 unidade
carrinhoStore.removeSingleItem(produtoId);

// Limpar carrinho
carrinhoStore.clear();
```

## 📊 **Computed Properties Úteis:**

```dart
// Verificar se há itens
if (carrinhoStore.hasItems) {
  // Mostrar botão "Finalizar Compra"
}

// Mostrar total
Text('Total: R\$ ${carrinhoStore.valorTotal.toStringAsFixed(2)}');

// Mostrar quantidade
Text('${carrinhoStore.quantidadeItem} itens');

// Badge no ícone do carrinho
Badge(
  count: carrinhoStore.itemsCount,
  child: Icon(Icons.shopping_cart),
);
```

## 🔧 **Próximos Passos:**

1. **Atualizar o Provider** para usar `CarrinhoStore` em vez de `CarrinhoController`
2. **Migrar páginas** que usam `BlocConsumer<CarrinhoController>` para `Observer`
3. **Testar** todas as funcionalidades do carrinho

## 🎉 **Vantagens da Migração:**

- ✅ **Menos Boilerplate**: Sem `emit()` e `copyWith()`
- ✅ **Mais Direto**: Atribuição direta às propriedades
- ✅ **Computed Properties**: Valores derivados automáticos
- ✅ **Melhor Performance**: Reconstruções granulares
- ✅ **Código Mais Limpo**: Lógica mais clara e concisa

A `CarrinhoStore` está pronta para uso! 🚀
