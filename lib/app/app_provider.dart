import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalogo_produto_poc/app/app_widget.dart';
import 'package:catalogo_produto_poc/app/modules/usuario/cubit/usuario_controller.dart';
import 'package:catalogo_produto_poc/app/services/usuario/usuario_service_impl.dart';
import 'package:catalogo_produto_poc/app/services/produto/produto_service_impl.dart';
import 'package:catalogo_produto_poc/app/modules/produto/store/produto_store.dart';
import 'package:catalogo_produto_poc/app/repositories/produto/produto_repository_impl.dart';
import 'package:catalogo_produto_poc/app/repositories/usuario/usuario_repository_impl.dart';
import 'package:catalogo_produto_poc/app/repositories/carrinho/carrinho_repository_impl.dart';
import 'package:catalogo_produto_poc/app/services/carrinho/carrinho_service_impl.dart';
import 'package:catalogo_produto_poc/app/modules/carrinho/cubit/carrinho_controller.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Usuario
        Provider<UsuarioController>(
          create: (context) {
            final usuarioRepository = UsuarioRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
            );
            final usuarioService = UsuarioServiceImpl(
              usuarioRepository: usuarioRepository,
            );
            return UsuarioController(usuarioService: usuarioService);
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
        Provider<CarrinhoController>(
          create: (context) {
            final carrinhoRepository = CarrinhoRepositoryImpl();
            return CarrinhoController(
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
