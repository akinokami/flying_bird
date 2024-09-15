import 'package:flutter_switch/flutter_switch.dart';
import 'package:flying_bird/controller/language_controller.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  final FlappyBirdGame game;

  const SettingScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) => Material(
        color: Colors.brown,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'setting'.tr,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Game',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.brown.shade400,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'sound'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Game',
                        ),
                      ),
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
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.brown.shade400,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'change_language'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Game',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            languageController.changeLanguage("en", "US");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/usa.webp',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'English',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Game',
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                languageController.language.value == "en"
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: languageController.language.value == "en"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            languageController.changeLanguage("zh", "CN");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/china.webp',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '中文',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Game',
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                languageController.language.value == "zh"
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: languageController.language.value == "zh"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            languageController.changeLanguage("vi", "VN");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/vietnam.webp',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Tiếng Việt',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Game',
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                languageController.language.value == "vi"
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: languageController.language.value == "vi"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.brown.shade400,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'version'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Game',
                        ),
                      ),
                      Text(
                        '1.0.0'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Game',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: onRestart,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    child: Text(
                      'back'.tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
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
