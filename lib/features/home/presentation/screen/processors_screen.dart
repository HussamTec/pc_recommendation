// presentation/graphicCards/graphicCards_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/home/domain/entities/browse_parts/processor_entity.dart';
import 'package:pc_recommendation/features/home/presentation/state_management/items_serach_bloc/items_search_bloc.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/add_to_build_btn.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/item_card.dart';
import '../../../../utils/url_launcher/url_launcher.dart';
import '../../../build/presentation/state_management/build_item_provider/build_bloc.dart';
import '../../../build/presentation/state_management/build_item_provider/build_event.dart';
import '../../../favorite_list/domain/entities/favorite_entity.dart';
import '../../../favorite_list/presentation/state_management/fav_button_state_management/button_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_bloc.dart';
import '../../../favorite_list/presentation/state_management/favorite_bloc/favorite_event.dart';
import '../../../favorite_list/presentation/state_management/widget/fav_btn_widget.dart';
import '../state_management/firebase_data_bloc/firebase_data_bloc.dart';
import '../state_management/firebase_data_bloc/firebase_data_states.dart';
import '../widgets/search_bar_widget.dart';

class ProcessorsScreen extends StatelessWidget {
  const ProcessorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavButtonSelectionCubit bloc = FavButtonSelectionCubit();
    final ItemsSearchBloc itemsSearchBloc = ItemsSearchBloc();
    final UrlLauncher urlLauncher = UrlLauncher();

    return Scaffold(
      backgroundColor: const Color(0xFF101B37),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                color: const Color(0xFF17264D),
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svg_icons/blackBackButton.svg',
                          height: 30,
                          width: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                      child: SizedBox(
                        height: 200,
                        width: 350,
                        child: Column(
                          children: [
                            SearchBarWidget(onChanged: (text) {
                              itemsSearchBloc
                                  .add(SearchTextChanged(text, 'processors'));
                            }),
                            // Add spacing (optional)
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                  bloc: itemsSearchBloc,
                  builder: (context, state2) {
                    return BlocBuilder<FavButtonSelectionCubit,
                        ButtonSelectionState>(
                      bloc: bloc,
                      builder: (context, state1) {
                        if (state2 is SearchSuccess &&
                            state2 is! SearchInitial) {
                          return BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                            bloc: itemsSearchBloc,
                            builder: (context, state2) {
                              if (state2 is SearchInitial) {
                                return const Center(
                                  child: Text(''),
                                );
                              } else if (state2 is SearchLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state2 is SearchSuccess) {
                                final searchedItems = state2.suggestions;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  // Wrap content vertically
                                  itemCount: searchedItems.length,
                                  itemBuilder: (context, index) {
                                    bloc.getFavoritesIds();
                                    final isSelected = state1.selectedIndices
                                        .contains(searchedItems[index]['id']);
                                    final path = isSelected
                                        ? 'assets/svg_icons/starSelected.svg'
                                        : 'assets/svg_icons/starUnselected.svg';
                                    // Use item data to populate ItemCard widget
                                    return GestureDetector(
                                      onTap: () async {
                                        await urlLauncher.launchPage(
                                            searchedItems[index]['pageUrl']);
                                      },
                                      child: ItemCard(
                                        objectName: searchedItems[index]
                                            ['name'],
                                        objectImageUrl: searchedItems[index]
                                            ['imageUrl'],
                                        objectSpecs: searchedItems[index]
                                            ['manufacturer'],
                                        objectPrice: searchedItems[index]
                                            ['price'],
                                        favBtn: FavBtn(
                                          isSelected: isSelected,
                                          path: path,
                                          onTap: () {
                                            isSelected
                                                //Remove item from favorites
                                                ? context.read<FavoriteBloc>().add(
                                                    FavoriteEvent.removeFavorite(
                                                        searchedItems[index]
                                                            ['id']))
                                                : context.read<FavoriteBloc>().add(
                                                    FavoriteEvent.addFavorite(FavoriteEntity(
                                                        name: searchedItems[index]
                                                            ['name'],
                                                        id: searchedItems[index]
                                                            ['id'],
                                                        manufacturer: searchedItems[index]
                                                            ['manufacturer'],
                                                        price:
                                                            searchedItems[index]
                                                                ['price'],
                                                        imageUrl:
                                                            searchedItems[index]
                                                                ['imageUrl'])));
                                          },
                                        ),
                                        addingToBuildBtn: AddToBuildBtn(
                                          addToBuildTap: () {
                                            context.read<ProcessorBloc>().add(
                                                SelectProcessorEvent(
                                                    ProcessorEntity.fromMap(
                                                        searchedItems[index])));
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const MySvgDialog();
                                              },
                                            );
                                          },
                                        ),
                                        // ... other ItemCard configurations
                                      ),
                                    );
                                  },
                                );
                              } else if (state2 is SearchError) {
                                return Center(
                                  child: Text('Error: ${state2.message}'),
                                );
                              } else {
                                return const Center(
                                    child: Text('Unexpected state'));
                              }
                            },
                          );
                        } else {
                          return BlocBuilder<FirebaseDataSourceBloc,
                              FirebaseDataSourceState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => Container(),
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                loaded: (processors) => BlocBuilder<
                                        ProcessorBloc, ProcessorEntity?>(
                                    builder: (context, processor) {
                                  return ListView.builder(
                                    itemCount: processors!.length,
                                    itemBuilder: (context, index) {
                                      bloc.getFavoritesIds();
                                      final isSelected = state1.selectedIndices
                                          .contains(processors[index].id);

                                      final path = isSelected
                                          ? 'assets/svg_icons/starSelected.svg'
                                          : 'assets/svg_icons/starUnselected.svg';

                                      return GestureDetector(
                                        onTap: () async {
                                          await urlLauncher.launchPage(
                                              processors[index].pageUrl);
                                        },
                                        child: ItemCard(
                                          objectName: processors[index].name,
                                          objectImageUrl:
                                              processors[index]!.imageUrl,
                                          objectSpecs:
                                              processors[index]!.manufacturer,
                                          objectPrice: processors[index]!.price,
                                          favBtn: FavBtn(
                                            isSelected: isSelected,
                                            path: path,
                                            onTap: () {
                                              isSelected
                                                  //Remove item from favorites
                                                  ? context.read<FavoriteBloc>().add(FavoriteEvent.removeFavorite(processors[index]!.id))
                                                  : context.read<FavoriteBloc>().add(FavoriteEvent.addFavorite(
                                                  FavoriteEntity(
                                                          name: processors[index].name,
                                                          id: processors[index]
                                                                  .id,
                                                          manufacturer:
                                                              processors[index]
                                                                  .manufacturer,
                                                          price:
                                                              processors[index]
                                                                  .price,
                                                          imageUrl:
                                                              processors[index]
                                                                  .imageUrl)));
                                            },
                                          ),
                                          addingToBuildBtn: AddToBuildBtn(
                                            addToBuildTap: () {
                                              context.read<ProcessorBloc>().add(SelectProcessorEvent(
                                                      processors[index]));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const MySvgDialog();
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                                error: (message) => Center(
                                  child: Text(message),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MySvgDialog extends StatelessWidget {
  const MySvgDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
    return Center(
        child: Container(
      height: 80,
      width: 130,
      decoration: BoxDecoration(
        color: const Color(0xFF101B37),
        borderRadius:
            BorderRadius.circular(20), // Adjust the value for desired roundness
      ),
      child: SvgPicture.asset(
        'assets/svg_icons/added_to_build.svg',
        height: 80,
        width: 130,
      ), // Replace with your SVG path
    ));
  }
}
