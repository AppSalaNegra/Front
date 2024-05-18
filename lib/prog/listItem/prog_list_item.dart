import 'package:flutter/material.dart';
import 'package:sala_negra/prog/listItem/fav_button.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'prog_list_item_state.dart';
import 'package:intl/intl.dart';

class ProgListItem extends StatefulWidget {

  final ProgListItemState state;

  const ProgListItem({
    super.key,
    required this.state,
  });
  
  @override
  State<ProgListItem> createState() => _ProgListItemState();
}


class _ProgListItemState extends State<ProgListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      onDoubleTap: (){

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
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
              height: 370,
              child: Image.network(
                widget.state.event.thumbnailUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded.toDouble() / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );             
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace){
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Color.fromARGB(255, 2, 2, 2),
                        size: 64.0,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Error al cargar la imagen',
                        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  );
                }, 
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          DateFormat('dd/MM/yyyy HH:mm').format(widget.state.event.startDateTime),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 10),
                        child: Text(
                          widget.state.event.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                FavButton(
                  isLiked: widget.state.isLiked, 
                  onPressed: (){
                    setState((){
                      widget.state.toggleLike();
                    });
                  }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}