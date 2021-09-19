import 'package:flutter/material.dart';
import 'package:share_pref_flutter/share_prefs.dart';
import 'package:share_pref_flutter/utilis/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialColor = 0xFF1ff707;

  late SharePrefsApp _sharePrefsApp;

  @override
  void initState() {
    _sharePrefsApp = SharePrefsApp();
    _sharePrefsApp.init().then((value) {
      setState(() {
        initialColor = _sharePrefsApp.getColor();
      });
    });
    super.initState();
  }

  setColor(int color) {
    setState(() {
      initialColor = color;
      _sharePrefsApp.setColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    colorCode.shuffle;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(initialColor),
        title: const Text('Çhange App Bar Color'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: listView(size),
      ),
    );
  }

  Widget listView(Size size) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: colorCode.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              setColor(colorCode[index]);
            },
            child: Container(
              height: 0,
              width: size.width * 0.8,
              color: Color(colorCode[index]),
            ),
          ),
        );
      },
    );
  }
}
