
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/graphic_card_entity.dart';

import '../../../../home/domain/entities/browse_parts/processor_entity.dart';

class ProcessorSelectionEvent { // Generic event class
  final ProcessorEntity? processor;
  final GraphicCardEntity? graphicCard;

  const ProcessorSelectionEvent({this.processor,this.graphicCard});
}

class AddProcessorEvent extends ProcessorSelectionEvent {
  const AddProcessorEvent(ProcessorEntity processor) : super(processor: processor);
}
class AddGraphicCardEvent extends ProcessorSelectionEvent {
  const AddGraphicCardEvent(GraphicCardEntity graphicCard) : super(graphicCard: graphicCard);
}

class RemoveProcessorEvent extends ProcessorSelectionEvent {
  const RemoveProcessorEvent(ProcessorEntity processor) : super(processor: processor);
}
class RemoveGraphicCardEvent extends ProcessorSelectionEvent {
  const RemoveGraphicCardEvent(GraphicCardEntity graphicCard) : super(graphicCard: graphicCard);
}
