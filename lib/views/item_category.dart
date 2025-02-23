import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practica_figma/utils/clase_categoria.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({super.key});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  int _categoriaSeleccionada = 0;
  //final List categorias = ['All Items', 'Dress', 'T-shirt', 'Jeans'];
  final List<Categoria> categorias = [
    Categoria(nombre: 'All Items', svgAsset: 'category.svg'),
    Categoria(nombre: 'Dress', svgAsset: 'dress.svg'),
    Categoria(nombre: 'T-shirt', svgAsset: 'tshirt.svg'),
    Categoria(nombre: 'Jeans', svgAsset: 'jeans.svg'),
    Categoria(nombre: 'Jeans', svgAsset: 'jeans.svg'),
    Categoria(nombre: 'Jeans', svgAsset: 'jeans.svg'),
    Categoria(nombre: 'Jeans', svgAsset: 'jeans.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.builder(
        itemCount: categorias.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final categoria = categorias[index];
          return Padding(
            padding: EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _categoriaSeleccionada = index;
                });
              },

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(
                  color:
                      _categoriaSeleccionada == index
                          ? Color(0xff292526)
                          : Color(0xffDFDEDE),
                  width: 1,
                ),
                backgroundColor:
                    _categoriaSeleccionada == index
                        ? Color(0xff292526)
                        : Colors.white,
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 12,
                  right: 12,
                ),
                elevation: 0,
                foregroundColor: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/${categoria.svgAsset}',
                    color:
                        _categoriaSeleccionada == index
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(width: 4),
                  Text(
                    categoria.nombre,
                    style: TextStyle(
                      fontFamily: 'Encode',
                      fontSize: 12,
                      color:
                          _categoriaSeleccionada == index
                              ? Colors.white
                              : Color(0xff292526),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
