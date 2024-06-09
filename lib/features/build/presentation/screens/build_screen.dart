import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/build/domain/entities/build_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/accessories_other/case_accessory.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/monitor_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/motherboard_entitiy.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/pc_case_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/power_supply_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/processor_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/ram_entity.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/storage_entity.dart';
import 'package:pc_recommendation/features/home/presentation/screen/case_accessories_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/cases_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/graphic_cards_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/monitors_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/motherboards_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/power_supplies_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/processors_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/ram_screen.dart';
import 'package:pc_recommendation/features/home/presentation/screen/storage_screen.dart';
import '../../../home/domain/entities/browse_parts/graphic_card_entity.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_events.dart';
import '../state_management/build_item_provider/build_bloc.dart';
import '../state_management/price_and_wattage_bloc/price_wattage_bloc.dart';
import '../state_management/price_and_wattage_bloc/price_wattage_event.dart';
import '../state_management/price_and_wattage_bloc/price_wattage_state.dart';
import '../state_management/save_builds_bloc/saved_builds_bloc.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RamEntity? buildRam;
    GraphicCardEntity? buildGraphicCard;
    ProcessorEntity? buildProcessor;
    MotherboardEntity? buildMotherboard;
    MonitorEntity? buildMonitor;
    StorageEntity? buildStorage;
    CaseEntity? buildCase;
    PowerSupplyEntity? buildPowerSupply;
    // CaseAccessoryEntity? buildCaseAccessory;
    // BuildEntity? buildEntity;
    dynamic price = 0;
    dynamic wattage = 0;
    PriceWattageBloc priceBloc = PriceWattageBloc(0, 0);
    return Scaffold(
        backgroundColor: const Color(0xff17264D),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Build Your Dream Pc',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => priceBloc,
                child: BlocBuilder<PriceWattageBloc, PriceWattageState>(
                    builder: (context, state) {
                  price = state.price;
                  wattage = state.wattage;
                  return BlocBuilder<PowerSupplyBloc, PowerSupplyEntity?>(
                      builder: (context, powerSupply) {
                    return BlocBuilder<MotherboardBloc, MotherboardEntity?>(
                        builder: (context, motherboard) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'TOTAL PRICE:${state.price.toStringAsFixed(2)}\$',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 140,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${state.wattage}W',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'COMPATIBILITY: ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                powerSupply?.wattage != null &&
                                        powerSupply?.wattage < 1000
                                    ? const Text(
                                        'COMPATIBLE',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      )
                                    : const Text(
                                        'INCOMPATIBLE',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      )
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              // Set corner radius
                              color: const Color(0xFF242E47),
                              // Set background color
                              border: Border.all(
                                // Optional: Add border
                                color: Colors.white70,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child:
                                              motherboard?.pros!=null||powerSupply?.pros !=null?
                                          Text(
                                            'Pros: ${motherboard?.pros??''}-${powerSupply?.pros ?? ''}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.green),): const Text(
                                                'Pros:',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.green),
                                              )
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child:   motherboard?.cons !=null || powerSupply?.cons!=null?
                                          Text(
                                            'Cons: ${motherboard?.cons ?? ''}-${powerSupply?.cons??''}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.red),): const Text(
                                            'Cons:',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.red),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
                  });
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                BlocBuilder<GraphicCardBloc, GraphicCardEntity?>(
                    builder: (context, graphicCard) {
                  buildGraphicCard = graphicCard;
                  if (graphicCard?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: graphicCard?.price));
                  }
                  return AddBtn(
                    child: graphicCard == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_graphic_card.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(graphicCard.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      graphicCard.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (graphicCard?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -graphicCard?.price));
                      }
                      context.read<FirebaseDataSourceBloc>().add(
                          const FirebaseDataSourceEvent.fetchGraphicCards());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GraphicCardsScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<ProcessorBloc, ProcessorEntity?>(
                    builder: (context, processor) {
                  buildProcessor = processor;
                  if (processor?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: processor?.price));
                  }
                  return AddBtn(
                    child: processor == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_processor.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(processor.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      processor.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (processor?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -processor?.price));
                      }
                      context
                          .read<FirebaseDataSourceBloc>()
                          .add(const FirebaseDataSourceEvent.fetchProcessors());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProcessorsScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<MotherboardBloc, MotherboardEntity?>(
                    builder: (context, motherboard) {
                  buildMotherboard = motherboard;
                  if (motherboard?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: motherboard?.price));
                  }
                  return AddBtn(
                    child: motherboard == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_motherboard.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(motherboard.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      motherboard.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (motherboard?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -motherboard?.price));
                      }
                      context.read<FirebaseDataSourceBloc>().add(
                          const FirebaseDataSourceEvent.fetchMotherboards());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MotherboardsScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<RamBloc, RamEntity?>(builder: (context, ram) {
                  buildRam = ram;
                  if (ram?.price != null) {
                    priceBloc.add(PriceWattageEvent(priceValue: ram?.price));
                  }
                  return AddBtn(
                    child: ram == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_ram.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(ram.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      ram.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (ram?.price != null) {
                        priceBloc
                            .add(PriceWattageEvent(priceValue: -ram?.price));
                      }
                      context
                          .read<FirebaseDataSourceBloc>()
                          .add(const FirebaseDataSourceEvent.fetchRAM());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RamScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<MonitorBloc, MonitorEntity?>(
                    builder: (context, monitor) {
                  buildMonitor = monitor;
                  if (monitor?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: monitor?.price));
                  }
                  return AddBtn(
                    child: monitor == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_monitor.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(monitor.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      monitor.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (monitor?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -monitor?.price));
                      }
                      context
                          .read<FirebaseDataSourceBloc>()
                          .add(const FirebaseDataSourceEvent.fetchMonitors());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MonitorsScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<StorageBloc, StorageEntity?>(
                    builder: (context, storage) {
                  buildStorage = storage;
                  if (storage?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: storage?.price));
                  }
                  return AddBtn(
                    child: storage == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_storage.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(storage.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      storage.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (storage?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -storage?.price));
                      }
                      context
                          .read<FirebaseDataSourceBloc>()
                          .add(const FirebaseDataSourceEvent.fetchStorage());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StorageScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<CaseBloc, CaseEntity?>(
                    builder: (context, caseEntity) {
                  buildCase = caseEntity;
                  if (caseEntity?.price != null) {
                    priceBloc
                        .add(PriceWattageEvent(priceValue: caseEntity?.price));
                  }
                  return AddBtn(
                    child: caseEntity == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_case.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(caseEntity.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      caseEntity.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (caseEntity?.price != null) {
                        priceBloc.add(
                            PriceWattageEvent(priceValue: -caseEntity?.price));
                      }
                      context
                          .read<FirebaseDataSourceBloc>()
                          .add(const FirebaseDataSourceEvent.fetchCase());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CasesScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<PowerSupplyBloc, PowerSupplyEntity?>(
                    builder: (context, powerSupply) {
                  buildPowerSupply = powerSupply;
                  if (powerSupply?.price != null) {
                    priceBloc.add(PriceWattageEvent(
                        priceValue: powerSupply?.price,
                        wattageValue: powerSupply?.wattage));
                  }
                  return AddBtn(
                    child: powerSupply == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_power_supply.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(powerSupply.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      powerSupply.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (powerSupply?.price != null) {
                        priceBloc.add(PriceWattageEvent(
                            priceValue: -powerSupply?.price,
                            wattageValue: -powerSupply?.wattage));
                      }
                      context.read<FirebaseDataSourceBloc>().add(
                          const FirebaseDataSourceEvent.fetchPowerSupplies());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PowerSuppliesScreen(),
                        ),
                      );
                    },
                  );
                }),
                BlocBuilder<CaseAccessoriesBloc, CaseAccessoryEntity?>(
                    builder: (context, caseAccessory) {
                  // buildCaseAccessory = caseAccessory;
                  if (caseAccessory?.price != null) {
                    priceBloc.add(
                        PriceWattageEvent(priceValue: caseAccessory?.price));
                  }
                  return AddBtn(
                    child: caseAccessory == null
                        ? SvgPicture.asset(
                            'assets/svg_icons/add_accessories.svg',
                            height: 80,
                            width: 300,
                          )
                        : Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9E6),
                              borderRadius: BorderRadius.circular(
                                  8), // 15 is half of the height to make it perfectly round
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(caseAccessory.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: Text(
                                      caseAccessory.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    onTap: () {
                      if (caseAccessory?.price != null) {
                        priceBloc.add(PriceWattageEvent(
                            priceValue: caseAccessory?.price));
                      }
                      context.read<FirebaseDataSourceBloc>().add(
                          const FirebaseDataSourceEvent.fetchCaseAccessories());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CaseAccessoriesScreen(),
                        ),
                      );
                    },
                  );
                }),
              ]),
              BlocProvider(
                create: (context) => SavedBuildsBloc(),
                child: SaveBuildBlackBtn(
                    svgPath: 'assets/svg_icons/save_build_black.svg',
                    onTap: () async {
                      await showBuildNameDialog(context).then((value) {
                        final buildEntity = BuildEntity(
                            id: '$value${FirebaseAuth.instance.currentUser?.uid}',
                            name: value!,
                            processor: buildProcessor,
                            graphicCard: buildGraphicCard,
                            monitor: buildMonitor,
                            motherboard: buildMotherboard,
                            pcCase: buildCase,
                            powerSupply: buildPowerSupply,
                            ram: buildRam,
                            storage: buildStorage,
                            price: price ?? 0,
                            wattage: wattage);

                        BlocProvider.of<SavedBuildsBloc>(context)
                            .add(AddSavedBuild(buildEntity));
                      });
                    }),
              )
            ],
          ),
        ));
  }
}

Future<String?> showBuildNameDialog(BuildContext context) async {
  final TextEditingController nameController = TextEditingController();
  return await showDialog<String>(
    context: context,
    barrierDismissible: false, // Prevent closing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Save Build'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: 'Enter Build Name'),
          autofocus: true, // Focus the text field automatically
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                Navigator.pop(context, name); // Pop with entered name
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

class SaveBuildBlackBtn extends StatelessWidget {
  final String svgPath;
  final void Function()? onTap;

  const SaveBuildBlackBtn({
    required this.svgPath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 60,
          width: 300,
          child: SvgPicture.asset(
            svgPath,
            height: 30,
            width: 150,
          ),
        ),
      ),
    );
  }
}

class AddBtn extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;

  const AddBtn({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width - 40,
          child: child,
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 50,
        width: 100,
        child: AlertDialog(
          title: Text(title, style: const TextStyle(color: Colors.white)),
          content: Text(content, style: const TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xff101B37),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust corner radius as desired
          ),
        ),
      );
    },
  );
}
