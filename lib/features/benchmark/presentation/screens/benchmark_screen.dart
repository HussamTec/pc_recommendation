import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_events.dart';
import '../../../home/presentation/state_management/firebase_data_bloc/firebase_data_states.dart';
import '../state_management/benchmark_provider/benchmark_provider_bloc.dart';
import '../state_management/benchmark_provider/benchmark_provider_event.dart';
import '../state_management/benchmark_provider/benchmark_provider_states.dart';


class BenchmarkScreen extends StatelessWidget {
  const BenchmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xff17264D),
        body: SingleChildScrollView(
          child:

          BlocBuilder<ProcessorSelectionBloc,ProcessorSelectionState>(
              builder: (context, state) {
                final selectedProcessors = state.selectedProcessors;
                final selectedGraphicCards=state.selectedGraphicCards;
                return  Column(
                    children: [
                      const SizedBox(height: 50),
                      const Center(
                          child: Text(
                        'Benchmark',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                      SizedBox(
                        height: 140,
                        width: 430,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        selectedProcessors.isNotEmpty? BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                            RemoveProcessorEvent(selectedProcessors[0]!)):Container();
                                        context
                                            .read<FirebaseDataSourceBloc>()
                                            .add(const FirebaseDataSourceEvent.fetchProcessors());
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const ProcessorListDialog(),);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/processor.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                     selectedGraphicCards.isNotEmpty?   BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                            RemoveGraphicCardEvent(selectedGraphicCards[0]!)):Container();
                                        context
                                            .read<FirebaseDataSourceBloc>()
                                            .add(const FirebaseDataSourceEvent.fetchGraphicCards());
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                          const GraphicCardListDialog(),);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/graphicCard.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/motherboard.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/ram.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/storage.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/case.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/monitor.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/svg_icons/power.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                     Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 85,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                       selectedProcessors.isNotEmpty?
                                       Container(
                                           color:  const Color(0xff17264D),
                                           height: 100,
                                           width: 100,
                                           child: Image.network(selectedProcessors[0]!.imageUrl)):
                                       selectedGraphicCards.isNotEmpty?
                                       Container(
                                           color:  const Color(0xff17264D),
                                           height: 100,
                                           width: 100,
                                           child: Image.network(selectedGraphicCards[0]!.imageUrl)):
                                       Container(
                                              color:  const Color(0xff17264D),
                                              height: 100,
                                              width: 100,
                                              child: Image.asset('assets/svg_icons/add_benchmark.png',
                                                color: Colors.white,))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset('assets/svg_icons/VS.svg'),
                                    ),

                                    selectedProcessors.length>1?
                                    Container(
                                        color:  const Color(0xff17264D),
                                        height: 100,
                                        width: 100,
                                        child: Image.network(selectedProcessors[1]!.imageUrl)):
                                    selectedGraphicCards.length>1?
                                    Container(
                                        color:  const Color(0xff17264D),
                                        height: 100,
                                        width: 100,
                                        child: Image.network(selectedGraphicCards[1]!.imageUrl)):
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          // selectedGraphicCards.length>1? Text('here!!! ${selectedGraphicCards[1]!.name}'):Container(),

                                          Container(
                                              color:  const Color(0xff17264D),
                                              height: 100,
                                              width: 100,
                                              child: Image.asset('assets/svg_icons/add_benchmark.png',
                                                color: Colors.white,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        color: Colors.transparent,
                                        height: 650,
                                        width: 115,
                                        child: selectedProcessors.length>1&&selectedProcessors.isNotEmpty? const Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),

                                            Text(
                                              'Clock speed',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Turbo speed',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Threads',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Cores',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):
                                        selectedGraphicCards.isNotEmpty&&selectedGraphicCards.length>1?const Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 18),
                                            ),
                                            Text(
                                              'Manufacturer',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Name',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Core Clock Speed',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              'Memory Bandwidth',
                                              style: TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):
                                        Container()
                                    ),
                                    Container(
                                      height: 650,
                                      width: 3,
                                      color: Colors.white70,
                                    ),
                                    Container(
                                        color: Colors.transparent,
                                        height: 650,
                                        width: 140,
                                        child: selectedProcessors.length>1&&selectedProcessors.isNotEmpty?Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${selectedProcessors[0]!.price}\$',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),

                                             Text(
                '${selectedProcessors[0]!.baseClockSpeed}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                             Text(
                                               '${selectedProcessors[0]!.boostClockSpeed}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                             Text(
                                            '${ selectedProcessors[0]!.threads}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                             Text(
                                              '${selectedProcessors[0]!.cores}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):
                                        selectedGraphicCards.isNotEmpty&&selectedGraphicCards.length>1? Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${selectedGraphicCards[0]!.price}\$',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),

                                            Text(
                                              selectedGraphicCards[0]!.manufacturer,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[0]!.name,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[0]!.coreClockSpeed,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[0]!.memoryBandwidth,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):Container()
                                    ),
                                    Container(
                                      height: 650,
                                      width: 3,
                                      color: Colors.white70,
                                    ),
                                    Container(
                                        color: Colors.transparent,
                                        height: 650,
                                        width: 160,
                                        child: selectedProcessors.length>1&&selectedProcessors.isNotEmpty?Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${selectedProcessors[1]!.price}\$',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),

                                            Text(
                                              '${selectedProcessors[1]!.baseClockSpeed}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              '${selectedProcessors[1]!.boostClockSpeed}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              '${ selectedProcessors[1]!.threads}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              '${selectedProcessors[1]!.cores}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):
                                        selectedGraphicCards.isNotEmpty&&selectedGraphicCards.length>1? Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${selectedGraphicCards[1]!.price}',
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[1]!.manufacturer,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[1]!.name,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[1]!.coreClockSpeed,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                            Text(
                                              selectedGraphicCards[1]!.memoryBandwidth,
                                              style: const TextStyle(
                                                  color: Colors.white70, fontSize: 16),
                                            ),
                                          ],
                                        ):Container()),
                                  ],
                                ),
                              )
                            ],
                          ),

                    ],
                                 );
                 }
               ),

        ));
  }
}

