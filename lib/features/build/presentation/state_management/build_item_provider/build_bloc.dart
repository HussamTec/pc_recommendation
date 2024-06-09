import 'package:bloc/bloc.dart';
import 'package:pc_recommendation/features/home/domain/entities/accessories_other/case_accessory.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/motherboard_entitiy.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/pc_case_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/power_supply_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/processor_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/ram_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/storage_entity.dart';

import '../../../../home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../../home/domain/entities/browse_parts/monitor_entity.dart';
import 'build_event.dart';

class GraphicCardBloc extends Bloc<BuildEvent, GraphicCardEntity?> {
  GraphicCardBloc() : super(null);

  @override
  Stream<GraphicCardEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectGraphicCardEvent) {
      yield event.graphicCard;
    }
  }
}
class ProcessorBloc extends Bloc<BuildEvent, ProcessorEntity?> {
  ProcessorBloc() : super(null);

  @override
  Stream<ProcessorEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectProcessorEvent) {
      yield event.processor;
    }
  }
}
class MotherboardBloc extends Bloc<BuildEvent, MotherboardEntity?> {
  MotherboardBloc() : super(null);

  @override
  Stream<MotherboardEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectMotherboardEvent) {
      yield event.motherboard;
    }
  }
}
class StorageBloc extends Bloc<BuildEvent, StorageEntity?> {
  StorageBloc() : super(null);

  @override
  Stream<StorageEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectStorageEvent) {
      yield event.storage;
    }
  }
}
class MonitorBloc extends Bloc<BuildEvent, MonitorEntity?> {
  MonitorBloc() : super(null);

  @override
  Stream<MonitorEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectMonitorEvent) {
      yield event.monitor;
    }
  }
}
class RamBloc extends Bloc<BuildEvent, RamEntity?> {
  RamBloc() : super(null);

  @override
  Stream<RamEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectRamEvent) {
      yield event.ram;
    }
  }
}
class CaseBloc extends Bloc<BuildEvent, CaseEntity?> {
  CaseBloc() : super(null);

  @override
  Stream<CaseEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectCaseEvent) {
      yield event.caseEntity;
    }
  }
}
class PowerSupplyBloc extends Bloc<BuildEvent, PowerSupplyEntity?> {
  PowerSupplyBloc() : super(null);

  @override
  Stream<PowerSupplyEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectPowerSupplyEvent) {
      yield event.powerSupply;
    }
  }
}
class CaseAccessoriesBloc extends Bloc<BuildEvent, CaseAccessoryEntity?> {
  CaseAccessoriesBloc() : super(null);

  @override
  Stream<CaseAccessoryEntity?> mapEventToState(BuildEvent event) async* {
    if (event is SelectAccessoriesEvent) {
      yield event.accessory;
    }
  }
}



