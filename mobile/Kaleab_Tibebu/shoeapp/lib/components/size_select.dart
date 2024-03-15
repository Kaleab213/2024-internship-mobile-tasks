import 'package:flutter/material.dart';

class SelectableContainerRow extends StatefulWidget {
  const SelectableContainerRow({super.key});

  @override
  SelectableContainerRowState createState() => SelectableContainerRowState();
}

class SelectableContainerRowState extends State<SelectableContainerRow> {
  int selectedContainerIndex = -1;

  void handleContainerTap(int index) {
    setState(() {
      if (selectedContainerIndex == index) {
        selectedContainerIndex = -1;
      } else {
        selectedContainerIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(7, (index) {
        return GestureDetector(
          onTap: () => handleContainerTap(index),
          child: Row(
            children: [
              Card(
                elevation: 2,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: selectedContainerIndex == index
                        ? const Color(0xFF3F51F3)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    (38 + index).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(width: 1),
            ],
          ),
        );
      }),
    );
  }
}
