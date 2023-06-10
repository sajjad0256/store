import 'package:flutter/material.dart';
import '../const/constanse.dart';
import '../model/plant.dart';

class MyCard extends StatefulWidget {
  final List<Plant> addCard;
  const MyCard({super.key, required this.addCard});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    List<Plant> plantsList = Plant.addedToCartPlants();
    final plantItem = plantsList.map((e) => e.price);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constance.myWhite,
      body: Center(
        child: widget.addCard.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    Text(
                      'سبد خرید خالی می باشد',
                      style: TextStyle(
                        fontSize: 25,
                        color: Constance.myGreen,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.addCard.length,
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
                                          backgroundColor:
                                              Constance.myGreenLightTwo,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Image.asset(
                                              widget.addCard[index].imageURL,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 180),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.addCard[index].category
                                            .toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        widget.addCard[index].plantName
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  widget.addCard[index].price.toString(),
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
                  Divider(
                    color: Constance.myGreyLightTwo,
                    height: 4,
                    indent: 20,
                    thickness: 1,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 8,
                      left: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset(
                                  'assets/images/PriceUnit-green.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                plantItem.fold(0, (a, b) => a + b).toString(),
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'BTitrBd',
                                    color: Constance.myGreenLight),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'جمع کل',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'BTitrBd',
                              color: Constance.myBlack),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
