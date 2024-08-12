import 'package:flutter/material.dart';
import 'package:themoviedb_dev/helpers/app_colors.dart';

class DropdownSelectionOptions extends StatefulWidget {
  const DropdownSelectionOptions({super.key, required this.options});

  final List<String> options;

  @override
  State<DropdownSelectionOptions> createState() =>
      _DropdownSelectionOptionsState();
}

class _DropdownSelectionOptionsState extends State<DropdownSelectionOptions> {
  late String value;

  @override
  void initState() {
    super.initState();
    value = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          color: AppColors.selectorTitleBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        isDense: true,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        dropdownColor: AppColors.selectorTitleBackgroundColor,
        style: TextStyle(
          color: AppColors.selectorTitleColor,
          fontSize: 14,
        ),
        value: value,
        items: widget.options.map((String elementValue) {
          return DropdownMenuItem<String>(
            value: elementValue,
            child: _DropdownElementWidget(
              elementValue: elementValue,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            setState(() {
              value = newValue;
            });
          }
        },
      ),
    );
  }
}

class _DropdownElementWidget extends StatelessWidget {
  final String elementValue;
  const _DropdownElementWidget({required this.elementValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      elementValue,
      style: TextStyle(
        color: AppColors.selectorTitleColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
