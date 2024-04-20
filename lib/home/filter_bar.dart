import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
const FilterBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ButtonBar(
        children: [
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Todos',
              style: Theme.of(context).textTheme.displaySmall,
            ),

          ),
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Familiares',
              style: Theme.of(context).textTheme.displaySmall,
              ),
          ),
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Canalla',
              style: Theme.of(context).textTheme.displaySmall
            ),
          ),
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Teatro',
              style: Theme.of(context).textTheme.displaySmall
              ),
          ),
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Poesía',
              style: Theme.of(context).textTheme.displaySmall
              ),
          ),
          TextButton(
            onPressed: () {
              // Acción al presionar el botón
            },
            child: Text(
              'Magia',
              style: Theme.of(context).textTheme.displaySmall
              ),
          ),
          TextButton(
            onPressed: () {
              // Acción al presionar el botón
            },
            child: Text(
              'Música',
              style: Theme.of(context).textTheme.displaySmall
              ),
          ),          ],
      ),
    );
  }
}