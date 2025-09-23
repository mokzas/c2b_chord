import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 재생 컨트롤 버튼 위젯
///
/// [icon] 버튼에 표시할 아이콘
/// [onPressed] 버튼 클릭 시 실행될 콜백 함수
/// [isActive] 버튼이 활성 상태인지 여부 (색상 변경용)
/// [isEnabled] 버튼이 비활성화되어야 하는지 여부
class QuizControlButtonWidget extends StatelessWidget {
  const QuizControlButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
    this.isEnabled = true,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color:
            isEnabled
                ? (isActive
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondaryContainer)
                : (isActive
                    ? theme.colorScheme.primary.withValues(alpha: 0.5)
                    : theme.colorScheme.secondaryContainer.withValues(
                      alpha: 0.5,
                    )),
        borderRadius: BorderRadius.circular(C2bRadius.extraSmall),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        icon: Icon(
          icon,
          color:
              isEnabled
                  ? (isActive
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSecondaryContainer)
                  : (isActive
                      ? theme.colorScheme.onPrimary.withValues(alpha: 0.5)
                      : theme.colorScheme.onSecondaryContainer.withValues(
                        alpha: 0.5,
                      )),
        ),
        onPressed: isEnabled ? onPressed : null,
      ),
    );
  }
}
