import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Padding(
          padding: EdgeInsets.only(top: 16), child: Text('Settings')),
      titleTextStyle: const TextStyle(
          color: Color(0xFF333333), fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/settings.png'),
              const SizedBox(height: 16),
              _switchListTile(),
              const SizedBox(height: 16),
              const Text(
                'Account information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3C3A36)),
              ),
              const SizedBox(height: 16),
              _listTile(
                  'assets/icons/settings_name.svg', 'Name', 'Juana Antonieta',
                  () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Container(
                          color: Colors.teal,
                        )));
              }),
              const SizedBox(height: 16),
              _listTile('assets/icons/settings_email.svg', 'Email',
                  'juana.antonieta@email.com', () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Container(
                          color: Colors.yellowAccent,
                        )));
              }),
              const SizedBox(height: 16),
              _listTile('assets/icons/settings_password.svg', 'Password',
                  'changed 2 weeks ago', () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Container(
                          color: Colors.green,
                        )));
              }),
              const SizedBox(height: 16),
            ],
          )
        ],
      ),
    );
  }

  Widget _switchListTile() {
    return SizedBox(
      height: 80,
      child: SwitchListTile(
        activeColor: const Color(0xFF5BA092),
        inactiveThumbColor: const Color(0xFFBEBAB3),
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 12),
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFFBEBAB3),
            ),
            borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF3C3A36),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        secondary: SvgPicture.asset('assets/icons/settings_notification.svg'),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }

  Widget _listTile(
      String leading, String title, String subtitle, Function onTap) {
    return SizedBox(
      height: 80,
      child: ListTile(
        onTap: () => onTap(),
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFFBEBAB3),
            ),
            borderRadius: BorderRadius.circular(16)),
        leading: SvgPicture.asset(leading),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF3C3A36),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              color: Color(0xFF78746D),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Color(0xFFBEBAB3),
        ),
      ),
    );
  }
}
