import 'package:flutter/material.dart';

class InputCategory extends StatefulWidget {
  final Function(String) setCategory;
  final String? category;
  const InputCategory({super.key, required this.setCategory, required this.category});

  @override
  State<InputCategory> createState() => _InputCategoryState();
}

class _InputCategoryState extends State<InputCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButton(
          value: widget.category,
          hint: const Text("Categoria"),
          items: const [
            DropdownMenuItem(
              value: "casa",
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Casa"),
                ],
              ),
            ),
            DropdownMenuItem(
              value: "trabalho",
              child: Row(
                children: [
                  Icon(Icons.work),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Trabalho"),
                ],
              ),
            ),
            DropdownMenuItem(
              value: "lazer",
              child: Row(
                children: [
                  Icon(Icons.beach_access),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Lazer"),
                ],
              ),
            ),
            DropdownMenuItem(
              value: "outro",
              child: Row(
                children: [
                  Icon(Icons.category_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Outro"),
                ],
              ),
            ),
          ],
          onChanged: (value) {
            widget.setCategory(value!);
          },
        ),
      ],
    );
  }
}
