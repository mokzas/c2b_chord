import 'package:flutter/material.dart';

class NumberSelectorDialog extends StatefulWidget {
  final String title;
  final int initialValue;
  final int minValue;
  final int maxValue;
  final List<int>? values;
  final Function(int) onValueChanged;

  const NumberSelectorDialog({
    super.key,
    required this.title,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    this.values,
    required this.onValueChanged,
  });

  @override
  State<NumberSelectorDialog> createState() => _NumberSelectorDialogState();
}

class _NumberSelectorDialogState extends State<NumberSelectorDialog> {
  final _availableValues = <int>[];
  late final FixedExtentScrollController _scrollController;
  int _selectedValue = 0;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _availableValues.addAll(
      widget.values ??
          List.generate(
            widget.maxValue - widget.minValue + 1,
            (index) => index + widget.minValue,
          ),
    );

    _scrollController = FixedExtentScrollController(initialItem: _availableValues.indexOf(widget.initialValue));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        height: 200,
        width: 100,
        child: ListWheelScrollView.useDelegate(
          controller: _scrollController,
          itemExtent: 50,
          perspective: 0.005,
          diameterRatio: 1.2,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedValue = _availableValues[index];
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: _availableValues.length,
            builder: (context, index) {
              final value = _availableValues[index];
              return Center(
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: value == _selectedValue
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onValueChanged(_selectedValue);
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
