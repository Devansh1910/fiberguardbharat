import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiberguardbharat/theme/Pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';

class RegistrationSeller extends StatefulWidget {
  const RegistrationSeller({Key? key});

  @override
  State<RegistrationSeller> createState() => _RegistrationSellerState();
}

class _RegistrationSellerState extends State<RegistrationSeller> {
  void navigatetoLoginScreen(BuildContext context) {
    Routemaster.of(context).push('/LoginScreen');
  }

  String selectedLanguage = 'English (default)';
  List<String> days = List.generate(31, (index) => (index + 1).toString());
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> years = List.generate(100, (index) => (2023 - index).toString());

  List<String> states = [
    'Select Category',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  List<String> sellers = [
    'Select Category',
    'Farmer',
    'Storage Owner',
    'Others',
  ];

  String selectedDay = '1';
  String selectedMonth = 'January';
  String selectedYear = '2023';
  String selectedState = 'Select Category';
  String selectsellers = 'Select Category';
  late String Firstname,Lastname,PhoneNumber,Adhaarcard,Darofbirth,location,permanentaddress,category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/topnotch.png',
                    width: 200,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Pallete.mainColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Already Registered?',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(92, 92, 92, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => navigatetoLoginScreen(context),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Pallete.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(235, 227, 224, 1),
                      ),
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.black), // Set text color to black
                        onChanged: (value) {
                          Firstname=value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Firstname',
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(148, 148, 148, 1),
                            fontWeight: FontWeight.normal,
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
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(235, 227, 224, 1),
                      ),
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.black), // Set text color to black
                        onChanged: (value) {
                          Lastname=value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Lastname',
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(148, 148, 148, 1),
                            fontWeight: FontWeight.normal,
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
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(235, 227, 224, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/ind.png'),
                          const Text(
                            '  +91',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(138, 138, 138, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(235, 227, 224, 1),
                      ),
                      child: TextField(
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
                          PhoneNumber=value;
                        },
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(235, 227, 224, 1),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  onChanged: (value) {
                    Adhaarcard=value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Aadhar Card',
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  const Text(
                    'Date of Birth :',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(92, 92, 92, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 227, 224, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromRGBO(235, 227, 224, 1),
                        borderRadius: BorderRadius.circular(20),
                        value: selectedDay,
                        underline: Container(), // Remove underline
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDay = newValue!;
                          });
                        },
                        items:
                            days.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(92, 92, 92, 1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 227, 224, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromRGBO(235, 227, 224, 1),
                        borderRadius: BorderRadius.circular(20),
                        value: selectedMonth,
                        underline: Container(), // Remove underline
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                          });
                        },
                        items: months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(92, 92, 92, 1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 227, 224, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromRGBO(235, 227, 224, 1),
                        borderRadius: BorderRadius.circular(20),
                        value: selectedYear,
                        underline: Container(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedYear = newValue!;
                          });
                        },
                        items:
                            years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(92, 92, 92, 1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(245, 245, 245, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Location:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(92, 92, 92, 1),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(235, 227, 224, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButton<String>(
                                dropdownColor:
                                    const Color.fromRGBO(235, 227, 224, 1),
                                borderRadius: BorderRadius.circular(20),
                                value: selectedState,
                                underline: Container(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedState = newValue!;
                                    location=selectedState;
                                  });
                                },
                                items: states.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(92, 92, 92, 1),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(235, 227, 224, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/images/locate.png',
                                    ),
                                    const Text(
                                      'Locate',
                                      style: TextStyle(
                                        color: Color.fromRGBO(92, 92, 92, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            height: 5,
                            color: Colors.black), // Set text color to black
                        onChanged: (value) {
                          permanentaddress=value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Permanent Address',
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(148, 148, 148, 1),
                            fontWeight: FontWeight.normal,
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
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Who are you >>',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(92, 92, 92, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 227, 224, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromRGBO(235, 227, 224, 1),
                        borderRadius: BorderRadius.circular(20),
                        value: selectsellers,
                        underline: Container(),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              selectsellers = newValue!;
                              category=selectsellers;
                            },
                          );
                        },
                        items: sellers
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(92, 92, 92, 1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    saveDataToFirestore();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Pallete.mainColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> saveDataToFirestore() async {
    try {
      // Reference to Firestore collection
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Data to be added
      Map<String, dynamic> data = {
        'name':Firstname,
        'email':Lastname,
        "Phone NUmber":PhoneNumber,
        "Adhaarcard":Adhaarcard,
        "Location":location,
        "Permanent Address":permanentaddress,
        "Category":category,
      };

      // Add the document
      await users.add(data);


      print('Data added to Firestore');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }
}
