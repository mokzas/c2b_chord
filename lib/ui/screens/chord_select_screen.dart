import 'package:c2b/routing/routes.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:c2b/ui/view_models/chord_select_view_model.dart';
import 'package:c2b/ui/widget/chord_list_widget.dart';
import 'package:c2b/ui/widget/selected_chords_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ChordSelectScreen extends StatefulWidget {
  const ChordSelectScreen({
    super.key,
    required this.viewModel,
  });

  static const name = 'chordSelect';

  final ChordSelectViewModel viewModel;

  @override
  State<ChordSelectScreen> createState() => _ChordSelectScreenState();
}

enum SelectType {
  select,
  preset,
}

class _ChordSelectScreenState extends State<ChordSelectScreen> {
  SelectType _selectType = SelectType.select;
  String? _selectedPresetCategory;

  NavigationRail _chordSelectTypeRail() => NavigationRail(
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.check),
            label: Text('Select'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.bookmark_outline),
            label: Text('Preset'),
          ),
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

  Widget _chordChip(String chord) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        constraints: BoxConstraints(maxHeight: 28.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(RadiusValue.full),
        ),
        child: Row(
          children: [
            Icon(Icons.check),
            wGap4(),
            Text(
              chord,
              style: musicTextTheme(context).bodyMedium,
            ),
          ],
        ),
      );

  final List<String> _sampleFilter = [
    'M7',
    'dim',
    '7sus2sus4♭9♯9♯11♭13',
    'dim',
  ];

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
              Row(
                children: [
                  Container(
                    width: 44.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(RadiusValue.full),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(RadiusValue.full),
                        child: Icon(Icons.filter_list),
                      ),
                    ),
                  ),
                  wGap4(),
                  Expanded(
                    child: SizedBox(
                      height: 28.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            _chordChip(_sampleFilter[index]),
                        separatorBuilder: (_, __) => wGap8(),
                        itemCount: _sampleFilter.length,
                      ),
                    ),
                  ),
                ],
              ),
              /* "Chords" (제목) */
              ListTile(
                contentPadding: EdgeInsets.only(right: 24.0),
                title: Text(
                  'Chords',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Checkbox(
                  value: null,
                  onChanged: (value) {},
                  tristate: true,
                ),
              ),
              Divider(height: 1.0),
              /* 선택 가능한 Chord 리스트 */
              Expanded(
                child: ChordListWidget(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected (${_sampleFilter.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(
                  Icons.bookmark_add,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            hGap4(),
            Container(
              width: 36.0,
              height: 1.0,
              color: Theme.of(context).colorScheme.outline,
            ),
            hGap16(),
            Expanded(
              child: SelectedChordsWidget(),
            ),
            hGap16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96.0,
                  height: 40.0,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: BorderRadius.circular(RadiusValue.full),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
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
                      onTap: () {},
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
