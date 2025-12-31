import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/controller.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.controller});
  final ProductsController controller;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller.searchTextFieldController,
              decoration: InputDecoration(
                labelText: 'Input product name...',
                hint: null,
                label: null,
                suffixIcon: const Icon(Icons.search),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Obx(
            () => SizedBox(
              width: 100,
              child: DropdownMenu<String>(
                dropdownMenuEntries: widget.controller.categories
                    .map(
                      (String cat) => DropdownMenuEntry(value: cat, label: cat),
                    )
                    .toList(),
                onSelected: (String? value) {
                  if (value != null) {
                    widget.controller.changeCat(value);
                  }
                },
                menuHeight: null,
                initialSelection: widget.controller.selectedCat.value,
                inputDecorationTheme: InputDecorationTheme(
                  constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
