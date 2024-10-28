import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Verify with OTP sent to',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                "+91 ",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              // Text(
              //   // // widget.phoneNumber.toString(),
              //   // style: const TextStyle(fontSize: 16, color: Colors.grey),
              // )
            ],
          ),
          const SizedBox(height: 30.0),
          Pinput(
            length: 6,
            // controller: otpCtrl,
            // focusNode: otpFocusNode,
            // androidSmsAutofillMethod:
            //     AndroidSmsAutofillMethod.smsUserConsentApi,
            // listenForMultipleSmsOnAndroid: true,
            // defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8.0),
            validator: (value) {},

            onCompleted: (pin) {
              // debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              // debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9.0),
                  width: 22.0,
                  height: 1.0,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Didn't get the OTP?"),
                    TextButton(
                      onPressed: () {
                        // Resend OTP
                      },
                      child: const Text(
                        'Resend the SMS',
                        style: TextStyle(
                          color: Color(0xFF06234C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF027335),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Center(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
