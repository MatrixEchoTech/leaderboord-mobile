import 'package:flutter/material.dart';

AppBar customAppBar({
  required VoidCallback onLogoTap,
  required VoidCallback onProfileTap,
}) {
  return AppBar(
 
    elevation: 0,
    leadingWidth: 170,
    leading: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: onLogoTap, // call the callback instead of Navigator.push
        child: SizedBox(
          child: Image.asset(
            "/images/newLogo.png",
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
    centerTitle: false,
    title: const SizedBox(),
    actions: [
      GestureDetector(
        onTap: onProfileTap,
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          child: const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("/images/user2.png"),
          ),
        ),
      ),
    ],
  );
}
