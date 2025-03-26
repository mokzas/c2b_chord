import 'package:c2b/model/chord_list_item_model.dart';
import 'package:c2b/model/chord_model.dart';
import 'package:c2b/model/quality_model.dart';
import 'package:c2b/providers/quality_provider.dart';
import 'package:c2b/util/music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chord_list_provider.g.dart';

/// 선택가능한 모든 Chord 리스트의 데이터를 관리하는 Provider
@riverpod
class ChordList extends _$ChordList {
  @override
  Future<List<ChordListItemModel>> build() async {
    final qualities = await ref.watch(qualityProvider.future);
    final List<ChordListItemModel> chordList = [];

    for (final root in rootNotes) {
      for (final quality in qualities) {
        final name = root.str + quality.name;
        final nameAlt = quality.aliases.map((alt) => root.str + alt).toList();
        final tones = _buildChordTones(root, quality);

        chordList.add(ChordListItemModel(
          chord: ChordModel(
            name: name,
            nameAlt: nameAlt,
            root: root,
            tones: tones,
          ),
          isSelected: false,
        ));
      }
    }

    return chordList;
  }

  /// Chord의 root, quality 정보를 사용하여 chord의 구성음을 구하고
  /// 각 구성음에 알맞은 Note 객체로 구성된 List를 반환하는 함수
  List<Note> _buildChordTones(Note root, QualityModel quality) {
    return List.generate(quality.intervals.length, (i) {
      final pitch = (root.pitch + quality.intervals[i]) % 12;
      final notation = quality.notation[i];
      return _getNoteByPitchAndNotation(pitch, root, notation);
    });
  }

  /// pitch, chord의 root, notation 매뉴얼을 참조하여
  /// natural표기/#표기/b표기 중 한 방식을 결정. 해당 pitch를 갖는 Note 중
  /// 결정한 방식에 맞는 Note를 반환하는 함수
  Note _getNoteByPitchAndNotation(int pitch, Note root, String notation) {
    // chord_qualities.json의 notation 데이터는 개선이 필요한 것으로 확인.
    // 아래는 notation 데이터를 보완적으로 사용하는 알고리즘
    //
    // 1. notation이 '#' 또는 'b'인 경우, 이를 따름. 해당하는 Note가 없으면 natural표기를 우선으로 함
    // 2. root의 notation이 '#' 또는 'b'인 경우, 이를 따름. 해당하는 Note가 없으면 natural표기를 우선으로 함
    // 3. 1., 2, 모두 해당하지 않는 경우 우선순위는 natural, flat, sharp.

    final candidates = Note.values.where((note) => note.pitch == pitch);

    if (notation == '#') {
      return candidates.firstWhere((n) => n.notation == Notation.sharp,
          orElse: () =>
              candidates.firstWhere(
                      (n) => n.notation == Notation.natural,
                  orElse: () => candidates.first));
    } else if (notation == 'b') {
      return candidates.firstWhere((n) => n.notation == Notation.flat,
          orElse: () =>
              candidates.firstWhere(
                      (n) => n.notation == Notation.natural,
                  orElse: () => candidates.first));
    } else if (root.notation == Notation.sharp) {
      return candidates.firstWhere((n) => n.notation == Notation.sharp,
          orElse: () =>
              candidates.firstWhere(
                      (n) => n.notation == Notation.natural,
                  orElse: () => candidates.first));
    } else if (root.notation == Notation.flat) {
      return candidates.firstWhere((n) => n.notation == Notation.flat,
          orElse: () =>
              candidates.firstWhere(
                      (n) => n.notation == Notation.natural,
                  orElse: () => candidates.first));
    } else {
      return candidates.firstWhere((n) => n.notation == Notation.natural,
          orElse: () =>
              candidates.firstWhere(
                      (n) => n.notation == Notation.flat,
                  orElse: () => candidates.first));
    }
  }

  /// 각 ChordLitsItem의 선택 여부를 업데이트하는 함수
  void updateSelection(ChordModel chord, bool isSelected) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updatedList = current.map((item) {
      if (item.chord.name == chord.name) {
        return item.copyWith(isSelected: isSelected);
      } else {
        return item;
      }
    }).toList();

    state = AsyncData(updatedList);
  }
}
