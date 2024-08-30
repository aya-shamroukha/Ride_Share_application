import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/feature/auth/pages/login_screen.dart';
import 'package:ride_application/feature/auth/pages/signup_screen.dart';
import 'package:ride_application/feature/home/pages/home_screen.dart';

import '../../profile/pages/change_password.dart';
import '../../profile/pages/profile_screen.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({super.key});
  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int selectedindex = 0;
  var screen = [
    const HomeScreen(),
    const LogInScreen(),
    const SignUpScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(100)),
          child: FloatingActionButton(
            backgroundColor: AppColor.primary,
            onPressed: () {},
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(width: 2, color: AppColor.white)),
            child: const Icon(
              Icons.wallet,
              color: AppColor.white,
            ),
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: selectedindex,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.grey,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedindex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Offer',
                icon: Icon(Icons.local_offer),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              )
            ]),
      ),
      body: screen[selectedindex],
    );
  }
}

// class HexagonButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: HexagonClipper(),
//       child: Container(
//         color: Colors.green,
//         height: 60,
//         width: 60,
//         child: Icon(Icons.account_balance_wallet, color: Colors.white),
//       ),
//     );
//   }
// }

// class HexagonClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double width = size.width;
//     double height = size.height;
//     Path path = Path()
//       ..moveTo(width * 0.5, 0)
//       ..lineTo(width, height * 0.25)
//       ..lineTo(width, height * 0.75)
//       ..lineTo(width * 0.5, height)
//       ..lineTo(0, height * 0.75)
//       ..lineTo(0, height * 0.25)
//       ..close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
