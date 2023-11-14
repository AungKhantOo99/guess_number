import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final List<String> myArray;

  const TableWidget(this.myArray, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      children: List.generate(
        (myArray.length / 5).ceil(),
        (rowIndex) => TableRow(
          children: List.generate(
            5,
            (colIndex) {
              final index = rowIndex * 5 + colIndex;
              return TableCell(

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: index < myArray.length
                      ? Center(
                          child: Text(
                            myArray[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w700),
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
