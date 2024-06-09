import 'package:bloc/bloc.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../../home/domain/entities/browse_parts/processor_entity.dart';
import 'benchmark_provider_event.dart';
import 'benchmark_provider_states.dart';

class ProcessorSelectionBloc extends Bloc<ProcessorSelectionEvent, ProcessorSelectionState> {
  ProcessorSelectionBloc() : super(const ProcessorSelectionState()) {
    on<AddProcessorEvent>((event, emit) {
      final List<ProcessorEntity?> newSelectedProcessors = List.from(state.selectedProcessors);
      if (newSelectedProcessors.length < 2) {
        newSelectedProcessors.add(event.processor);
      } else {
        // Notify user if max selection is reached (optional)
        print('Maximum of 2 processors can be selected');
      }
      emit(ProcessorSelectionState(selectedProcessors: newSelectedProcessors));
    });
    on<AddGraphicCardEvent>((event, emit) {
      final List<GraphicCardEntity?> newSelectedGraphicCards = List.from(state.selectedGraphicCards);
      if (newSelectedGraphicCards.length < 2) {
        newSelectedGraphicCards.add(event.graphicCard);
      } else {
        // Notify user if max selection is reached (optional)
        print('Maximum of 2 Graphic cards can be selected');
      }
      emit(ProcessorSelectionState(selectedGraphicCards: newSelectedGraphicCards));
    });
    on<RemoveProcessorEvent>((event, emit) {
      final List<ProcessorEntity> newSelectedProcessors = List.from(state.selectedProcessors);
      newSelectedProcessors.remove(event.processor);
      emit(ProcessorSelectionState(selectedProcessors: newSelectedProcessors));
    });
    on<RemoveGraphicCardEvent>((event, emit) {
      final List<GraphicCardEntity> newSelectedGraphicCards = List.from(state.selectedGraphicCards);
      newSelectedGraphicCards.remove(event.graphicCard);
      emit(ProcessorSelectionState(selectedGraphicCards: newSelectedGraphicCards));
    });
  }
}