// presentation/processors/firebase_data_bloc.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pc_recommendation/features/favorite_list/domain/entities/favorite_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/news_entity.dart';
import 'package:pc_recommendation/features/home/domain/usecases/firebase_data_source_usecase.dart';

import '../../../domain/entities/accessories_main/external_storage.dart';
import '../../../domain/entities/accessories_main/headphones.dart';
import '../../../domain/entities/accessories_main/keyboard.dart';
import '../../../domain/entities/accessories_main/mouse.dart';
import '../../../domain/entities/accessories_main/mouse_pad.dart';
import '../../../domain/entities/accessories_main/speaker.dart';
import '../../../domain/entities/accessories_main/webcam.dart';
import '../../../domain/entities/accessories_other/case_accessory.dart';
import '../../../domain/entities/accessories_other/case_fan.dart';
import '../../../domain/entities/accessories_other/fan_controller.dart';
import '../../../domain/entities/accessories_other/operating_system.dart';
import '../../../domain/entities/accessories_other/optical_drive.dart';
import '../../../domain/entities/accessories_other/thermal_paste.dart';
import '../../../domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../domain/entities/browse_parts/monitor_entity.dart';
import '../../../domain/entities/browse_parts/motherboard_entitiy.dart';
import '../../../domain/entities/browse_parts/pc_case_entity.dart';
import '../../../domain/entities/browse_parts/power_supply_entity.dart';
import '../../../domain/entities/browse_parts/processor_entity.dart';
import '../../../domain/entities/browse_parts/ram_entity.dart';
import '../../../domain/entities/browse_parts/storage_entity.dart';
import 'firebase_data_events.dart';
import 'firebase_data_states.dart';

class FirebaseDataSourceBloc extends Bloc<FirebaseDataSourceEvent, FirebaseDataSourceState> {
  final FirebaseDataSourceUseCase getDataUseCase;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDataSourceBloc({required this.getDataUseCase}) : super(const Initial());

