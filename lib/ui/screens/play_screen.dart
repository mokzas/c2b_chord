import 'package:c2b/ui/theme/const.dart';
import 'package:c2b/ui/view_models/play_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    super.key,
    required this.viewModel,
  });

  static const name = 'play';

  final PlayViewModel viewModel;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Widget _volumeSlider() => SizedBox(
        width: 134.0,
        child: Slider(
          value: 0.5,
          onChanged: (newValue) {},
        ),
      );

  // Beat/BPM/ChordCount
  Widget _optionSelector() => Row(
        children: [
          Column(
            children: [
              Text(
                '5',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Beat',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
          wGap8(),
          Column(
            children: [
              Text(
                '110',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'BPM',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
          wGap8(),
          Column(
            children: [
              Text(
                '8',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Chords',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
        ],
      );

  // practice start/stop/repeat
  Widget _playStopRepeatController() => Row(
        children: [
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: Icon(Icons.stop_rounded),
          ),
          wGap8(),
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: Icon(Icons.play_arrow_rounded),
          ),
          wGap8(),
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: Icon(Icons.repeat_rounded),
          ),
        ],
      );

  // upper widgets (volume, option, controller)
  Widget _controllerWidgets() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 72.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _volumeSlider(),
                _optionSelector(),
                _playStopRepeatController(),
              ],
            ),
          ),
          const SizedBox(width: 72.0),
        ],
      );

  // beat indicator widget
  Widget _beatIndicator({required bool active}) => CircleAvatar(
        radius: 8.0,
        backgroundColor: active ? Color(0xff655a6f) : Color(0xffe9e0eb),
      );

  Widget _beatIndicatorWidgets(int count, int active) {
    List<Widget> beatIndicatorWidgets = [];
    for (int i = 0; i < count; ++i) {
      beatIndicatorWidgets.add(_beatIndicator(active: (active == i + 1)));
      if (count != i + 1) {
        beatIndicatorWidgets.add(wGap4());
      }
    }
    return Row(
      children: [
        Expanded(child: Container()),
        Row(children: beatIndicatorWidgets),
        Expanded(child: Container()),
      ],
    );
  }

  Widget _playCard(String chord, bool on) => FittedBox(
        child: Column(
          children: [
            Container(
              height: 80.0,
              constraints: BoxConstraints(minWidth: 140.0),
              decoration: BoxDecoration(
                color: on
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(RadiusValue.small),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  chord,
                  style: musicTextTheme(context).titleLarge?.copyWith(
                        color: on
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : CustomColorScheme.neutral50,
                        fontWeight: on ? FontWeight.bold : null,
                      ),
                ),
              ),
            ),
            hGap4(),
            Container(
              height: 4.0,
              constraints: BoxConstraints(minWidth: 140.0),
              decoration: BoxDecoration(
                color: on
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : CustomColorScheme.neutral50,
                borderRadius: BorderRadius.circular(RadiusValue.full),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  chord,
                  style: musicTextTheme(context)
                      .titleLarge
                      ?.copyWith(color: Colors.transparent),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _playerWidgets(List<String> chords, int on) {
    Widget playCards =
        // chords는 8, 4, 2, 1 의 길이만 가져야 한다
        (chords.length == 8)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; ++i)
                        _playCard(chords[i], on == (i + 1))
                    ],
                  ),
                  hGap16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 4; i < 8; ++i)
                        _playCard(chords[i], on == (i + 1))
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: chords.length == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < chords.length; ++i)
                    _playCard(chords[i], on == (i + 1))
                ],
              );

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(RadiusValue.large),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: playCards,
        ),
      ),
    );
  }

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

  final sampleChords = [
    'Bdim',
    'C♯7sus4♭9♭13',
    'Dm7',
    'E♭7sus4♭9♯9',
    'G7sus4',
    'Am6',
    'Cm7',
    'C♯dim7',
  ];

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
                ? CircularProgressIndicator()
                : Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _controllerWidgets(),
                          hGap8(),
                          _beatIndicatorWidgets(5, 2),
                          hGap24(),
                          _playerWidgets(sampleChords, 2),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          context.pop();
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
