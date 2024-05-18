import 'package:flutter/material.dart';
import 'package:sala_negra/prog/listItem/fav_button.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'prog_list_item_state.dart';

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
              height: 370, // Altura deseada para la imagen
              child: Image.network(
                widget.state.event.thumbnailUrl,
                fit: BoxFit.cover,
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
                          widget.state.event.startDateTime.toString(),
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