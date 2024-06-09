import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.objectName,
    required this.objectImageUrl,
    required this.objectSpecs,
    required this.objectPrice,
    required this.favBtn,
    required this.addingToBuildBtn,
  });

  final String? objectName;
  final String? objectImageUrl;
  final String? objectSpecs;
  final dynamic objectPrice;
  final Widget favBtn;
  final Widget addingToBuildBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10,20,100),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF17264D),
                    borderRadius:
                    BorderRadius.circular(20), // Set border radius
                  ),
                  width: 400,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(225, 20, 5, 20),
                    child: SizedBox(
                      height: 250,

                      ///Name, name, base clock speed, boost clock speed, price
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 85,
                              child: Text(
                                objectName!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                          SizedBox(
                            height: 130,
                            child: Text(
                              objectSpecs!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                '$objectPrice\$',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.green),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Stack(
                  ///Image container
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius:
                          BorderRadius.circular(20), // Set border radius
                        ),
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5,15.0,5,10),
                          child: Image.network(objectImageUrl!),
                        ),
                      ),

                      ///Favorite functionality
                      Positioned(
                        top: 10,
                        left: 160,
                        child: favBtn,
                      )
                    ]),
              ),

              /// Add to build functionality
              Positioned(
                  top: 230,
                  left: 17,
                  bottom: 7,
                  child: addingToBuildBtn,)
            ],
          ),
        ],
      ),
    );
  }
}
