import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final int itemCount = 20;
  late List<bool> _favorites;

  // Listas de ejemplo para variar contenido.
  final List<String> images = [
    'assets/images/p1.png',
    'assets/images/p2.png',
    'assets/images/p3.png',
    'assets/images/p4.png',
  ];
  final List<String> titles = [
    'Modern Light Clothes',
    'Light Dress Bless',
    'Maroon Dark Top',
    'Light Dress Yellow',
  ];
  final List<String> subtitles = ['T-Shirt', 'Dress modern', 'Dress', 'Skirt'];
  final List<String> prices = ['\$212.99', '\$180.50', '\$250.00', '\$199.99'];
  final String rating = '5.0';

  @override
  void initState() {
    super.initState();
    _favorites = List.generate(itemCount, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        // Para variar la altura de la imagen
        double height = (index % 4 == 0 || index % 4 == 3) ? 258 : 320;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    images[index % images.length],
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Icono del corazón con toggle al presionar
                Positioned(
                  top: 10,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _favorites[index] = !_favorites[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xff292526),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        _favorites[index]
                            ? 'assets/svg/heart_fill.svg'
                            : 'assets/svg/heart.svg',
                        color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              titles[index % titles.length],
              style: const TextStyle(
                color: Color(0xFF121111),
                fontSize: 14,
                fontFamily: 'Encode',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitles[index % subtitles.length],
              style: const TextStyle(
                color: Color(0xFF787676),
                fontFamily: 'Encode',
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  prices[index % prices.length],
                  style: const TextStyle(
                    color: Color(0xFF121111),
                    fontSize: 14,
                    fontFamily: 'Encode',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/star.svg',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: Color(0xFF121111),
                        fontSize: 12,
                        fontFamily: 'Encode',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
