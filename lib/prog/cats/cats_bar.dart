import 'package:flutter/material.dart';
import 'cats_button.dart';
import 'cats_bar_state.dart';

class CatsBar extends StatefulWidget {
  final CatsBarState state;
  final Function(String) onCatSelected;

  const CatsBar({super.key, required this.state, required this.onCatSelected});

  @override
  State<CatsBar> createState() => _CatsBarState();
}

class _CatsBarState extends State<CatsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          children: CatsBarState.cats.map((cat) {
            return CatButton(
              title: cat,
              isSelected: cat == widget.state.selectedCat,
              onPressed: () {
                setState(() {
                  widget.state.selectCat(cat);
                  widget.onCatSelected(cat);
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}