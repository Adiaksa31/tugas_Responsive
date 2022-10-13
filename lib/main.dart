import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //function agar tidak bisa di rotate
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text("Belajar Responsive"),
    );

    final bodyHeight = MediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        appBar: myAppBar,
        body: Center(
          child: (islandscape)
              ? Column(
                  children: [
                    Container(
                      height: MediaQueryHeight * 0.1,
                      width: 300,
                      color: Colors.blueGrey,
                      child: FittedBox(
                        child: Text("FittedBox"),
                      ),
                    ),
                    Container(
                      height: MediaQueryHeight * 0.1,
                      width: 300,
                      color: Colors.blueGrey,
                      child: FittedBox(
                        child: Text(
                            "FittedBox00000000000000000000000000000000000"),
                      ),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Text("hallo ")),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.red,
                              child: Text("hallo")),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Text("hallo")),
                        )
                      ],
                    )),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Center(child: Text("Expanded"))),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.red,
                              child: Center(child: Text("Expanded"))),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Center(child: Text("Expanded"))),
                        )
                      ],
                    )),
                    Container(
                      height: MediaQueryHeight * 0.2,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text("data"),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: MediaQueryHeight * 0.1,
                      width: 300,
                      color: Colors.blueGrey,
                      child: FittedBox(
                        child: Text("FittedBox"),
                      ),
                    ),
                    Container(
                      height: MediaQueryHeight * 0.1,
                      width: 300,
                      color: Colors.blueGrey,
                      child: FittedBox(
                        child: Text(
                            "FittedBox00000000000000000000000000000000000"),
                      ),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Text("flexible")),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.red,
                              child: Text("flexible")),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Text("flexible")),
                        )
                      ],
                    )),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Center(child: Text("Expanded"))),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.red,
                              child: Center(child: Text("Expanded"))),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                              height: MediaQueryHeight * 0.2,
                              color: Colors.blue,
                              child: Center(child: Text("Expanded"))),
                        )
                      ],
                    )),
                    Container(
                      height: MediaQueryHeight * 0.3,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text("data"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ));
  }
}
