import 'package:c2b_chord/model/preset_model.dart';
import 'package:c2b_chord/providers/preset_state_provider.dart';
import 'package:c2b_chord/repository/preset_repository.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 프리셋 탭 영역
class PresetTabArea extends ConsumerStatefulWidget {
  const PresetTabArea({super.key});

  @override
  ConsumerState<PresetTabArea> createState() => _PresetTabAreaState();
}

class _PresetTabAreaState extends ConsumerState<PresetTabArea> {
  List<String> _folderPath = []; // 폴더 경로를 리스트로 추적

  // final Map<String, List<String>> _samplePresetFolder = {
  //   'User': ['U1', 'U2', 'U3'],
  //   'Major Diatonic': ['C Major Scale', 'D Major Scale', 'E♭ Major Scale'],
  //   'minor Diatonic': ['C minor Scale', 'D minor Scale', 'E♭ minor Scale'],
  //   'Ionian': ['C Ionian', 'D Ionian', 'E♭ Ionian'],
  //   'Dorian': ['C Dorian', 'D Dorian', 'E♭ Dorian'],
  //   'Phrygian': ['C Phrygian', 'D Phrygian', 'E♭ Phrygian'],
  //   'Lydian': ['C Lydian', 'D Lydian', 'E♭ Lydian'],
  //   'Mixolydian': ['C Mixolydian', 'D Mixolydian', 'E♭ Mixolydian'],
  //   'Aeolian': ['C Aeolian', 'D Aeolian', 'E♭ Aeolian'],
  //   'Locrian': ['C Locrian', 'D Locrian', 'E♭ Locrian'],
  // };

  @override
  Widget build(BuildContext context) {
    final presetState = ref.watch(presetStateProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: C2bPadding.largeContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* Preset folder breadcrumb. ex) Preset > User > II-V-I */
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 48.0),
            child: _buildBreadcrumb(),
          ),
          hGap4(),
          /* Preset 폴더 및 프리셋 리스트 영역 */
          Expanded(
            child:
                presetState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : presetState.error != null
                    ? Center(
                      child: Text(
                        'Error loading presets: ${presetState.error}',
                      ),
                    )
                    : _buildPresetContent(presetState.presets),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        // 루트 "Preset" 항목
        GestureDetector(
          onTap: () {
            setState(() {
              _folderPath.clear();
            });
          },
          child: Text(
            'Preset',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight:
                  _folderPath.isEmpty ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        // 폴더 경로의 각 항목들
        ..._folderPath.asMap().entries.map((entry) {
          final index = entry.key;
          final folderName = entry.value;
          final isLast = index == _folderPath.length - 1;

          return Row(
            children: [
              Text('  >  ', style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _folderPath = _folderPath.take(index + 1).toList();
                  });
                },
                child: Text(
                  folderName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildPresetContent(List<PresetModel> presets) {
    // 프리셋을 폴더별로 그룹화
    final Map<String, List<PresetModel>> groupedPresets = {};

    for (final preset in presets) {
      final folderName = _getFolderName(preset.path);
      groupedPresets.putIfAbsent(folderName, () => []).add(preset);
    }

    if (_folderPath.isEmpty) {
      // 최상위 폴더 목록 표시
      return ListView.separated(
        itemBuilder: (context, index) {
          final folderName = groupedPresets.keys.elementAt(index);
          final presetCount = groupedPresets[folderName]!.length;

          return ListTile(
            leading: Icon(Icons.folder_outlined),
            title: Text(folderName),
            subtitle: Text('$presetCount presets'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              setState(() {
                _folderPath.add(folderName);
              });
            },
          );
        },
        separatorBuilder:
            (context, index) => Divider(height: C2bHeight.divider),
        itemCount: groupedPresets.length,
      );
    } else {
      // 선택된 폴더의 프리셋 목록 표시
      final currentFolder = _folderPath.last;
      final folderPresets = groupedPresets[currentFolder] ?? [];

      return ListView.separated(
        itemBuilder: (context, index) {
          final preset = folderPresets[index];

          return ListTile(
            leading: Icon(Icons.bookmark_outline),
            title: Text(
              preset.name,
              style: musicTextTheme(context).titleMedium,
            ),
            subtitle: Text('${preset.chordList.length} chords'),
            trailing: Icon(Icons.circle_outlined),
            onTap: () {
              // TODO: 프리셋 적용 기능
            },
          );
        },
        separatorBuilder:
            (context, index) => Divider(height: C2bHeight.divider),
        itemCount: folderPresets.length,
      );
    }
  }

  String _getFolderName(String path) {
    // path에서 폴더명 추출
    // 예: "builtin/major_diatonic" -> "Major Diatonic"
    // 예: "User" -> "User"
    // 예: "builtin" -> "Builtin"

    if (path.isEmpty) {
      return 'Unknown';
    }

    final parts = path.split('/');

    if (parts.length == 1) {
      // 단일 폴더명인 경우 (예: "User", "builtin")
      if (parts[0] == PresetRepository.userPresetPath) {
        return PresetRepository.userPresetPath;
      }
      return parts[0]
          .split('_')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    } else if (parts.length >= 2) {
      // 중첩된 폴더인 경우 (예: "builtin/major_diatonic")
      // 두 번째 부분을 폴더명으로 사용 (예: "major_diatonic" -> "Major Diatonic")
      final subFolder = parts[1];
      return subFolder
          .split('_')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    }

    return 'Unknown';
  }
}
