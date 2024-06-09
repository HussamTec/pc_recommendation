import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pc_recommendation/features/build/domain/entities/build_entity.dart';
import '../../../domain/usecase/build_collection_usecase.dart';
import 'medium_end_events.dart';
import 'medium_end_states.dart';


class MediumEndBloc extends Bloc<MediumEndEvent, MediumEndState> {
  final GetCollectionData getCollectionData;

  MediumEndBloc(this.getCollectionData) : super(MediumEndInitial()) {
    on<FetchMediumEndData>(_onFetchMediumEndData);
  }

  void _onFetchMediumEndData(FetchMediumEndData event, Emitter<MediumEndState> emit) async {
    emit(MediumEndLoading());
    try {
      await emit.forEach<List<BuildEntity>>(
        getCollectionData('mediumEnd'),
        onData: (mediumEndBuilds) => MediumEndLoaded(mediumEndBuilds),
        onError: (_, __) => const MediumEndError('Failed to fetch data'),
      );
    } catch (e) {
      emit(MediumEndError(e.toString()));
    }
  }
}
