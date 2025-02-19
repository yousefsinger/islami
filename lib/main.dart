import 'package:flutter/material.dart';
import "package:islami/ui/model/sura.dart";
import 'package:islami/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/onBording/onBording_screen.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details_screen/sura_details.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:islami/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Set<int> nums = {1, 2};
  nums.add(1);
  ["1", "1"];
  for (int i = 0; i < 114; i++) {
    Constants.suras.add(Sura(Constants.englishQuranSurahs[i],
        Constants.suraNames[i], Constants.versesNumber[i], "${i + 1}.txt", i));
  }
  var isFirstTime=await _checkFirstTime();
  runApp(ChangeNotifierProvider(
      create: (_) => RecentSurasProvider(), child: MyApp(firstTime: isFirstTime)));

}

Future<bool>_checkFirstTime() async {
  SharedPreferences preferences=await SharedPreferences.getInstance();
  var firstTime=preferences.getBool("firstTime")?? true;
  return firstTime;
}

class MyApp extends StatelessWidget {
  final bool firstTime;
  const MyApp({required this.firstTime,super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnboardingScreen.routeName: (_) =>  OnboardingScreen(),
        Home.routeName: (_) => const Home(),
        Splash.routeName: (_) => const Splash(),
        SuraDetails.routeName: (_) => const SuraDetails(),
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
      initialRoute: firstTime? OnboardingScreen.routeName:Home.routeName,
    );
  }
}
