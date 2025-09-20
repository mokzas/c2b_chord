import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 프리셋 탭 영역
class PresetTabArea extends StatefulWidget {
  const PresetTabArea({super.key});

  @override
  State<PresetTabArea> createState() => _PresetTabAreaState();
}

class _PresetTabAreaState extends State<PresetTabArea> {
  String? _selectedPresetFolder;

  final Map<String, List<String>> _samplePresetFolder = {
    'User': ['U1', 'U2', 'U3'],
    'Major Diatonic': ['C Major Scale', 'D Major Scale', 'E♭ Major Scale'],
    'minor Diatonic': ['C minor Scale', 'D minor Scale', 'E♭ minor Scale'],
    'Ionian': ['C Ionian', 'D Ionian', 'E♭ Ionian'],
    'Dorian': ['C Dorian', 'D Dorian', 'E♭ Dorian'],
    'Phrygian': ['C Phrygian', 'D Phrygian', 'E♭ Phrygian'],
    'Lydian': ['C Lydian', 'D Lydian', 'E♭ Lydian'],
    'Mixolydian': ['C Mixolydian', 'D Mixolydian', 'E♭ Mixolydian'],
    'Aeolian': ['C Aeolian', 'D Aeolian', 'E♭ Aeolian'],
    'Locrian': ['C Locrian', 'D Locrian', 'E♭ Locrian'],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: C2bPadding.largeContainer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /* Preset folder breadcrumb. ex) Preset > User > II-V-I */
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedPresetFolder == null
                        ? 'Preset'
                        : 'Preset  >  $_selectedPresetFolder',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Visibility(
                    visible: _selectedPresetFolder != null,
                    child: GestureDetector(
                      onTap:
                          _selectedPresetFolder == null
                              ? null
                              : () {
                                setState(() {
                                  _selectedPresetFolder = null;
                                });
                              },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
            hGap4(),
            /* Preset 폴더 및 프리셋 리스트 영역 */
            Expanded(
              child:
                  _selectedPresetFolder == null
                      ? ListView.separated(
                        itemBuilder:
                            (context, index) => ListTile(
                              leading: Icon(Icons.folder_outlined),
                              title: Text(
                                _samplePresetFolder.keys.elementAt(index),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                setState(() {
                                  _selectedPresetFolder = _samplePresetFolder
                                      .keys
                                      .elementAt(index);
                                });
                              },
                            ),
                        separatorBuilder:
                            (context, index) =>
                                Divider(height: C2bHeight.divider),
                        itemCount: _samplePresetFolder.length,
                      )
                      : ListView.separated(
                        itemBuilder:
                            (context, index) => ListTile(
                              leading: Icon(Icons.bookmark_outline),
                              title: Text(
                                _samplePresetFolder[_selectedPresetFolder]![index],
                                style: musicTextTheme(context).titleMedium,
                              ),
                              trailing: Icon(Icons.circle_outlined),
                              onTap: () {},
                            ),
                        separatorBuilder:
                            (context, index) =>
                                Divider(height: C2bHeight.divider),
                        itemCount:
                            _samplePresetFolder[_selectedPresetFolder]!.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
