import 'package:c2b_chord/model/preset_model.dart';
import 'package:c2b_chord/providers/preset_state_provider.dart';
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
    final folderPath = presetState.folderPath;
    final presets =
        ref.read(presetStateProvider.notifier).getCurrentFolderPresets();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: C2bPadding.largeContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* Preset folder breadcrumb. ex) Preset > User > II-V-I */
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 48.0),
            child: _buildBreadcrumb(folderPath),
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
                    : _buildPresetContent(presets, folderPath),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb(List<String> folderPath) {
    return Row(
      children: [
        // 루트 "Preset" 항목
        GestureDetector(
          onTap: () {
            ref.read(presetStateProvider.notifier).goToRoot();
          },
          child: Text(
            'Preset',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight:
                  folderPath.isEmpty ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        // 폴더 경로의 각 항목들
        ...folderPath.asMap().entries.map((entry) {
          final index = entry.key;
          final folderName = entry.value;
          final isLast = index == folderPath.length - 1;

          return Row(
            children: [
              Text('  >  ', style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onTap: () {
                  ref
                      .read(presetStateProvider.notifier)
                      .navigateToFolder(index);
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
        }),
      ],
    );
  }

  Widget _buildPresetContent(
    List<PresetModel> presets,
    List<String> folderPath,
  ) {
    if (folderPath.isEmpty) {
      // 최상위 폴더 목록 표시
      return ListView.separated(
        itemBuilder: (context, index) {
          final preset = presets[index];
          final folderName = preset.name;
          final presetCount = preset.chordList.length;

          return ListTile(
            leading: Icon(Icons.folder_outlined),
            title: Text(folderName),
            subtitle: Text('$presetCount presets'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ref.read(presetStateProvider.notifier).enterFolder(folderName);
            },
          );
        },
        separatorBuilder:
            (context, index) => Divider(height: C2bHeight.divider),
        itemCount: presets.length,
      );
    } else {
      // 선택된 폴더의 프리셋 목록 표시
      return ListView.separated(
        itemBuilder: (context, index) {
          final preset = presets[index];

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
        itemCount: presets.length,
      );
    }
  }
}
