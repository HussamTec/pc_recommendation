import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pc_recommendation/features/home/domain/entities/accessories_other/case_accessory.dart';
import 'package:pc_recommendation/features/home/presentation/state_management/items_serach_bloc/items_search_bloc.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/add_to_build_btn.dart';
import 'package:pc_recommendation/features/home/presentation/widgets/item_card.dart';
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

class CaseAccessoriesScreen extends StatelessWidget {
  const CaseAccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavButtonSelectionCubit bloc = FavButtonSelectionCubit();
    final ItemsSearchBloc itemsSearchBloc = ItemsSearchBloc();
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                              itemsSearchBloc.add(
                                  SearchTextChanged(text, 'case_accessories'));
                            }),
                            // Add spacing (optional)
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child:
              BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                  bloc: itemsSearchBloc,
                  builder: (context, state2) {
                    return
                      BlocBuilder<
                          FavButtonSelectionCubit,
                          ButtonSelectionState>(
                        bloc: bloc,
                        builder: (context, state1) {
                          if (state2 is SearchSuccess && state2 is !SearchInitial) {
                            return
                              BlocBuilder<ItemsSearchBloc, ItemsSearchState>(
                                bloc: itemsSearchBloc,
                                builder: (context, state2) {
                                  if (state2 is SearchInitial) {
                                    return const Center(
                                      child: Text(''),
                                    );
                                  } else if (state2 is SearchLoading) {
                                    return const Center(child: CircularProgressIndicator());
                                  } else if (state2 is SearchSuccess) {
                                    final searchedItems = state2.suggestions;
                                    return ListView.builder(
                                      shrinkWrap: true, // Wrap content vertically
                                      itemCount: searchedItems.length,
                                      itemBuilder: (context, index) {
                                        bloc.getFavoritesIds();
                                        final isSelected = state1
                                            .selectedIndices
                                            .contains( searchedItems[index]['id']);
                                        final path = isSelected
                                            ? 'assets/svg_icons/starSelected.svg'
                                            : 'assets/svg_icons/starUnselected.svg';
                                        // Use item data to populate ItemCard widget
                                        return ItemCard(
                                          objectName: searchedItems[index]['name'],
                                          objectImageUrl: searchedItems[index]['imageUrl'],
                                          objectSpecs: searchedItems[index]['manufacturer'],
                                          objectPrice: searchedItems[index]['price'],
                                          favBtn:FavBtn(
                                            isSelected: isSelected,
                                            path: path,
                                            onTap: () {
                                              isSelected
                                              //Remove item from favorites
                                                  ? context.read<
                                                  FavoriteBloc>().add(
                                                  FavoriteEvent
                                                      .removeFavorite(
                                                      searchedItems[index]['id']))
                                                  : context.read<
                                                  FavoriteBloc>().add(
                                                  FavoriteEvent.addFavorite(
                                                      FavoriteEntity(
                                                          name:
                                                          searchedItems[index]['name'],
                                                          id: searchedItems[index]['id'],
                                                          manufacturer:
                                                          searchedItems[index]['manufacturer'],
                                                          price:searchedItems[index]['price'],
                                                          imageUrl:
                                                          searchedItems[index]['imageUrl'])));
                                            },
                                          ),
                                          addingToBuildBtn:AddToBuildBtn(
                                            addToBuildTap: () {
                                              context.read<CaseAccessoriesBloc>().add(SelectAccessoriesEvent(CaseAccessoryEntity.fromMap( searchedItems[index])));
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return const MySvgDialog();
                                                },
                                              );
                                            },),
                                          // ... other ItemCard configurations
                                        );
                                      },
                                    );
                                  } else if (state2 is SearchError) {
                                    return Center(
                                      child: Text('Error: ${state2.message}'),
                                    );
                                  } else {
                                    return const Center(child: Text('Unexpected state'));
                                  }
                                },
                              )   ;
                          } else {
                            return BlocBuilder<FirebaseDataSourceBloc,FirebaseDataSourceState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Container(),
                                  loading: () =>
                                  const Center(
                                      child: CircularProgressIndicator()),
                                  loaded: (caseAccessories) =>
                                      BlocBuilder<CaseAccessoriesBloc, CaseAccessoryEntity?>(
                                          builder: (context,selectedAccessory) {
                                            return ListView.builder(
                                              itemCount: caseAccessories!.length,
                                              itemBuilder: (context, index) {
                                                bloc.getFavoritesIds();
                                                final isSelected = state1
                                                    .selectedIndices
                                                    .contains(caseAccessories[index].id);
                                                final path = isSelected
                                                    ? 'assets/svg_icons/starSelected.svg'
                                                    : 'assets/svg_icons/starUnselected.svg';
                                                return ItemCard(
                                                  objectName: caseAccessories[index]
                                                      .name,
                                                  objectImageUrl: caseAccessories[index]!
                                                      .imageUrl,
                                                  objectSpecs: caseAccessories[index]!
                                                      .manufacturer,
                                                  objectPrice: caseAccessories[index]!
                                                      .price,
                                                  favBtn: FavBtn(
                                                    isSelected: isSelected,
                                                    path: path,
                                                    onTap: () {
                                                      isSelected
                                                      //Remove item from favorites
                                                          ? context.read<
                                                          FavoriteBloc>().add(
                                                          FavoriteEvent
                                                              .removeFavorite(
                                                              caseAccessories[index]!
                                                                  .id))
                                                          : context.read<
                                                          FavoriteBloc>().add(
                                                          FavoriteEvent.addFavorite(
                                                              FavoriteEntity(
                                                                  name:
                                                                  caseAccessories[index]
                                                                      .name,
                                                                  id: caseAccessories[index]
                                                                      .id,
                                                                  manufacturer:
                                                                  caseAccessories[index]
                                                                      .manufacturer,
                                                                  price: caseAccessories[index]
                                                                      .price,
                                                                  imageUrl:
                                                                  caseAccessories[index]
                                                                      .imageUrl)));
                                                    },
                                                  ),
                                                  addingToBuildBtn: AddToBuildBtn(
                                                    addToBuildTap: () {
                                                      context.read<CaseAccessoriesBloc>().add(SelectAccessoriesEvent(caseAccessories[index]));
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return const MySvgDialog();
                                                        },
                                                      );
                                                    },),);
                                              },
                                            );
                                          }
                                      ),
                                  error: (message) =>
                                      Center(
                                        child: Text(message),
                                      ),
                                );
                              },
                            );                            }

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
        child:
        Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(
            color: const Color(0xFF101B37),
            borderRadius: BorderRadius.circular(20), // Adjust the value for desired roundness
          ),
          child: SvgPicture.asset('assets/svg_icons/added_to_build.svg',height: 80,
            width: 130,), // Replace with your SVG path

        )
    );
  }
}