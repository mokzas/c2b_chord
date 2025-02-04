import 'package:c2b/ui/view_models/play_view_model.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    super.key,
    required this.viewModel,
  });

  final PlayViewModel viewModel;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
