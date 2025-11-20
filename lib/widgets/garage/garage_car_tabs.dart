import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/garage/currently_owned.dart';

class GarageTabsPage extends StatelessWidget {
  const GarageTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            child: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 2,
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(AssetImage("images/garage-car.png")),
                      SizedBox(width: 8),
                      Text("Currently Owned (4)"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(AssetImage("images/subscription.png")),
                      SizedBox(width: 8),
                      Text("Previously Owned(1)"),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [CurrentlyOwnedTabContent(), PreviouslyOwnedTabContent()],
        ),
      ),
    );
  }
}

class CurrentlyOwnedTabContent extends StatelessWidget {
  const CurrentlyOwnedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 15, bottom: 35),
      children: [
        GarageCarCard(
          imagePath: "images/car1.png",
          carName: "Nissan GT-R R35 – The Beast",
          horsepower: 23,
          zeroToSixty: "4",
          torque: 24,
          topSpeed: "23",
        ),
        GarageCarCard(
          imagePath: "images/view3.png",
          carName: "Nissan GT-R R35 – The Beast",
          horsepower: 23,
          zeroToSixty: "4",
          torque: 24,
          topSpeed: "23",
        ),
      ],
    );
  }
}

class PreviouslyOwnedTabContent extends StatelessWidget {
  const PreviouslyOwnedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 15, bottom: 35),
      children: [
        GarageCarCard(
          imagePath: "images/view2.png",
          carName: "Nissan GT-R R35 – The Beast",
          horsepower: 23,
          zeroToSixty: "4",
          torque: 24,
          topSpeed: "23",
        ),
        GarageCarCard(
          imagePath: "images/car1.png",
          carName: "Nissan GT-R R35 – The Beast",
          horsepower: 23,
          zeroToSixty: "4",
          torque: 24,
          topSpeed: "23",
        ),
      ],
    );
  }
}