import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
const ListItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        print('tapped');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10)
        ),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://sala-negra.com/wp-content/uploads/2023/02/10_13-ElArranqueWeb.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding( // para fecha
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '01/01/2001 15:00',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding( // para titulo 
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Título del espectáculo',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding( // descripcion breve
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Un espectáculo que no dejará indiferente a nadie, haciendo una hora de espectáculo agradable y desternillante. ¡No te lo puedes perder!',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}