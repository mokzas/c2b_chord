import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 작은 크기의 Outlined 버튼 위젯
class OutlinedButtonSmall extends StatelessWidget {
  const OutlinedButtonSmall({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.0,
      height: C2bHeight.buttonSmall,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(C2bRadius.full),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(C2bRadius.full),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
