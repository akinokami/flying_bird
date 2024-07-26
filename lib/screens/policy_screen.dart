import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flying_bird/global.dart';
import 'package:get_storage/get_storage.dart';

class PolicyScreen extends StatefulWidget {
  final FlappyBirdGame game;

  const PolicyScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String first = '';

  @override
  void initState() {
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.brown,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Game',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              Global.policy,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  activeColor: Colors.green,
                  side: BorderSide(
                    width: 1.5,
                    color: isChecked ? Colors.green : Colors.black,
                  ),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      if (isChecked) {
                        isAccepted = true;
                      } else {
                        isAccepted = false;
                      }
                    });
                  },
                ),
                const Text(
                  'I agreed to the Privacy Policy.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Game',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                'Accept',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              // CustomText(
              //   text: 'Accept',
              //   size: 14,
              //   textColor: Colors.white,
              // ),
              onPressed: isAccepted
                  ? () {
                      final box = GetStorage();
                      box.write('first', 'notfirst');
                      widget.game.overlays.remove('policy');
                    }
                  : null,
            ),
          ],
        ),
      )),
    );
  }
}
