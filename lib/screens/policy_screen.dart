import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flying_bird/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(Global.language == "zh"
          ? Global.policyZh
          : Global.language == "vi"
              ? Global.policyHtmlVi
              : Global.policyHtmlEn);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // const Text(
            //   'Privacy Policy',
            //   style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.white,
            //     fontFamily: 'Game',
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 20),
            // Text(
            //   Global.policy,
            //   style: const TextStyle(
            //     fontSize: 12,
            //     color: Colors.white,
            //     fontFamily: 'Game',
            //   ),
            // ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: WebViewWidget(
                controller: controller,
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
                Text(
                  'agreed_policy'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    //   fontFamily: 'Game',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                'accept'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  // fontFamily: 'Game',
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
      ),
    );
  }
}
