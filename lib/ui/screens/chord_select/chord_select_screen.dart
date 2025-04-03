import 'package:c2b/routing/routes.dart';
import 'package:c2b/providers/chord_list_provider.dart';
import 'package:c2b/ui/screens/chord_select/chord_list_area.dart';
import 'package:c2b/ui/screens/chord_select/selected_chords_area.dart';
import 'package:c2b/ui/screens/chord_select/selected_filters_horizontal_area.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 연습할 Chord를 선택하는 화면
class ChordSelectScreen extends ConsumerStatefulWidget {
  const ChordSelectScreen({super.key});

  static const name = 'chord_select';

  @override
  ConsumerState<ChordSelectScreen> createState() => _ChordSelectScreenState();
}

enum SelectType {
  select,
  preset,
}

class _ChordSelectScreenState extends ConsumerState<ChordSelectScreen> {
  bool _topCheckBoxState = false;
  SelectType _selectType = SelectType.select;
  String? _selectedPresetCategory;

  NavigationRail _chordSelectTypeRail() => NavigationRail(
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.check),
            label: Text('Select'),
          ),
          // NavigationRailDestination(
          //   icon: Icon(Icons.bookmark_outline),
          //   label: Text('Preset'),
          // ),
        ],
        selectedIndex: _selectType.index,
        onDestinationSelected: (index) {
          setState(() {
            _selectType = SelectType.values[index];
          });
        },
        labelType: NavigationRailLabelType.all,
        groupAlignment: 0.0,
      );

  final Map<String, List<String>> _samplePresetCategory = {
    'User': ['U1', 'U2', 'U3'],
    '* Diatonic': [
      'C Major Scale',
      'C Minor Scale',
      'D Major Scale',
      'D Minor Scale',
      'E♭ Major Scale',
      'E♭ Minor Scale',
    ],
    '* Song': [],
    '* Jazz Standards': [],
    '* Rock': [],
    '* Swing': [],
    '* Latin': [],
  };

  Widget _spontaneousChordSelectWidget() => Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /* 선택된 Filter 보여주는 section */
              SelectedFiltersHorizontalArea(),
              /* "Chords" (제목) */
              ListTile(
                contentPadding: EdgeInsets.only(right: 24.0),
                title: Text(
                  'Chords',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Checkbox(
                  value: _topCheckBoxState,
                  onChanged: (value) {
                    setState(() {
                      _topCheckBoxState = value ?? false;
                    });

                    ref
                        .read(chordListProvider.notifier)
                        .updateFilteredSelectionAll(_topCheckBoxState);
                  },
                ),
              ),
              Divider(height: 1.0),
              /* 선택 가능한 Chord 리스트 */
              Expanded(
                child: ChordListArea(),
              ),
            ],
          ),
        ),
      );

  Widget _presetChordSelectedWidget() => Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedPresetCategory == null
                          ? 'Preset'
                          : 'Preset  >  $_selectedPresetCategory',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Visibility(
                      visible: _selectedPresetCategory != null,
                      child: GestureDetector(
                        onTap: _selectedPresetCategory == null
                            ? null
                            : () {
                                setState(() {
                                  _selectedPresetCategory = null;
                                });
                              },
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
              ),
              hGap4(),
              Expanded(
                child: _selectedPresetCategory == null
                    ? ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          leading: Icon(Icons.folder_outlined),
                          title:
                              Text(_samplePresetCategory.keys.elementAt(index)),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            setState(() {
                              _selectedPresetCategory =
                                  _samplePresetCategory.keys.elementAt(index);
                            });
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            Divider(height: 1.0),
                        itemCount: _samplePresetCategory.length,
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          leading: Icon(Icons.bookmark_outline),
                          title: Text(
                            _samplePresetCategory[_selectedPresetCategory]![
                                index],
                            style: musicTextTheme(context).titleMedium,
                          ),
                          trailing: Icon(Icons.circle_outlined),
                          onTap: () {},
                        ),
                        separatorBuilder: (context, index) =>
                            Divider(height: 1.0),
                        itemCount:
                            _samplePresetCategory[_selectedPresetCategory]!
                                .length,
                      ),
              ),
            ],
          ),
        ),
      );

  Widget _selectedChordWidget() => Container(
        width: 260.0,
        padding: EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SelectedChordsArea(),
            ),
            hGap16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(RadiusValue.full),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => ref
                          .read(chordListProvider.notifier)
                          .updateSelectionAll(false),
                      borderRadius: BorderRadius.circular(RadiusValue.full),
                      child: Center(
                        child: Text(
                          'Clear',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 96.0,
                  height: 40.0,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(RadiusValue.full),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => context.push(Routes.play),
                      borderRadius: BorderRadius.circular(RadiusValue.full),
                      child: Center(
                        child: Text(
                          'Start',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  void initState() {
    // 가로모드 고정
    SystemChrome.setPreferredOrientations([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: GridMargin.longSide,
            // horizontal: GridMargin.shortSide,
          ),
          child: OrientationBuilder(builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _chordSelectTypeRail(),
                          Expanded(
                            child: _selectType == SelectType.select
                                ? _spontaneousChordSelectWidget()
                                : _presetChordSelectedWidget(),
                          ),
                          _selectedChordWidget(),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          context.push(Routes.home);
                        },
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
