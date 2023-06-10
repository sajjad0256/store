import 'package:flutter/material.dart';
import 'package:store/model/plant.dart';

import '../const/constanse.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    List<Plant> myPlantList = Plant.plantList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myPlantList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Constance.myGreyLightTwo),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 70,
                              height: 100,
                              child: CircleAvatar(
                                backgroundColor: Constance.myGreenLightTwo,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset(
                                    myPlantList[index].imageURL,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              myPlantList[index].category.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              myPlantList[index].plantName.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        myPlantList[index].price.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'BTitrBd',
                            color: Constance.myGreenLight),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          'assets/images/PriceUnit-green.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
