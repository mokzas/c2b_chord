import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 퀴즈 모드에서 정답을 맞췄을 때 표시되는 작은 오버레이
class QuizCorrectOverlay extends StatefulWidget {
  const QuizCorrectOverlay({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  State<QuizCorrectOverlay> createState() => _QuizCorrectOverlayState();
}

class _QuizCorrectOverlayState extends State<QuizCorrectOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // 0.5초 후 페이드 아웃 후 콜백 호출
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (mounted) {
        await _controller.reverse();
        if (mounted) {
          widget.onNext();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: C2bPadding.extraLarge,
                vertical: C2bPadding.large,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(C2bRadius.large),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 체크 아이콘
                  Icon(
                    Icons.check_circle_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: C2bPadding.small),
                  // "Perfect!" 텍스트
                  Text(
                    'Perfect!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
