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
      title: Text("Belajar Responsip"),
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
                      height: MediaQueryHeight * 0.4,
                      width: MediaQueryWidth,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: MediaQueryHeight * 0.4,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return GridTile(
                              child: Container(
                            color: Colors.black,
                          ));
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: MediaQueryHeight * 0.3,
                      width: 300,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.1,
                    ),
                    Container(
                      height: MediaQueryHeight * 0.5,
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
