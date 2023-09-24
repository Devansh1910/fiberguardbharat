import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({Key? key});

  @override
  _LangScreenState createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  String selectedLanguage = 'English (default)';

  void navigateToOpenNewsAll(BuildContext context) {
    Routemaster.of(context).push('/OpenNewsAll');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align at the top
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/lang.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Your Preferred Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Please select your language',
              style: TextStyle(
                color: Color.fromRGBO(235, 227, 224, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        underline: const SizedBox(),
                        isExpanded: true,
                        icon: Image.asset('assets/images/downbtn.png'),
                        value: selectedLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            selectedLanguage = newValue!;
                          });
                        },
                        style: const TextStyle(
                          color: Color.fromRGBO(12, 12, 11, 1),
                          fontWeight: FontWeight.w500,
                        ),
                        items: <String>[
                          'English (default)',
                          'हिंदी',
                          'বাংলা',
                          'తెలుగు',
                          'தமிழ்',
                          'اردو',
                          'ગુજરાતી',
                          'ಕನ್ನಡ',
                          'മലയാളം',
                          'অসমীয়া',
                          'کأشُر',
                          'سنڌي',
                          'মণিপুরী',
                          'Ɡasi',
                          'Pahari',
                          'কোকবৰক',
                          'ತುಳು',
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => navigateToOpenNewsAll(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 227, 224, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
