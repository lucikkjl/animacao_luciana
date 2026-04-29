import 'package:flutter/material.dart';
import '../../models/produto.dart';

class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final produto = ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
      appBar: AppBar(title: Text(produto.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: produto.id,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: produto.cor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomPaint(
              size: const Size(100, 100),
              painter: FormaCustomizadaPainter(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FormaCustomizadaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 192, 38, 97)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}