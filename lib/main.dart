import 'package:flutter/material.dart';
import 'package:localization/second_page.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

main() async {
  // if your flutter > 1.7.8 :  ensure flutter activated
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/lang/',
  );

  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text('appTitle'.tr()),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 50),
            Text(
              'textArea'.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35),
            ),
            GestureDetector(
              onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));},
              child: Container(
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Check Text Alignment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ...translator.locals().map((i) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          print(i.languageCode);
                          translator.setNewLanguage(
                            context,
                            newLanguage: i.languageCode,
                            remember: true,
                            restart: true,
                          );
                        },
                        child: Text(i.languageCode == "ar" ? "Arabic" : "English", style: const TextStyle(color: Colors.black, fontSize: 20),),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}