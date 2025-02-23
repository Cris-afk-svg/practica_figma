import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practica_figma/views/custom_navbar.dart';
import 'package:practica_figma/views/item_category.dart';
import 'package:practica_figma/views/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            //Presentación del Cliente
            const SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Welcome 👋',
                          style: TextStyle(
                            color: Color(0xFF787676),
                            fontFamily: 'Encode',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Albert Stevano',
                          style: TextStyle(
                            color: Color(0xFF121111),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Encode',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a/ACg8ocK4jeHz5qptwBYF3OdBgSeLVJWtZkzivsVOOoSU63FCJGj3qDA=s288-c-no',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Separador
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            //Buscador y Filtro
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 8, 8, 8),
                      decoration: InputDecoration(
                        hintText: 'Search clothes...',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ), //Change this value to custom as you like
                        isDense: true,
                        hintStyle: const TextStyle(
                          color: Color(0xFFCAC9C9),
                          fontFamily: 'Encode',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          child: SvgPicture.asset(
                            'assets/svg/search.svg',
                            color: Color(0xFFCAC9C9),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCAC9C9)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 114, 114),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFF292526),
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/filter.svg',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            //Separador
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            //Categorias
            SliverToBoxAdapter(child: ItemCategory()),
            //Separador
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            //Productos
            SliverToBoxAdapter(child: ProductGrid()),
          ],
        ),
        //Barra De Navegacion
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44),
              topRight: Radius.circular(44),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              color: Color(0xff292526),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(197, 255, 255, 255),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
            child: CustomNavBar(),
          ),
        ),
      ),
    );
  }
}
