// Events
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/power_supply_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/processor_entity.dart';
import '../../../../home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../../home/domain/entities/browse_parts/monitor_entity.dart';
import '../../../../home/domain/entities/browse_parts/motherboard_entitiy.dart';
import '../../../../home/domain/entities/browse_parts/pc_case_entity.dart';
import '../../../../home/domain/entities/browse_parts/ram_entity.dart';
import '../../../../home/domain/entities/browse_parts/storage_entity.dart';

abstract class BuildEvent {}

class SelectGraphicCardEvent extends BuildEvent {
  final GraphicCardEntity graphicCard;

  SelectGraphicCardEvent(this.graphicCard);
}
class SelectProcessorEvent extends BuildEvent {
  final ProcessorEntity processor;

  SelectProcessorEvent(this.processor);
}

class SelectMonitorEvent extends BuildEvent {
  final MonitorEntity monitor;

  SelectMonitorEvent(this.monitor);
}

class SelectStorageEvent extends BuildEvent {
  final StorageEntity storage;

  SelectStorageEvent(this.storage);
}
class SelectRamEvent extends BuildEvent {
  final RamEntity ram;

  SelectRamEvent(this.ram);
}

class SelectCaseEvent extends BuildEvent {
  final CaseEntity caseEntity;

  SelectCaseEvent(this.caseEntity);
}

class SelectPowerSupplyEvent extends BuildEvent {
  final PowerSupplyEntity powerSupply;

  SelectPowerSupplyEvent(this.powerSupply);
}

class SelectMotherboardEvent extends BuildEvent {
  final MotherboardEntity motherboard;

  SelectMotherboardEvent(this.motherboard);
}

class SelectAccessoriesEvent extends BuildEvent {
  final dynamic accessory;

  SelectAccessoriesEvent(this.accessory);
}