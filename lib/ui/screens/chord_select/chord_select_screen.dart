import 'package:c2b_chord/ui/screens/chord_select/chord_select_tab_area.dart';
import 'package:c2b_chord/ui/screens/chord_select/preset_tab_area.dart';
import 'package:c2b_chord/ui/screens/chord_select/selected_chords_area_container.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 연습할 Chord를 선택하는 화면
class ChordSelectScreen extends ConsumerStatefulWidget {
  const ChordSelectScreen({super.key});

  static const name = 'chord_select';

  @override
  ConsumerState<ChordSelectScreen> createState() => _ChordSelectScreenState();
}

enum SelectType { select, preset }

class _ChordSelectScreenState extends ConsumerState<ChordSelectScreen> {
  SelectType _selectType = SelectType.select;

  NavigationRail _selectTypeRail() => NavigationRail(
    destinations: [
      NavigationRailDestination(icon: Icon(Icons.check), label: Text('Select')),
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: C2bPadding.longSide,
              horizontal: C2bPadding.shortSide,
            ),
            child: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? Center(child: CircularProgressIndicator())
                    : Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _selectTypeRail(),
                            Expanded(
                              child:
                                  _selectType == SelectType.select
                                      ? const ChordSelectTabArea()
                                      : const PresetTabArea(),
                            ),
                            const SelectedChordsAreaContainer(),
                          ],
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.arrow_back_ios),
                        //   onPressed: () {
                        //     context.push(Routes.home);
                        //   },
                        // ),
                      ],
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
