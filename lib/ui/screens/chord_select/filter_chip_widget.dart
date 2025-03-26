import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';

/// Filter 리스트 아이템을 위한 위젯. Selectable Chip.
/// Material3 Design을 참고함.
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        constraints: BoxConstraints(maxHeight: 48.0, minWidth: 44.0),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.secondaryContainer : Colors.transparent,
          border: isSelected ? null : Border.all(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(RadiusValue.full),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(Icons.check),
              wGap4(),
            ],
            Text(
              label,
              style: musicTextTheme(context).bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
