import 'package:flutter_switch/flutter_switch.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  final FlappyBirdGame game;

  const SettingScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) => Material(
        color: Colors.brown,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sound',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Game',
                    ),
                  ),
                  const SizedBox(width: 70),
                  FlutterSwitch(
                    padding: 1.5,
                    height: 23,
                    width: 44,
                    inactiveColor: Colors.grey, //const Color(0xFFE0E0E0),
                    activeColor: Colors.green,
                    value: widget.game.bird.isNotMuted,
                    onToggle: (val) {
                      setState(() {
                        widget.game.bird.muteUnmute(val);
                      });
                      // soundController.vibrate();
                      // soundController.isMuted.value = val;
                      // soundController.muteUnmute();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'version : 1.0.0',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    widget.game.overlays.remove('setting');
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flying_bird/game/flappy_bird_game.dart';

// class SettingScreen extends StatelessWidget {
//   final FlappyBirdGame game;
//   static const String id = 'setting';
//   const SettingScreen({super.key, required this.game});

//   @override
//   Widget build(BuildContext context) {
//     game.pauseEngine();
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           // game.overlays.remove('mainMenu');
//           // game.resumeEngine();
//         },
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/background.webp"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Row(
//               children: [
//                 Text(
//                   'Sounds',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     fontFamily: 'Game',
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//           //     Column(
//           //       children: [
//           //         GestureDetector(
//           //             onTap: () {
//           //               game.overlays.remove('mainMenu');
//           //               game.overlays.add('settings');
//           //             },
//           //             child: const Icon(Icons.settings, color: Colors.black)),
//           //         Image.asset(
//           //           "assets/images/bird.webp",
//           //           width: 100,
//           //           height: 100,
//           //         ),
//           //         Row(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           children: [
//           //             Image.asset(
//           //               "assets/images/bird.webp",
//           //               width: 100,
//           //               height: 100,
//           //             ),
//           //             Image.asset(
//           //               "assets/images/bird.webp",
//           //               width: 100,
//           //               height: 100,
//           //             ),
//           //           ],
//           //         )
//           //       ],
//           //     ),
//           //     Text(
//           //       'Flying Bird',
//           //       style: const TextStyle(
//           //         fontSize: 40,
//           //         color: Colors.white,
//           //         fontFamily: 'Game',
//           //       ),
//           //     ),
//           //     SizedBox(height: MediaQuery.of(context).size.height * 0.2),
//           //     Text(
//           //       'Tap to start',
//           //       style: const TextStyle(
//           //         fontSize: 25,
//           //         color: Colors.brown,
//           //         fontFamily: 'Game',
//           //       ),
//           //     ),
//           //   ],
//           // )
//           // Image.asset(Assets.message),
//         ),
//       ),
//     );
//   }
// }
