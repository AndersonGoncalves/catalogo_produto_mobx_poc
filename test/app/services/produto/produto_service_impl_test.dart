import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_produto_poc/app/core/models/produto.dart';
import 'package:catalogo_produto_poc/app/services/produto/produto_service_impl.dart';
import 'package:catalogo_produto_poc/app/repositories/produto/produto_repository_impl.dart';

class ProdutoRepositoryFake extends Mock implements ProdutoRepositoryImpl {}

void main() {
  late ProdutoRepositoryImpl produtoRepository;

  setUp(() {
    produtoRepository = ProdutoRepositoryFake();
  });

  test('produtoRepository deve conter 2 produtos na lista', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );
    when(() => produtoRepository.produtos).thenReturn([
      Produto(id: '1', dataCadastro: DateTime.now(), nome: 'Malbec'),
      Produto(id: '2', dataCadastro: DateTime.now(), nome: 'Arbo'),
    ]);
    expect(service.produtos.length, 2);
  });

  test('produtoRepository deve conter 1 produto na lista', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    when(() => produtoRepository.produtos).thenReturn([
      Produto(id: '1', dataCadastro: DateTime.now(), nome: 'Malbec'),
    ]);
    when(() => produtoRepository.get()).thenAnswer((_) async {});

    await service.get();
    expect(service.produtos.length, 1);
  });

  test('deve adicionar produto corretamente', () {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    final produto = Produto(
      id: '1',
      dataCadastro: DateTime.now(),
      nome: 'Teste',
    );
    when(() => produtoRepository.add(produto)).thenReturn(produto);

    service.add(produto);
    verify(() => produtoRepository.add(produto)).called(1);
  });

  test('deve fazer post do produto corretamente', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    final produto = Produto(
      id: '1',
      dataCadastro: DateTime.now(),
      nome: 'Teste',
    );
    when(() => produtoRepository.post(produto)).thenAnswer((_) async {});

    await service.post(produto);
    verify(() => produtoRepository.post(produto)).called(1);
  });

  test('deve fazer patch do produto corretamente', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    final produto = Produto(
      id: '1',
      dataCadastro: DateTime.now(),
      nome: 'Teste',
    );
    when(() => produtoRepository.patch(produto)).thenAnswer((_) async {});

    await service.patch(produto);
    verify(() => produtoRepository.patch(produto)).called(1);
  });

  test('deve deletar produto corretamente', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    final produto = Produto(
      id: '1',
      dataCadastro: DateTime.now(),
      nome: 'Teste',
    );
    when(() => produtoRepository.delete(produto)).thenAnswer((_) async {});

    await service.delete(produto);
    verify(() => produtoRepository.delete(produto)).called(1);
  });

  test('deve salvar dados do mapa corretamente', () async {
    ProdutoServiceImpl service = ProdutoServiceImpl(
      produtoRepository: produtoRepository,
    );

    final map = {'id': '1', 'nome': 'Teste'};
    when(() => produtoRepository.save(map)).thenAnswer((_) async {});

    await service.save(map);
    verify(() => produtoRepository.save(map)).called(1);
  });
}
