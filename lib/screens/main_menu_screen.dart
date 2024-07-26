import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  String first = '';

  @override
  void initState() {
    // final box = GetStorage();
    // first = box.read('first') ?? '';
    // if (first == '') {
    //   widget.game.overlays.add('policy');
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.game.pauseEngine();
    widget.game.bird.getMute();
    widget.game.bird.getBestScore();

    // bool isAccepted = false;
    // bool isChecked = false;
    // String first = '';

    // final box = GetStorage();
    // first = box.read('first') ?? '';
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   if (first == '') {
    //     return showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (ctx) => Builder(builder: (context) {
    //         return StatefulBuilder(
    //           builder: (context, StateSetter setState) {
    //             return AlertDialog(
    //               title: const Text(
    //                 'Privacy Policy',
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   color: Colors.white,
    //                   fontFamily: 'Game',
    //                 ),
    //               ),
    //               // const CustomText(
    //               //   text: 'Privacy Policy',
    //               //   fontWeight: FontWeight.w500,
    //               // ),
    //               content: SizedBox(
    //                 height: MediaQuery.of(context).size.height * 0.70,
    //                 child: SingleChildScrollView(
    //                     child: Column(
    //                   children: [
    //                     Text(
    //                       Global.policy,
    //                       style: const TextStyle(
    //                         fontSize: 12,
    //                         color: Colors.white,
    //                         fontFamily: 'Game',
    //                       ),
    //                       // style: const TextStyle(fontSize: 12)
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Checkbox(
    //                           shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(6)),
    //                           activeColor: Colors.green,
    //                           side: BorderSide(
    //                             width: 1.5,
    //                             color: isChecked ? Colors.green : Colors.black,
    //                           ),
    //                           value: isChecked,
    //                           onChanged: (bool? value) {
    //                             setState(() {
    //                               isChecked = value!;
    //                               if (isChecked) {
    //                                 isAccepted = true;
    //                               } else {
    //                                 isAccepted = false;
    //                               }
    //                             });
    //                           },
    //                         ),
    //                         const Text(
    //                           'I agreed to the Privacy Policy.',
    //                           style: TextStyle(
    //                             fontSize: 12,
    //                             color: Colors.white,
    //                             fontFamily: 'Game',
    //                           ),
    //                         ),
    //                         // const CustomText(
    //                         //   text: 'I agreed to the Privacy Policy.',
    //                         //   size: 12,
    //                         // )
    //                       ],
    //                     ),
    //                     ElevatedButton(
    //                       child: const Text(
    //                         'Accept',
    //                         style: TextStyle(
    //                           fontSize: 12,
    //                           color: Colors.white,
    //                           fontFamily: 'Game',
    //                         ),
    //                       ),
    //                       // CustomText(
    //                       //   text: 'Accept',
    //                       //   size: 14,
    //                       //   textColor: Colors.white,
    //                       // ),
    //                       onPressed: isAccepted
    //                           ? () {
    //                               final box = GetStorage();
    //                               box.write('first', 'notfirst');
    //                               Navigator.pop(context);
    //                             }
    //                           : null,
    //                     ),
    //                   ],
    //                 )),
    //               ),
    //             );
    //           },
    //         );
    //       }),
    //     );
    //   }
    // });

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.game.overlays.remove('mainMenu');
          widget.game.resumeEngine();
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        widget.game.overlays.add('setting');
                      },
                      child: Image.asset(
                        "assets/images/settings.webp",
                        width: 45,
                        height: 45,
                        color: Colors.brown,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/bird.webp",
                      width: 100,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/bird.webp",
                          width: 100,
                          height: 100,
                        ),
                        Image.asset(
                          "assets/images/bird.webp",
                          width: 100,
                          height: 100,
                        ),
                      ],
                    )
                  ],
                ),
                const Text(
                  'Flying Bird',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'Game',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                const Text(
                  'Tap to start',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.brown,
                    fontFamily: 'Game',
                  ),
                ),
              ],
            )
            // Image.asset(Assets.message),
            ),
      ),
    );
  }
}
