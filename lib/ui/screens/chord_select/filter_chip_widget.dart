import 'package:c2b_chord/ui/theme/tokens.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(C2bRadius.full),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: C2bPadding.small,
          vertical: C2bPadding.extraSmall,
        ),
        constraints: BoxConstraints(
          minWidth: C2bWidth.filterChipMin,
          minHeight: C2bHeight.filterChipMin,
        ),
        decoration: BoxDecoration(
          color:
              isSelected ? colorScheme.secondaryContainer : Colors.transparent,
          border: isSelected ? null : Border.all(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(C2bRadius.full),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[const Icon(Icons.check), wGap4()],
            Text(label, style: musicTextTheme(context).bodyMedium),
          ],
        ),
      ),
    );
  }
}
