import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiberguardbharat/theme/Pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';



class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key});
  String? phone;



  void navigateToRegistrationSeller(BuildContext context) {
    Routemaster.of(context).push('/Registrationseller');
  }

  void navigatetoOtpScreen(BuildContext context) {
    Routemaster.of(context).push('/otpScreen');
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                    color: Color.fromRGBO(92, 92, 92, 1),
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enter your credentials here ',
                  style: TextStyle(
                      color: Color.fromRGBO(92, 92, 92, 1),
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Divider(
                    height: 1,
                    color: Color.fromRGBO(211, 211, 211, 1),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(235, 227, 224, 1),
              ),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],

                onChanged: (value) {
    //Do something with the user input.
               phone=value;} ,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(148, 148, 148, 1),
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(235, 227, 224, 1),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(235, 227, 224, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
        ElevatedButton(
          onPressed: () {
            streambuilder();
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                  title:const Text("OTP"),
                  content: TextField(
                    onChanged: (value){

                    },
                    keyboardType: TextInputType.number,
                  ),
                  actions:<Widget>[
                    TextButton(onPressed:(){



                      Navigator.of(context).pop(true);



                    }, child: Text("verify"),

                    ),


                  ]
              );
            }
            );
            // Add your button action here

          },
          style: ElevatedButton.styleFrom(
            primary: Pallete.mainColor, // Change to your desired color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),







      const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () => navigateToRegistrationSeller(context),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          color:
                              Pallete.mainColor, // Change to your desired color
                          width: 1.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Registration',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Pallete
                                  .mainColor, // Change to your desired color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      // User has been automatically verified.
      // You can sign them in here if needed.
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      // Handle errors such as invalid phone numbers or too many attempts
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      // Store the verificationId somewhere and navigate to the OTP screen
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // Auto retrieval time out, set up a manual way to verify the code
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

// Verify the OTP code
  Future<void> verifyOTP(String verificationId, String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // User is signed in
    } catch (e) {
      // Handle sign-in errors
    }
  }
  void streambuilder()  async{
   try {

      QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection('users').get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          print(data?['Phone NUmber']);


          if (data?['Phone NUmber']==phone ){
              verifyPhoneNumber("+918630670454");
          }



          // Access the time data
        });
      } else {
        print('No documents found.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
