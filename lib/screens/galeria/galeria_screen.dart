import 'package:flutter/material.dart';
import '../../models/produto.dart';
import 'widgets/item_galeria_widget.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({super.key});

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animacao;
  bool _expandido = false;

  final List<Produto> _produtos = [
    Produto(id: '1', titulo: 'Produto Alpha', cor: const Color.fromARGB(255, 255, 40, 122)),
    Produto(id: '2', titulo: 'Produto Beta', cor: const Color.fromARGB(255, 255, 100, 159)),
    Produto(id: '3', titulo: 'Produto Gama', cor: const Color.fromARGB(255, 255, 162, 198)),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animacao = Tween<double>(begin: 0.8, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galeria Animada 𖹭')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => setState(() => _expandido = !_expandido),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                height: _expandido ? 150 : 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(_expandido ? 30 : 10),
                ),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Toque na Animação Implícita!'),
                      AnimatedOpacity(
                        opacity: _expandido ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Column(
                            children: [
                              Icon(Icons.auto_awesome, color: Color.fromARGB(255, 255, 40, 122), size: 30),
                              Text(
                                '✨ Surpresa ✨',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: AnimatedBuilder(
              animation: _animacao,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animacao.value,
                  child: child,
                );
              },
              child: const Icon(Icons.star, size: 40, color: Color.fromARGB(255, 255, 187, 0)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                return ItemGaleriaWidget(produto: _produtos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}