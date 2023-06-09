import 'package:flutter/material.dart';
import 'package:store/const/constanse.dart';

import '../model/plant.dart';

class MyDetails extends StatefulWidget {
  final int plantId;
  const MyDetails({super.key, required this.plantId});

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  List<Plant> myPlants = Plant.plantList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constance.myWhite,
      //appBar
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Constance.myWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Constance.myWhiteTwo,
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Constance.myGreenLightTwo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Constance.myWhiteTwo,
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Constance.myGreenLightTwo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //body
      body: Stack(
        children: [
          //details Plantes
          Positioned(
            right: 30,
            top: 25,
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  Constance.sizePlant,
                  style: TextStyle(
                      fontSize: Constance.sizeTitleAppbar,
                      fontFamily: 'Lalezar',
                      color: Constance.myGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    myPlants[widget.plantId].size,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BTitrBd',
                      color: Constance.myGreenLightTwo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Constance.humidity,
                  style: TextStyle(
                      fontSize: Constance.sizeTitleAppbar,
                      fontFamily: 'Lalezar',
                      color: Constance.myGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    myPlants[widget.plantId].humidity.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BTitrBd',
                      color: Constance.myGreenLightTwo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Constance.temperature,
                  style: TextStyle(
                      fontSize: Constance.sizeTitleAppbar,
                      fontFamily: 'Lalezar',
                      color: Constance.myGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    myPlants[widget.plantId].temperature.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BTitrBd',
                      color: Constance.myGreenLightTwo,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //image Plants
          Positioned(
            left: 20,
            top: 40,
            child: Image.asset(
              myPlants[widget.plantId].imageURL,
              width: 300,
              height: 420,
            ),
          ),
          //bottom Details
          Positioned(
            bottom: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Constance.myGreenLight.withOpacity(0.4),
              ),
              width: size.width,
              height: size.height * 0.47,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //name plants
                  SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        myPlants[widget.plantId].plantName,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Lalezar',
                            fontWeight: FontWeight.bold,
                            color: Constance.myGreenLight),
                      ),
                    ),
                  ),
                  // rate and price
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Constance.myGreen,
                              size: 40,
                            ),
                            Text(
                              myPlants[widget.plantId].rating.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'BTitrBd',
                                  fontWeight: FontWeight.bold,
                                  color: Constance.myBlackLight),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/PriceUnit-green.png',
                              width: 40,
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                myPlants[widget.plantId].price.toString(),
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'BTitrBd',
                                    fontWeight: FontWeight.bold,
                                    color: Constance.myBlackLight),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //description
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      myPlants[widget.plantId].decription,
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Lalezar',
                        fontWeight: FontWeight.bold,
                        color: Constance.myBlackLight,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  //shoping card
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Constance.myGreenLightTwo),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Constance.myWhite,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constance.myGreenLight.withOpacity(0.8),
                          ),
                          height: 50,
                          width: size.width * 0.7,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                Constance.addToCard,
                                style: TextStyle(
                                    color: Constance.myWhite,
                                    fontSize: 22,
                                    fontFamily: 'Lalezar'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
