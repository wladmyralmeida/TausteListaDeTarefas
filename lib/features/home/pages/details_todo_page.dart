import 'package:flutter/material.dart';

class DetailsTodoPage extends StatelessWidget {
  final String heroTag;

  const DetailsTodoPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Tarefa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://inovareducacaodeexcelencia.com/image/catalog/Tarefa%20pra%20casa_01.jpg',
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Título da Tarefa',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut justo ac neque tincidunt laoreet. Aenean sed sem in est congue porttitor. Nam eu diam nec justo tincidunt imperdiet. Sed nec nunc fermentum, congue nulla vel, tincidunt arcu.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição detalhada',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Vestibulum vel metus tincidunt, iaculis tortor vitae, mattis nulla. Morbi scelerisque nibh ac fermentum luctus. Fusce ac erat eget justo porttitor sollicitudin. Suspendisse vitae diam eu metus malesuada luctus.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Outras informações',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sed vel nulla a nisl ullamcorper dignissim. Aenean a neque ex. Vivamus tincidunt mi eget nisl ultricies, eget dictum turpis convallis. Pellentesque non nibh diam.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