class ProcessorListDialog extends StatelessWidget {
  const ProcessorListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessorSelectionBloc,ProcessorSelectionState>(
        builder: (context, state1) {
          return  AlertDialog(
          backgroundColor: const Color(0xff17264D),
          title:  const Center(
              child: Text(
            'Select Processor',
            style: TextStyle(color: Colors.white70),
          )),
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:  BlocBuilder<FirebaseDataSourceBloc,FirebaseDataSourceState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () =>
              const Center(
                  child: CircularProgressIndicator()),
              loaded: (items) =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                            shrinkWrap: true, // Prevent excessive height for short lists
                            itemCount: items?.length,
                            itemBuilder: (context, index) {
                              final  selectedItem = items![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    state1.selectedProcessors.contains(selectedItem)?BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                        RemoveProcessorEvent(selectedItem)):
                                    BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                        AddProcessorEvent(selectedItem));
                                    // Dispatch an event to the Bloc with the selected processor
                                  },
                                    child: CardOfListDialog(items:items,index:index,
                                        containerColor:state1.selectedProcessors.contains(selectedItem)? Colors.black12:Colors.white)),
                              );
                            },
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                state1.selectedProcessors.isNotEmpty?   BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                    RemoveProcessorEvent(state1.selectedProcessors[0]!)):Container();
                                Navigator.pop(context);},
                              child: Container(
                                height: MediaQuery.of(context).size.height/16,
                                width: MediaQuery.of(context).size.height/9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff17264D),
                                ),
                                child: const Center(child: Text('Cancel',style: TextStyle(color: Colors.white70),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                if(state1.selectedProcessors.length < 2==true){
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                    const AlertDialog(content: Text('Please add another one !'),),);                                }else{
                                Navigator.pop(context);}},

                              child: Container(
                                height: MediaQuery.of(context).size.height/16,
                                width: MediaQuery.of(context).size.height/9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff17264D),
                                ),
                                child: const Center(child: Text('Done',style: TextStyle(color: Colors.white70),)),
                              ),
                            ),
                          ),

                        ],)
                    ],
                  ),
              error: (message) =>
                  Center(
                    child: Text(message),
                  ),
            );
          },
          )

          ),
        );
      }
    );
  }
}
class GraphicCardListDialog extends StatelessWidget {
  const GraphicCardListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Color containerColor = Colors.white; // Default color
    return BlocBuilder<ProcessorSelectionBloc,ProcessorSelectionState>(
        builder: (context, state1) {
          return  AlertDialog(
          backgroundColor: const Color(0xff17264D),
          title:  const Center(
              child: Text(
            'Select Graphic cards',
            style: TextStyle(color: Colors.white70),
          )),
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:  BlocBuilder<FirebaseDataSourceBloc,FirebaseDataSourceState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () =>
              const Center(
                  child: CircularProgressIndicator()),
              loaded: (items) =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                            shrinkWrap: true, // Prevent excessive height for short lists
                            itemCount: items?.length,
                            itemBuilder: (context, index) {
                               final selectedItem = items![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    state1.selectedGraphicCards.contains(selectedItem)?BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                        RemoveGraphicCardEvent(selectedItem)):
                                    BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                        AddGraphicCardEvent(selectedItem));
                                    // Dispatch an event to the Bloc with the selected processor
                                  },
                                    child: CardOfListDialog(items:items,index:index,containerColor:state1.selectedGraphicCards.contains(selectedItem)? Colors.black12:Colors.white)),
                              );
                            },
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                state1.selectedGraphicCards.isNotEmpty?   BlocProvider.of<ProcessorSelectionBloc>(context).add(
                                    RemoveGraphicCardEvent( state1.selectedGraphicCards[0]!)):Container();
                                Navigator.pop(context);},
                              child: Container(
                                height: MediaQuery.of(context).size.height/16,
                                width: MediaQuery.of(context).size.height/9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff17264D),
                                ),
                                child: const Center(child: Text('Cancel',style: TextStyle(color: Colors.white70),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                if(state1.selectedGraphicCards.length < 2==true){
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                    const AlertDialog(content: Text('Please add another one !'),),);}else{
                                  Navigator.pop(context);}},

                              child: Container(
                                height: MediaQuery.of(context).size.height/16,
                                width: MediaQuery.of(context).size.height/9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff17264D),
                                ),
                                child: const Center(child: Text('Done',style: TextStyle(color: Colors.white70),)),
                              ),
                            ),
                          ),

                        ],)
                    ],
                  ),
              error: (message) =>
                  Center(
                    child: Text(message),
                  ),
            );
          },
          )

          ),
        );
      }
    );
  }
}

class CardOfListDialog extends StatelessWidget {
  const CardOfListDialog({
    super.key,
    required this.containerColor,
    required this.items,
    required this.index,
  });

  final Color containerColor;
  final List<dynamic>? items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color:containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 4,
              child: Image.network(items![index].imageUrl),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  items![index].manufacturer,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  items![index].name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


