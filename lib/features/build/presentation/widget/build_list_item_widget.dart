import 'package:flutter/material.dart';

import '../../domain/entities/build_entity.dart';

//BuildListItem widget to display individual builds
class BuildListItem extends StatelessWidget {
  final BuildEntity buildEntity;

  const BuildListItem(this.buildEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 240,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Set the desired radius
          color: Colors.white, // Set background color (optional)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(buildEntity.name,style: const TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${buildEntity.price.toStringAsFixed(2)}\$",style: const TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${buildEntity.wattage}W",style: const TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Specify horizontal scroll direction

              child: Row(children: [
                buildEntity.processor?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.processor!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(buildEntity.processor!.name,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.graphicCard?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.graphicCard!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.graphicCard!.name, maxLines: 2,overflow:TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.monitor?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.monitor!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child:
                          Text(buildEntity.monitor!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.motherboard?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.motherboard!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.motherboard!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.ram?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.ram!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.ram!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.storage?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.storage!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.storage!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.pcCase?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.pcCase!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.pcCase!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
                buildEntity.powerSupply?.imageUrl!=null? SizedBox(
                    height: 140,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(buildEntity.powerSupply!.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(buildEntity.powerSupply!.name,
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,style: const TextStyle(fontSize: 15),),
                        )
                      ],
                    )):const SizedBox(),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
