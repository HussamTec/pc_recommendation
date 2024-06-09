import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/build_entity.dart';
import '../../../domain/usecase/build_collection_usecase.dart';
import 'high_end_events.dart';
import 'high_end_states.dart';

class HighEndBloc extends Bloc<HighEndEvent, HighEndState> {
  final GetCollectionData getCollectionData;

  HighEndBloc(this.getCollectionData) : super(HighEndInitial()) {
    on<FetchHighEndData>(_onFetchHighEndData);
  }

  void _onFetchHighEndData(FetchHighEndData event, Emitter<HighEndState> emit) async {
    emit(HighEndLoading());
    try {
      await emit.forEach<List<BuildEntity>>(
        getCollectionData('highEnd'),
        onData: (highEndBuilds) => HighEndLoaded(highEndBuilds),
        onError: (_, __) => const HighEndError('Failed to fetch data'),
      );
    } catch (e) {
      emit(HighEndError(e.toString()));
    }
  }
}
