import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  final bool isLiked;
  final Function onPressed;

  const FavButton({
    super.key,
    required this.isLiked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 7),
      child: IconButton(
        icon: Icon(
          isLiked ? Icons.star : Icons.star_border,
          color: isLiked ? Colors.black : Colors.black,
          shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 20.0, offset: Offset(5, 5))],
        ),
          onPressed: onPressed as void Function()?,
        iconSize: 55,
      ),
    );
  }
}