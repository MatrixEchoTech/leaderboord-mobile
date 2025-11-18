import 'package:flutter/material.dart';


class GarageTabsPage extends StatelessWidget {
  const GarageTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F121A),

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: const Color(0xFF171C29),
            child: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 2,

              tabs: [
                Tab(
                  icon: ImageIcon(AssetImage("/images/garage.png")),
                  text: "Currently Owned (4)",
                ),
                Tab(
                  icon: ImageIcon(AssetImage("/images/subscription.png")),
                  text: "Previously Owned (1)",
                ),
              ],
            ),
          ),
        ),

        body: const TabBarView(
          children: [
            CurrentlyOwnedTabContent(),
            PreviouslyOwnedTabContent(),
          ],
        ),
      ),
    );
  }
}

class CurrentlyOwnedTabContent extends StatelessWidget {
  const CurrentlyOwnedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Currently Owned Cars List Here",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class PreviouslyOwnedTabContent extends StatelessWidget {
  const PreviouslyOwnedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Previously Owned Cars List Here",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
