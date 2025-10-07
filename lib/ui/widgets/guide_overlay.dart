import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 가이드 오버레이 위젯
class GuideOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget description;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onDontShowAgain;
  final bool isVisible;

  const GuideOverlay({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onDontShowAgain,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isVisible)
          Container(
            color: Colors.black.withValues(alpha: 0.7),
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: C2bPadding.longSide * 5,
                  vertical: C2bPadding.longSide,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: C2bPadding.longSide * 1.5,
                  vertical: C2bPadding.longSide,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(C2bRadius.large),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    hGap16(),
                    Center(child: description),
                    hGap24(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: onDontShowAgain,
                          child: Text("Don't show again"),
                        ),
                        ElevatedButton(
                          onPressed: onButtonPressed,
                          child: Text(buttonText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
