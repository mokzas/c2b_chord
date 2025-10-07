import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Play Screen 가이드 관련 헬퍼 메서드 모음
class PlayScreenGuide {
  /// Play Screen 초기 가이드 설명
  static Widget buildPlayScreenGuideDescription(BuildContext context) {
    return _buildGuideDescription(
      context,
      items: [
        _GuideItemData(Icons.abc, 'Display/hide chord tones'),
        _GuideItemData(Icons.piano, 'Switch to chord tone quiz'),
        _GuideItemData(Icons.repeat_rounded, 'Repeat displayed chords'),
        _GuideItemData(Icons.shuffle, 'Regenerate displayed chords'),
      ],
    );
  }

  /// Quiz Mode 가이드 설명
  static Widget buildQuizModeGuideDescription(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );

    return _buildGuideDescription(
      context,
      items: [_GuideItemData(Icons.piano, 'Press keys to select notes')],
      customWidgets: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNoteExample(context, isMatching: false),
            SizedBox(width: 6),
            _buildNoteExample(context, isMatching: true),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                'Matching notes have different color',
                style: textStyle,
              ),
            ),
          ],
        ),
        _buildGuideItem(
          context,
          Icons.refresh,
          'Reset selected keys',
          textStyle,
        ),
        _buildGuideItem(
          context,
          Icons.skip_next,
          'Move to next chord',
          textStyle,
        ),
      ],
    );
  }

  /// 가이드 설명 위젯 빌더 (공통)
  static Widget _buildGuideDescription(
    BuildContext context, {
    List<_GuideItemData> items = const [],
    List<Widget> customWidgets = const [],
  }) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );

    final children = <Widget>[];

    // 기본 아이템들 추가
    for (int i = 0; i < items.length; i++) {
      if (i > 0) children.add(hGap8());
      children.add(
        _buildGuideItem(context, items[i].icon, items[i].text, textStyle),
      );
    }

    // 커스텀 위젯들 추가
    for (final widget in customWidgets) {
      if (children.isNotEmpty) children.add(hGap8());
      children.add(widget);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  /// 가이드 아이템 빌더 (아이콘 + 텍스트)
  static Widget _buildGuideItem(
    BuildContext context,
    IconData icon,
    String text,
    TextStyle? textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        SizedBox(width: 8),
        Flexible(child: Text(text, style: textStyle)),
      ],
    );
  }

  /// Selected note UI 예시 (가이드용)
  static Widget _buildNoteExample(
    BuildContext context, {
    required bool isMatching,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color:
            isMatching
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(C2bRadius.small),
        border:
            isMatching
                ? null
                : Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                  width: 1,
                ),
      ),
      child: Text(
        'C',
        style: musicTextTheme(context).labelSmall?.copyWith(
          color:
              isMatching
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

/// 가이드 아이템 데이터 (아이콘 + 텍스트)
class _GuideItemData {
  final IconData icon;
  final String text;

  const _GuideItemData(this.icon, this.text);
}
