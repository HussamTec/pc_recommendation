import 'package:bloc/bloc.dart';
import 'package:pc_recommendation/features/build/presentation/state_management/price_and_wattage_bloc/price_wattage_event.dart';
import 'package:pc_recommendation/features/build/presentation/state_management/price_and_wattage_bloc/price_wattage_state.dart';

class PriceWattageBloc extends Bloc<PriceWattageEvent, PriceWattageState> {
  PriceWattageBloc(dynamic initialPrice, dynamic initialWattage) :
        super(PriceWattageState(initialPrice,initialWattage));

  @override
  Stream<PriceWattageState> mapEventToState(PriceWattageEvent event) async* {
    final newPrice = (state.price ?? 0) + (event.priceValue ?? 0);
    final newWattage = (state.wattage ?? 0) + (event.wattageValue ?? 0);
    yield PriceWattageState(newPrice,newWattage);
    }
}
