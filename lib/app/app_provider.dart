import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalogo_produto_poc/app/app_widget.dart';
import 'package:catalogo_produto_poc/app/modules/usuario/store/usuario_store.dart';
import 'package:catalogo_produto_poc/app/services/usuario/usuario_service_impl.dart';
import 'package:catalogo_produto_poc/app/services/produto/produto_service_impl.dart';
import 'package:catalogo_produto_poc/app/modules/produto/store/produto_store.dart';
import 'package:catalogo_produto_poc/app/repositories/produto/produto_repository_impl.dart';
import 'package:catalogo_produto_poc/app/repositories/usuario/usuario_repository_impl.dart';
import 'package:catalogo_produto_poc/app/repositories/carrinho/carrinho_repository_impl.dart';
import 'package:catalogo_produto_poc/app/services/carrinho/carrinho_service_impl.dart';
import 'package:catalogo_produto_poc/app/modules/carrinho/store/carrinho_store.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Usuario
        Provider<UsuarioStore>(
          create: (context) {
            final usuarioRepository = UsuarioRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
            );
            final usuarioService = UsuarioServiceImpl(
              usuarioRepository: usuarioRepository,
            );
            return UsuarioStore(usuarioService: usuarioService);
          },
        ),

        //Produto
        Provider<ProdutoStore>(
          create: (context) {
            final usuarioRepository = UsuarioRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
            );
            return ProdutoStore(
              produtoService: ProdutoServiceImpl(
                produtoRepository: ProdutoRepositoryImpl(
                  token: usuarioRepository.user.refreshToken.toString(),
                  produtos: [],
                ),
              ),
            );
          },
        ),

        //Carrinho
        Provider<CarrinhoStore>(
          create: (context) {
            final carrinhoRepository = CarrinhoRepositoryImpl();
            return CarrinhoStore(
              carrinhoService: CarrinhoServiceImpl(
                carrinhoRepository: carrinhoRepository,
              ),
            );
          },
        ),
      ],
      child: const AppWidget(),
    );
  }
}
