import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Lista de ejemplo con productos en el carrito
  final List<CheckoutItem> _items = [
    CheckoutItem(
      image: 'assets/images/p1.png',
      title: 'Modern light clothes',
      subTitle: 'Dress modern',
      price: 212.99,
      quantity: 4,
    ),
    CheckoutItem(
      image: 'assets/images/p2.png',
      title: 'Modern light clothes',
      subTitle: 'Dress modern',
      price: 162.99,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: null,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Color(0Xff121111),
            fontWeight: FontWeight.w600,
            fontFamily: 'Encode',
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xffDFDEDE)),
              color: Colors.white,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/svg/arrow-left.svg',
                color: Color(0xff292526),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffDFDEDE)),
                color: Colors.white,
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/svg/menu.svg',
                  color: Color(0xff292526),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de productos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return _buildCheckoutItem(_items[index], index);
              },
            ),
            const SizedBox(height: 24),

            // Shipping Information
            const Text(
              'Shipping Information',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Encode',
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/card.png', fit: BoxFit.cover),
                      SizedBox(width: 12),
                      Text('**** **** **** 2143'),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svg/arrow-down.svg',
                    height: 20,
                    width: 20,
                    color: Color(0xff292526),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Resumen de costos
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total (9 Items)',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Encode',
                      ),
                    ),
                    Text(
                      '\$1,014.95',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Encode',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Fee',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Encode',
                      ),
                    ),
                    Text(
                      '\$0.00',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Encode',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discunt',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Encode',
                      ),
                    ),
                    Text(
                      '\$0.00',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Encode',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              color: Color(0xffF2F2F2), // Color de la línea
              thickness: 1, // Grosor de la línea
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Encode',
                  ),
                ),
                Text(
                  '\$1,014.95',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Encode',
                  ),
                ),
              ],
            ), // Espacio para el botón inferior
          ],
        ),
      ),

      // Botón "Pay"
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 5, left: 24, right: 24),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Color(0xff292526),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            textAlign: TextAlign.center,
            'Pay',
            style: TextStyle(
              color: Color(0xffFDFDFD),
              fontWeight: FontWeight.bold,
              fontFamily: 'Encode',
            ),
          ),
        ),
      ),
    );
  }

  // Construye cada item del checkout (imagen, nombre, precio, cantidad)
  Widget _buildCheckoutItem(CheckoutItem item, int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 24, top: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffF6F6F6))),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    item.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -0.84),
                  ),
                ),
                const SizedBox(width: 15),

                // Título, subtítulo, precio
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Encode',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.subTitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Encode',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // Selector de cantidad
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svg/menu1.svg',
                  height: 24,
                  width: 24,
                  color: Color(0xff292526),
                ),
                SizedBox(height: 29),
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: 'assets/svg/minus.svg',
                      onTap: () {
                        setState(() {
                          if (item.quantity > 1) {
                            item.quantity--;
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 9),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Encode',
                      ),
                    ),
                    const SizedBox(width: 9),

                    _buildQuantityButton(
                      icon: 'assets/svg/add.svg',
                      onTap: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Botón para modificar la cantidad (+/-)
  Widget _buildQuantityButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffDFDEDE)),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(icon, color: Color(0xff292526)),
            ),
          ),
        ),
      ),
    );
  }
}

// Modelo de datos para cada producto en el checkout
class CheckoutItem {
  final String image;
  final String title;
  final String subTitle;
  final double price;
  int quantity;

  CheckoutItem({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.quantity,
  });
}
