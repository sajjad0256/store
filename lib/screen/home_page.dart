import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store/const/constanse.dart';
import 'package:store/model/plant.dart';
import 'package:store/screen/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedItem = 0;
  final List<String> _plantsType = [
    '|پیشنهادی|',
    '|آپارتمانی|',
    '|محل کار|',
    '|گل باغچه ای|',
    '|گل سمی|',
  ];

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  final List<Plant> myPlantList = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constance.myWhite,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //search bar
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Constance.myGreyLightTwo,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            showCursor: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Constance.search,
                              hintStyle: TextStyle(
                                  fontSize: 18, color: Constance.myBlack),
                            ),
                          ),
                        ),
                        const Icon(Icons.mic),
                      ],
                    ),
                  ),
                ),
              ),
              //category
              Container(
                padding: const EdgeInsets.only(right: 5),
                width: size.width,
                height: 70,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantsType.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedItem = index;
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 6),
                        child: Text(
                          _plantsType[index],
                          style: TextStyle(
                              fontFamily: 'BTitrBd',
                              fontWeight: selectedItem == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: selectedItem == index
                                  ? Constance.myGreen
                                  : Constance.myGrey,
                              fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //product
              SizedBox(
                width: size.width,
                height: size.height * 0.3,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: myPlantList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                              child: MyDetails(
                                plantId: myPlantList[index].plantId,
                              ),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constance.myGreenLightTwo,
                          ),
                          width: 200,
                          child: Stack(
                            children: [
                              //fav
                              Positioned(
                                right: 20,
                                top: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Constance.myWhite,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          bool isFavorite = toggleIsFavorite(
                                              myPlantList[index].isFavorated);
                                          myPlantList[index].isFavorated =
                                              isFavorite;
                                        },
                                      );
                                    },
                                    icon: myPlantList[index].isFavorated == true
                                        ? Icon(
                                            Icons.favorite,
                                            color: Constance.myGreen,
                                          )
                                        : Icon(
                                            Icons.favorite_border_outlined,
                                            color: Constance.myGreen,
                                          ),
                                  ),
                                ),
                              ),
                              //flower
                              Positioned(
                                right: 25,
                                bottom: 20,
                                child: Text(
                                  myPlantList[index].plantName,
                                  style: TextStyle(
                                    color: Constance.myWhite,
                                    fontFamily: 'BTitrBd',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              //category
                              Positioned(
                                right: 25,
                                bottom: 50,
                                child: Text(
                                  myPlantList[index].category,
                                  style: TextStyle(
                                    color: Constance.myGreyLight,
                                    fontFamily: 'Lalezar',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              //price
                              Positioned(
                                bottom: 20,
                                left: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Constance.myWhite,
                                  ),
                                  height: 30,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                        '\$ ${myPlantList[index].price.toString()}'),
                                  ),
                                ),
                              ),
                              //pic
                              Positioned(
                                top: 45,
                                left: 38,
                                child: SizedBox(
                                  width: 120,
                                  height: 140,
                                  child: Image.asset(
                                    myPlantList[index].imageURL,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //title Flower
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Text(
                      Constance.titleHome,
                      style: TextStyle(
                          fontSize: Constance.sizeTitle, fontFamily: 'Lalezar'),
                    ),
                  ),
                ],
              ),
              //list News Plants
              SizedBox(
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
                                      backgroundColor:
                                          Constance.myGreenLightTwo,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
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
                              padding:
                                  const EdgeInsets.only(top: 20, left: 180),
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
            ],
          ),
        ),
      ),
    );
  }
}
