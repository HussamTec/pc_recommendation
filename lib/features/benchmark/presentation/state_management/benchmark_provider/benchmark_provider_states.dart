import 'package:pc_recommendation/features/home/domain/entities/browse_parts/graphic_card_entity.dart';

import '../../../../home/domain/entities/browse_parts/processor_entity.dart';

class ProcessorSelectionState {
  final List<ProcessorEntity?> selectedProcessors;
  final List<GraphicCardEntity?> selectedGraphicCards;

  const ProcessorSelectionState({this.selectedProcessors = const [],this.selectedGraphicCards = const []});

}
