import 'package:equatable/equatable.dart';
import 'package:pc_recommendation/features/home/domain/entities/accessories_main/keyboard.dart';
import 'package:pc_recommendation/features/home/domain/entities/accessories_main/mouse.dart';

import '../../../home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../home/domain/entities/browse_parts/monitor_entity.dart';
import '../../../home/domain/entities/browse_parts/motherboard_entitiy.dart';
import '../../../home/domain/entities/browse_parts/pc_case_entity.dart';
import '../../../home/domain/entities/browse_parts/power_supply_entity.dart';
import '../../../home/domain/entities/browse_parts/processor_entity.dart';
import '../../../home/domain/entities/browse_parts/ram_entity.dart';
import '../../../home/domain/entities/browse_parts/storage_entity.dart';

class BuildEntity extends Equatable {
  final String id;
  final String name;
  final ProcessorEntity? processor;
  final GraphicCardEntity? graphicCard; // Optional
  final MonitorEntity? monitor; // Optional
  final MotherboardEntity? motherboard; // Optional
  final CaseEntity? pcCase; // Optional
  final PowerSupplyEntity? powerSupply; // Optional
  final RamEntity? ram; // Optional
  final StorageEntity? storage;
  final KeyboardEntity? keyboard;
  final MouseEntity? mouse;
  final dynamic price;
  final dynamic wattage;

  const BuildEntity({
    required this.id,
    required this.name,
    required this.processor,
    this.graphicCard,
    this.monitor,
    this.motherboard,
    this.pcCase,
    this.powerSupply,
    this.ram,
    this.storage,
    this.keyboard,
    this.mouse,
    this.price,
    this.wattage,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    processor,
    graphicCard,
    monitor,
    motherboard,
    pcCase,
    powerSupply,
    ram,
    storage,
    keyboard,
    mouse,
    price,
    wattage,
  ];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BuildEntity &&
        other.id == id &&
        other.name == name &&
        other.processor == processor &&
        other.graphicCard == graphicCard &&
        other.monitor == monitor &&
        other.motherboard == motherboard &&
        other.pcCase == pcCase &&
        other.powerSupply == powerSupply &&
        other.ram == ram &&
        other.storage == storage &&
        other.keyboard == keyboard &&
        other.mouse == mouse &&
        other.wattage == wattage &&
        other.price == price;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      processor.hashCode ^
      graphicCard.hashCode ^
      monitor.hashCode ^
      motherboard.hashCode ^
      pcCase.hashCode ^
      powerSupply.hashCode ^
      ram.hashCode ^
      storage.hashCode ^
      keyboard.hashCode ^
      wattage.hashCode ^
      price.hashCode ^
      mouse.hashCode;

  factory BuildEntity.fromMap(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final price = data['price'] as num ;
    final wattage = data['wattage']as num;

    final processorData = data['processor'] as Map<String, dynamic>?;
    final processor = processorData != null ? ProcessorEntity.fromMap(processorData) : null;

    final graphicCardData = data['graphicCard'] as Map<String, dynamic>?;
    final graphicCard = graphicCardData != null ? GraphicCardEntity.fromMap(graphicCardData) : null;

    final motherboardData = data['motherboard'] as Map<String, dynamic>?;
    final motherboard = motherboardData != null ? MotherboardEntity.fromMap(motherboardData) : null;

    final pcCaseData = data['pc_case'] as Map<String, dynamic>?;
    final pcCase = pcCaseData != null ? CaseEntity.fromMap(pcCaseData) : null;

    final ramData = data['ram'] as Map<String, dynamic>?;
    final ram = ramData != null ? RamEntity.fromMap(ramData) : null;

    final powerSupplyData = data['power_supply'] as Map<String, dynamic>?;
    final powerSupply = powerSupplyData != null ? PowerSupplyEntity.fromMap(powerSupplyData) : null;

    final monitorData = data['monitor'] as Map<String, dynamic>?;
    final monitor = monitorData != null ? MonitorEntity.fromMap(monitorData) : null;

    final storageData = data['storage'] as Map<String, dynamic>?;
    final storage = storageData != null ? StorageEntity.fromMap(storageData) : null;

    final keyboardData = data['keyboard'] as Map<String, dynamic>?;
    final keyboard = keyboardData != null ? KeyboardEntity.fromMap(keyboardData) : null;

    final mouseData = data['mouse'] as Map<String, dynamic>?;
    final mouse = mouseData != null ? MouseEntity.fromMap(mouseData) : null;


    return BuildEntity(
      id: id,
      name: name,
      processor: processor,
      graphicCard: graphicCard,
      motherboard: motherboard,
      pcCase: pcCase,
      ram: ram,
      powerSupply: powerSupply,
      monitor: monitor,
      storage: storage,
      keyboard: keyboard,
      mouse: mouse,
      price: price,
      wattage: wattage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'wattage': wattage,
      'processor': processor?.toMap(),
      'graphicCard': graphicCard?.toMap(), // Include null check for optional fields
      'monitor': monitor?.toMap(),
      'motherboard': motherboard?.toMap(),
      'pc_case': pcCase?.toMap(),
      'power_supply': powerSupply?.toMap(),
      'ram': ram?.toMap(),
      'storage': storage?.toMap(),
      'keyboard': keyboard?.toMap(),
      'mouse': mouse?.toMap(),
    };
  }
}
