import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/pilih_tiket_controller.dart';

class PilihTiketView extends GetView<PilihTiketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: context.mediaQueryPadding.top,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 100,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Your\nSeat",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Commuter Line (A)",
                      ),
                      Text(
                        "Wagon 1 -3A",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ItemStatus(
                    status: "Available",
                    color: Colors.white,
                  ),
                  ItemStatus(
                    status: "Filled",
                    color: Colors.orange,
                  ),
                  ItemStatus(
                    status: "Selected",
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wagon",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "A",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "B",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "C",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "D",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "E",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Obx(() => Column(
                                      children: List.generate(
                                        6,
                                        (index) => GestureDetector(
                                          onTap: () =>
                                              controller.gantiGerbong(index),
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            height: 150,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black38),
                                                color: controller.indexGerbong
                                                            .value ==
                                                        index
                                                    ? Color(0xFF656CEE)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // children: [

                                      // ],
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                child: Obx(
                                  () => GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                    itemCount: controller
                                        .gerbong[controller.indexGerbong.value]
                                        .length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () =>
                                          controller.selectKursi(index),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          color: controller.gerbong[controller
                                                          .indexGerbong.value]
                                                      [index]["status"] ==
                                                  "available"
                                              ? Colors.white
                                              : controller.gerbong[controller
                                                              .indexGerbong
                                                              .value][index]
                                                          ["status"] ==
                                                      "filled"
                                                  ? Colors.orange
                                                  : Colors.indigo,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "SELECT YOUR SEAT",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.9, 30),
                    backgroundColor: Colors.indigo,
                    elevation: 20,
                    overlayColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    super.key,
    required this.status,
    required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(status),
      ],
    );
  }
}
