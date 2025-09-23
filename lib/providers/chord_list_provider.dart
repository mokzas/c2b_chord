import 'package:c2b_chord/model/chord_list_item_model.dart';
import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/model/filter_list_item_model.dart';
import 'package:c2b_chord/model/quality_model.dart';
import 'package:c2b_chord/providers/filter_map_provider.dart';
import 'package:c2b_chord/providers/quality_provider.dart';
import 'package:c2b_chord/util/music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chord_list_provider.g.dart';

/// 선택가능한 모든 Chord 리스트의 데이터를 관리하는 Provider
@riverpod
class ChordList extends _$ChordList {
  @override
  Future<List<ChordListItemModel>> build() async {
    final qualities = await ref.watch(qualityProvider.future);
    final List<ChordListItemModel> chordList = [];

    // Get the current state to preserve selections
    final currentState = state.valueOrNull;
    final Map<String, bool> selectionMap = {};
    if (currentState != null) {
      for (final item in currentState) {
        selectionMap[item.chord.name] = item.isSelected;
      }
    }

    for (final root in rootNotes) {
      for (final quality in qualities) {
        final qualityName = quality.name;
        final name = root.str + qualityName;
        final nameAlt = quality.aliases.map((alt) => root.str + alt).toList();
        final tones = _buildChordTones(root, quality);

        chordList.add(
          ChordListItemModel(
            chord: ChordModel(
              name: name,
              nameAlt: nameAlt,
              root: root,
              tones: tones,
              qualityName: qualityName,
            ),
            isSelected: selectionMap[name] ?? false, // Preserve selection state
          ),
        );
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
  ///
  /// [notation] 각 Note를 표현하는 방식. 'natural', 'sharp', 'flat'
  Note _getNoteByPitchAndNotation(int pitch, Note root, String notation) {
    // TODO: chord_qualities.json의 notation 데이터 오류 수정
    // 현재 notation 데이터 일부에서 오류 발견되어 notation 데이터를 보완적으로
    // 사용하도록 알고리즘을 작성함.
    //
    // 1. notation이 '#' 또는 'b'인 경우, 이를 따름. 해당하는 Note가 없으면 natural표기를 우선으로 함
    // 2. root의 notation이 '#' 또는 'b'인 경우, 이를 따름. 해당하는 Note가 없으면 natural표기를 우선으로 함
    // 3. 1., 2, 모두 해당하지 않는 경우 우선순위는 natural, flat, sharp.

    final candidates = Note.values.where((note) => note.pitch == pitch);

    if (notation == '#') {
      return candidates.firstWhere(
        (n) => n.notation == Notation.sharp,
        orElse:
            () => candidates.firstWhere(
              (n) => n.notation == Notation.natural,
              orElse: () => candidates.first,
            ),
      );
    } else if (notation == 'b') {
      return candidates.firstWhere(
        (n) => n.notation == Notation.flat,
        orElse:
            () => candidates.firstWhere(
              (n) => n.notation == Notation.natural,
              orElse: () => candidates.first,
            ),
      );
    } else if (root.notation == Notation.sharp) {
      return candidates.firstWhere(
        (n) => n.notation == Notation.sharp,
        orElse:
            () => candidates.firstWhere(
              (n) => n.notation == Notation.natural,
              orElse: () => candidates.first,
            ),
      );
    } else if (root.notation == Notation.flat) {
      return candidates.firstWhere(
        (n) => n.notation == Notation.flat,
        orElse:
            () => candidates.firstWhere(
              (n) => n.notation == Notation.natural,
              orElse: () => candidates.first,
            ),
      );
    } else {
      return candidates.firstWhere(
        (n) => n.notation == Notation.natural,
        orElse:
            () => candidates.firstWhere(
              (n) => n.notation == Notation.flat,
              orElse: () => candidates.first,
            ),
      );
    }
  }

  /// 유저가 선택한 필터 조건에 맞는 코드들의 리스트를 반환하는 함수
  /// 전체 코드 리스트에서 유저가 선택한 필터 조건에 맞는 코드들을 필터링하여 반환
  /// 변수명의 'selected'를 'slctd'로 줄여서 사용.
  ///
  /// [chordList] 전체 코드 리스트
  ///
  /// 반환값: 필터링된 코드 리스트
  ///
  List<ChordListItemModel> getFilteredChords(
    List<ChordListItemModel> chordList,
  ) {
    final Map<String, List<FilterListItemModel>> filterMap = ref.watch(
      filterMapProvider,
    );

    // Group filters by category
    final slctdRootFilters =
        filterMap['Root']
            ?.where((e) => e.isSelected == true)
            .map((e) => e.name)
            .toList() ??
        [];

    final slctdTriadFilters =
        filterMap['Triad']?.where((e) => e.isSelected == true).toList() ?? [];

    final slctd7thFilters =
        filterMap['7th']?.where((e) => e.isSelected == true).toList() ?? [];

    final slctdExtensions =
        filterMap['Extension']?.where((e) => e.isSelected == true).toList() ??
        [];

    final slctdAlterFilters =
        (filterMap['Alter, add']?.where((e) => e.isSelected == true) ?? []).map(
          (e) => e.name,
        );
    final allAlterFilters = filterMap['Alter, add'] ?? [];
    assert(allAlterFilters.isNotEmpty);

    final isSlctdFiltersEmpty =
        slctdTriadFilters.isEmpty &&
        slctd7thFilters.isEmpty &&
        slctdExtensions.isEmpty &&
        slctdAlterFilters.isEmpty;

    // Step 1: Match root
    // 선택된 Root를 갖는 모든 chord를 필터링
    // 선택된 Root filter가 없는 경우 모든 root의 chord를 보여주도록 함.
    final rootMatchChordItems =
        slctdRootFilters.isEmpty
            ? chordList
            : chordList.where((e) {
              return slctdRootFilters.contains(e.chord.root.str);
            });

    // 1. Root 포함 모든 그룹에서 선택된 필터가 없는 경우: 모든 코드를 보여줌
    // 2. Root 그룹에는 선택한 filter가 있는데, 나머지 그룹에서 선택한 filter가
    //    없으면 선택한 root의 모든 chord를 보여주도록 함.
    if (isSlctdFiltersEmpty) return rootMatchChordItems.toList();

    // Step 2: Exact match of root + triad
    // <선택된 root> x <선택된 triad>와 정확히 일치하는 항목
    final triadMatchChordItems = rootMatchChordItems.where((e) {
      final chordName = e.chord.name;
      final root = e.chord.root.str;
      return slctdTriadFilters.any(
        (triadFilter) => chordName == '$root${triadFilter.name}',
      );
    });

    // Step 3-1: Match any 7th or extension
    //
    // 다른 필터에도 포함되는 문자열로 이루어진 필터에 대하여 별도로 'startWith' 검사를 수행하기 위한 정규식
    // '7'의 경우 'M7', 'm7' 등에 모두 포함되기 때문에 '포함하는가'가 아닌 '시작하는가'로 검사해야함.
    // 'M7' 또한 'augM7', 'mM7', 'm7'은 dim7 등에 대하여 동일함
    final extensionPattern = RegExp(r'^(m?|M?)?(6|7|9|11|13)');

    final extensionMatchChordItems = rootMatchChordItems.where((e) {
      final chordQualityName = e.chord.qualityName;
      final match7th = slctd7thFilters.any((seventhFilter) {
        if (extensionPattern.hasMatch(seventhFilter.name)) {
          return chordQualityName.startsWith(seventhFilter.name);
        }
        return chordQualityName.contains(seventhFilter.name);
      });

      // Step 3-2: extension matching
      //
      // 선택된 7th 그룹 필터들 문자열의 '7'을 선택된 각 extension 필터 문자열로 교체 후, 교체된 문자열을 extension 필터링에 사용.
      // ex) 7th 필터 'm7' 선택, extension 필터 '9' 선택시 -> 'm9'으로 extension 필터링 수행.
      // 7th 그룹에서 선택된 필터가 없을 경우, 모든 7th 필터에 대하여 수행
      //
      final extensionBase =
          slctd7thFilters.isEmpty ? (filterMap['7th'] ?? []) : slctd7thFilters;
      assert(extensionBase.isNotEmpty);

      final matchExtension = extensionBase
          .expand((slctd7thFilter) {
            return slctdExtensions.map(
              (extFilter) =>
                  slctd7thFilter.name.replaceAll('7', extFilter.name),
            );
          })
          .any((slctdExt7thFilter) {
            if (extensionPattern.hasMatch(slctdExt7thFilter)) {
              return chordQualityName.startsWith(slctdExt7thFilter);
            }
            return chordQualityName.contains(slctdExt7thFilter);
          });

      return match7th || matchExtension;
    });

    // triadMatchChordItems, extensionMatchChordItems 양쪽 모두에 포함되는 chord는 없어야 한다
    assert(
      !(extensionMatchChordItems.any(
        (c) => triadMatchChordItems
            .map((c) => c.chord.name)
            .toSet()
            .contains(c.chord.name),
      )),
    );

    // Step 4
    final List<ChordListItemModel> triadExtMatchChordItems = [
      ...triadMatchChordItems,
      ...extensionMatchChordItems,
    ];

    // Step 5: Whitelist filtering for Alter, add
    // triadExtMatchChordItems에서 모든 alter 필터 중 단 한 개도 matching되지 않는 chord만 살려줌.
    // alter 필터 중 어떤 것과 matching되는 경우, 그 필터가 slctdAlterFilters에 포함된 필터이면 살려줌.
    //
    // 단, 7th, Extension 그룹 필터들 중 선택된 필터가 한 개도 없는 경우에는,
    // slctdAlterFilters 중 하나라도 matching되는 경우 살려줌.
    final slctdChordItems =
        slctd7thFilters.isEmpty && slctdExtensions.isEmpty
            ? [
              ...triadMatchChordItems,
              ...(rootMatchChordItems.where((item) {
                final chordQualityName = item.chord.qualityName;
                return slctdAlterFilters.any(
                  (alt) => chordQualityName.contains(alt),
                );
              }).toList()),
            ]
            : triadExtMatchChordItems.where((item) {
              final chordQualityName = item.chord.qualityName;
              return allAlterFilters.every((alt) {
                if (chordQualityName.contains(alt.name)) {
                  return slctdAlterFilters.contains(alt.name);
                }
                return true;
              });
            }).toList();

    return slctdChordItems;
  }

  /// chordListItem의 isSelected 값을 변경하는 함수
  void updateSelection(ChordModel chord, bool isSelected) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updatedList =
        current.map((item) {
          if (item.chord.name == chord.name) {
            return item.copyWith(isSelected: isSelected);
          } else {
            return item;
          }
        }).toList();

    state = AsyncData(updatedList);
  }

  /// 모든 chordListItem의 isSelected 값을 일괄 변경하는 함수
  /// 모든 chordListItem마다 updateSelection()을 호출하지 않고 chord list
  /// 전체를 한번에 업데이트
  void updateSelectionAll(bool isSelected) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updatedList =
        current.map((item) {
          return item.copyWith(isSelected: isSelected);
        }).toList();

    state = AsyncData(updatedList);
  }

  /// 필터링된 모든 chordListItem의 isSelected 값을 변경하는 함수
  void updateFilteredSelectionAll(bool isSelected) {
    final current = state.valueOrNull;
    if (current == null) return;

    final Map<String, bool> selectionMap = {};
    for (final item in current) {
      selectionMap[item.chord.name] = item.isSelected;
    }

    final filteredChords = getFilteredChords(current);
    for (final chord in filteredChords) {
      selectionMap[chord.chord.name] = isSelected;
    }

    final updatedList =
        current.map((item) {
          return item.copyWith(
            isSelected: selectionMap[item.chord.name] ?? false,
          );
        }).toList();

    state = AsyncData(updatedList);
  }
}
