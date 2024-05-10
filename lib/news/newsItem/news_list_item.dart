import 'package:flutter/material.dart';
import 'package:sala_negra/prog/listItem/fav_button.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class NewsListItem extends StatelessWidget {
  
  const NewsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 370, // Altura deseada para la imagen
              child: Image.network(
                'https://sala-negra.com/wp-content/uploads/2021/10/Generico-EncuentrosEscena-web_.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
                        child: Text(
                          'Título de la Noticia',
                          style: AppFonts.newsItemTitle
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}