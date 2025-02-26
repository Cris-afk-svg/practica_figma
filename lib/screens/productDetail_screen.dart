import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _selectedSizeIndex = 1; // Para la talla seleccionada
  int _selectedColorIndex = 0; // Para el color seleccionado
  int _quantity = 1; // Cantidad del producto

  // Ejemplo de tallas y colores
  final List<String> _sizes = ['S', 'M', 'L', 'XL'];
  final List<Color> _colors = [
    Color(0xff787676),
    Color(0xff433F40),
    Color(0xff121111),
  ];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final String image = arguments['image'];
    final String title = arguments['title'];
    final String price = arguments['price'];

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 68),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                // Imagen superior
                Stack(
                  children: [
                    SizedBox(
                      height: 392,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Imagen principal
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              alignment: Alignment(0, -0.44),
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(50, 49, 49, 49),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/svg/heart_fill.svg',
                            width: 24,
                            height: 24,
                            color: Color(0xff292526),
                          ),
                          tooltip: 'Favoritos',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(50, 49, 49, 49),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/svg/arrow-left.svg',
                            width: 24,
                            height: 24,
                            color: Color(0xff292526),
                          ),
                          tooltip: 'Regresar',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Contenido debajo de la imagen
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nombre del producto
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff121111),
                                fontFamily: 'Encode',
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Rating y número de reseñas
                            Row(
                              children: [
                                SvgPicture.asset('assets/svg/star.svg'),
                                const SizedBox(width: 8),
                                const Text(
                                  '5.0',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff787676),
                                    fontFamily: 'Encode',
                                  ),
                                ),
                                const SizedBox(width: 4),
                                // Número de reseñas
                                Text(
                                  '(7,932 reviews)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff347EFB),
                                    fontFamily: 'Encode',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            _buildQuantityButton('assets/svg/minus.svg', () {
                              setState(() {
                                if (_quantity > 1) _quantity--;
                              });
                            }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '$_quantity',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Encode',
                                ),
                              ),
                            ),
                            _buildQuantityButton('assets/svg/add.svg', () {
                              setState(() {
                                _quantity++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Descripción
                    SizedBox(
                      width: 256,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes.',

                              style: TextStyle(
                                color: Color(0xff787676),
                                fontFamily: 'Encode',
                              ),
                            ),
                            TextSpan(
                              text: ' Read More...',
                              style: TextStyle(
                                color: Color(0xff121111),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Encode',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: Color(0xffF6F6F6), // Color de la línea
                      thickness: 1, // Grosor de la línea
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Choose Size',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Encode',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(_sizes.length, (index) {
                                final size = _sizes[index];
                                final isSelected = index == _selectedSizeIndex;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 9.5,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Color(0xff292526)
                                              : Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? Color(0xff292526)
                                                : Color(0xffDFDEDE),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? const Color.fromARGB(
                                                    255,
                                                    255,
                                                    255,
                                                    255,
                                                  )
                                                  : Color(0xff292526),
                                          fontSize: 14,
                                          fontFamily: 'Encode',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        // Sección: Color
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Color',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Encode',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(_colors.length, (index) {
                                final color = _colors[index];
                                final isSelected = index == _selectedColorIndex;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedColorIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                      border:
                                          isSelected
                                              ? Border.all(
                                                color: const Color.fromARGB(
                                                  255,
                                                  0,
                                                  119,
                                                  255,
                                                ),
                                                width: 2,
                                              )
                                              : null,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // Botón inferior
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 5, left: 24, right: 24),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Color(0xff292526),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/shopping-cart.svg',
                color: Color(0xffFDFDFD),
              ),
              SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Add to Cart | $price',
                      style: TextStyle(
                        color: Color(0xffFDFDFD),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Encode',
                      ),
                    ),
                    TextSpan(
                      text: ' \$190.99',
                      style: TextStyle(
                        color: Color(0xffFDFDFD),
                        fontSize: 10,
                        fontFamily: 'Encode',
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton(String icon, VoidCallback onPressed) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,

          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffDFDEDE)),
            ),
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
