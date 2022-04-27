import 'package:code_factory/screens/login_screen.dart';
import 'package:code_factory/screens/yourcourses_screen.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(top: 16), child: Text('Profile')),
      titleTextStyle: const TextStyle(
          color: Color(0xFF333333), fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _circleAvatar(),
          const SizedBox(height: 32),
          _button(() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => YourCourses()));
          }, 'Your Courses'),
          _button(() {}, 'Saved'),
          _button(() {}, 'Payment'),
          _logOut(),
          const SizedBox(height: 98),
        ],
      ),
    );
  }

  Widget _circleAvatar() {
    return const CircleAvatar(
      radius: 100,
      backgroundColor: Color(0xFF65AAEA),
      child: CircleAvatar(
        backgroundColor: Color(0xFFF8F2EE),
        radius: 94,
        backgroundImage: NetworkImage(
            'https://s3-alpha-sig.figma.com/img/34c8/8019/862a38dca31d58d82d0b0def4e0c67a7?Expires=1649635200&Signature=NKg6A6R1RtzmCcEwV0VbUu88w2EqQBet0Fgfi5FvYeBupiL3FoB-uzTCTSQF-~cHvNkFas61O7tBvJ~0Wx~KaBYoSfbxUU~B5MbErf71LFoXf9pIhQt3S9RtkKkrrM8eCYyA0RpSu7Zbo5H~4zebe72Ww-Q7awcNnaJLqeC8Pt-ysNep-0Zdq7tsN6jVPega~6e0Ny~GhyaEVFF3FMLyTzF8O51eRZzbUy94fswow7xUoNFR4pRw66HKorUno4YEi7mEJpV1vKsg2Yp8P9-jH8ZlvMPGDVWxzDtkfOwadVWmd9WoRJqQ4wTPmfy8RIrDP3Z--fTctm481ZUorYncSg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
      ),
    );
  }

  Widget _button(Function() onPressed, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
            side: MaterialStateProperty.all(
                const BorderSide(color: Color(0xFFBEBAB3))),
            fixedSize: MaterialStateProperty.all(const Size(200, 80)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.transparent)),
        onPressed: () => onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3C3A36)),
        ),
      ),
    );
  }

  Widget _logOut() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
      },
      child: const Center(
        child: Text(
          'Log out',
          style: TextStyle(
            color: Color(0xFF78746D),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
