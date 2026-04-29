import 'package:flutter/material.dart';
import '../../../models/produto.dart';
import '../../../routes/app_routes.dart';

class ItemGaleriaWidget extends StatelessWidget {
  final Produto produto;

  const ItemGaleriaWidget({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Hero(
          tag: produto.id,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: produto.cor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        title: Text(produto.titulo),
        trailing: FilledButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.detalhes,
              arguments: produto,
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 252, 94, 154),
          ),
          child: const Text('Ver'),
        ),
      ),
    );
  }
}