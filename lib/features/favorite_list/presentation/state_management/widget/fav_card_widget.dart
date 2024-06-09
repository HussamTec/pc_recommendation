import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavCardWidget extends StatelessWidget {
  final String imageUrl;
  final String manufacturer;
  final String name;
  final String path;
  final dynamic price;
  final void Function()? onTap;

  const FavCardWidget({
    required this.imageUrl,
    required this.manufacturer,
    required this.name,
    required this.path,
    required this.price,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,13.0,15,13),
      child: Container(height: 170,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
          child: Row(
            children: [
              SizedBox(
                  height: 160,
                  width: 160,
                  child:
                  Image.network(imageUrl)),
              SizedBox(
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            manufacturer,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.black),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 60,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '$price\$',
                        style: const TextStyle(
                            fontSize: 30, color: Colors.green,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],),
              ),
              GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,10,0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(path,height: 40,width: 40,)),
                ),
              )
            ],)
      ),
    );
  }
}