  @override
  Stream<FirebaseDataSourceState> mapEventToState(FirebaseDataSourceEvent event) async* {
    var userId=_auth.currentUser!.uid;

    yield* event.when(
      fetchFavItems: () async* {
        yield const Loading();
        try {
          final favorites = await getDataUseCase.getFirebaseDataCall("user_favorites$userId",(data) => FavoriteEntity.fromMap(data));
          yield Loaded(favorites);
        } catch (e) {
          print("error here!!!!!!!!!!!!!! $e");
          yield const Error('Failed to fetch favorites');
        }
      },
      fetchProcessors: () async* {
        yield const Loading();
        try {
          final processors = await getDataUseCase.getFirebaseDataCall("processors",(data) => ProcessorEntity.fromMap(data));
          yield Loaded(processors);
        } catch (e) {
          print("error here!!!!!!!!!!!!!! $e");
          yield const Error('Failed to fetch processors');
        }
      },
      fetchGraphicCards: () async* {
        yield const Loading();
        try {
          final graphicCards = await getDataUseCase.getFirebaseDataCall("graphic cards",(data) => GraphicCardEntity.fromMap(data));
          yield Loaded(graphicCards);
        } catch (e) {
          print("error here!!!!!!!!!!!!!! dataSource $e");
          yield const Error('Failed to fetch graphic cards');
        }
      },
        fetchMotherboards: () async* {
        yield const Loading();
        try {
          final motherboards = await getDataUseCase.getFirebaseDataCall(
            "Motherboards",
                (data) => MotherboardEntity.fromMap(data),
          );
          yield Loaded(motherboards);
        } catch (e) {
          print("error here!!!!!!!!!!!!!! $e");
          yield const Error('Failed to fetch Motherboards');
        }
      },
      fetchMonitors: () async* {
        yield const Loading();
        try {
          final monitors = await getDataUseCase.getFirebaseDataCall(
            "monitors",
                (data) => MonitorEntity.fromMap(data),
          );
          yield Loaded(monitors);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch monitors');
        }
      },
      fetchCase: () async* {
        yield const Loading();
        try {
          final cases = await getDataUseCase.getFirebaseDataCall(
            "cases",
                (data) => CaseEntity.fromMap(data),
          );
          yield Loaded(cases);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch cases');
        }
      },
      fetchPowerSupplies: () async* {
        yield const Loading();
        try {
          final powerSupplies = await getDataUseCase.getFirebaseDataCall(
            "power_supplies",
                (data) => PowerSupplyEntity.fromMap(data),
          );
          yield Loaded(powerSupplies);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch power supplies');
        }
      },
      fetchRAM: () async* {
        yield const Loading();
        try {
          final rams = await getDataUseCase.getFirebaseDataCall(
            "ram",
                (data) => RamEntity.fromMap(data),
          );
          yield Loaded(rams);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch RAM');
        }
      },
      fetchStorage: () async* {
        yield const Loading();
        try {
          final storages = await getDataUseCase.getFirebaseDataCall(
            "storage",
                (data) => StorageEntity.fromMap(data),
          );
          yield Loaded(storages);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch storage devices');
        }
      },
      fetchKeyboards: () async* {
        yield const Loading();
        try {
          final keyboards = await getDataUseCase.getFirebaseDataCall(
            "keyboards",
                (data) => KeyboardEntity.fromMap(data),
          );
          yield Loaded(keyboards);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch keyboards');
        }
      },
      fetchMouses: () async* {
        yield const Loading();
        try {
          final mice = await getDataUseCase.getFirebaseDataCall(
            "mouses",
                (data) => MouseEntity.fromMap(data),
          );
          yield Loaded(mice);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch mice');
        }
      },
      fetchHeadphones: () async* {
        yield const Loading();
        try {
          final headphones = await getDataUseCase.getFirebaseDataCall(
            "headphones",
                (data) => HeadphoneEntity.fromMap(data),
          );
          yield Loaded(headphones);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch headphones');
        }
      },
      fetchMousePads: () async* {
        yield const Loading();
        try {
          final mousePads = await getDataUseCase.getFirebaseDataCall(
            "mouse_pads",
                (data) => MousePadEntity.fromMap(data),
          );
          yield Loaded(mousePads);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch mouse pads');
        }
      },
      fetchExternalStorage: () async* {
        yield const Loading();
        try {
          final externalStorages = await getDataUseCase.getFirebaseDataCall(
            "external_storage",
                (data) => ExternalStorageEntity.fromMap(data),
          );
          yield Loaded(externalStorages);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch external storage devices');
        }
      },
      fetchWebcams: () async* {
        yield const Loading();
        try {
          final webcams = await getDataUseCase.getFirebaseDataCall(
            "webcams",
                (data) => WebcamEntity.fromMap(data),
          );
          yield Loaded(webcams);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch webcams');
        }
      },
      fetchSpeakers: () async* {
        yield const Loading();
        try {
          final speakers = await getDataUseCase.getFirebaseDataCall(
            "speakers",
                (data) => SpeakerEntity.fromMap(data),
          );
          yield Loaded(speakers);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch speakers');
        }
      },
      fetchThermalPastes: () async* {
        yield const Loading();
        try {
          final thermalPastes = await getDataUseCase.getFirebaseDataCall(
            "thermal_pastes",
                (data) => ThermalPasteEntity.fromMap(data),
          );
          yield Loaded(thermalPastes);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch thermal pastes');
        }
      },
      fetchCaseAccessories: () async* {
        yield const Loading();
        try {
          final caseAccessories = await getDataUseCase.getFirebaseDataCall(
            "case_accessories",
                (data) => CaseAccessoryEntity.fromMap(data),
          );
          yield Loaded(caseAccessories);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch case accessories');
        }
      },
      fetchFanControllers: () async* {
        yield const Loading();
        try {
          final fanControllers = await getDataUseCase.getFirebaseDataCall(
            "fan_controllers",
                (data) => FanControllerEntity.fromMap(data),
          );
          yield Loaded(fanControllers);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch fan controllers');
        }
      },
      fetchCaseFans: () async* {
        yield const Loading();
        try {
          final caseFans = await getDataUseCase.getFirebaseDataCall(
            "case_fans",
                (data) => CaseFanEntity.fromMap(data),
          );
          yield Loaded(caseFans);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch case fans');
        }
      },
      fetchOperatingSystems: () async* {
        yield const Loading();
        try {
          final operatingSystems = await getDataUseCase.getFirebaseDataCall(
            "operating_systems",
                (data) => OperatingSystemEntity.fromMap(data),
          );
          yield Loaded(operatingSystems);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch operating systems');
        }
      },
      fetchOpticalDrives: () async* {
        yield const Loading();
        try {
          final opticalDrives = await getDataUseCase.getFirebaseDataCall(
            "optical_drives",
                (data) => OpticalDriveEntity.fromMap(data),
          );
          yield Loaded(opticalDrives);
        } catch (e) {
          print("Error occurred: $e");
          yield const Error('Failed to fetch optical drives');
        }
      },















      fetchNews: () async* {
        yield const Loading();
        try {
          final news = await getDataUseCase.getFirebaseDataCall("news",(data) => NewsEntity.fromMap(data));
          yield Loaded(news);
        } catch (e) {
          print("error here!!!!!!!!!!!!!! $e");
          yield const Error('Failed to fetch graphic news');
        }
      },
    );
  }
}