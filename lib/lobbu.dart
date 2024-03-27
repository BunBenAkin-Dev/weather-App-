import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    return Scaffold(
      body: OrientationBuilder(builder: (builder, orientation) {
        return SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 110,
                height: 50,
                color: Colors.amber,
              ),
              Container(
                width: 110,
                height: 50,
                color: Colors.amber,
              ),
              Container(
                width: 110,
                height: 50,
                color: Colors.amber,
              )
            ],
          ),
        );

        // GridView.builder(
        //   itemCount: 8,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: orientation == Orientation.portrait ? 4 : 9,
        //       mainAxisSpacing: 3,
        //       crossAxisSpacing: 3,
        //       childAspectRatio: 2 / 2),
        //   itemBuilder: (ctx, index) {
        //     return Container(
        //       width: 50,
        //       height: 50,
        //       color: Colors.blue,
        //       child: Center(child: Text('${index + 1}')),
        //     );
        //   },
        // );
        //  Center(
        //   child: Container(
        //     color: orientation == Orientation.portrait
        //         ? Colors.blue
        //         : Colors.green,
        //     width: orientation == Orientation.portrait ? 200 : 300,
        //     height: orientation == Orientation.portrait ? 300 : 200,
        //     child: Center(
        //       child: Text(
        //         orientation == Orientation.portrait ? 'Portrait' : 'Landscape',
        //         style: TextStyle(fontSize: 24, color: Colors.white),
        //       ),
        //     ),
        //   ),
        // );
      }),
    );
  }
}
