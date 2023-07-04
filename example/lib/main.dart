import 'package:flutter/material.dart';
import 'package:password_maker/password_maker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//go to line 86
void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      //for theme
      create: (_) => ThemeProvider(),
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(),
        ),
        home: LaunchScreen());
  }
}

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    //LaunchScreen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //here intialising Controllers
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  // assigning the generated password to a temporary variable
  //this is the method generating password=PassWords().generatePassword(10);
  late String temp;
  @override
  void initState() {
    super.initState();
    temp = generatePassWord(10); //here 10 is the length of passwords
    _PasswordController = TextEditingController(
        text: temp); //assigning the temp to the Password controller
  }

//disposing the controllers
  @override
  void dispose() {
    _PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : Color.fromRGBO(248, 234, 221, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Welcome
              Container(
                margin: EdgeInsets.all(20),
                child: Text('Welcome to Flutter',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),

              ///Logo
              Center(
                child: Container(
                  child: FlutterLogo(
                    size: 200,
                  ),
                ),
              ),

              ///Name
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider._isDarkMode
                      ? Color.fromRGBO(26, 18, 11, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: themeProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      border: InputBorder.none),
                ),
              ),

              ///PassWord
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider._isDarkMode
                      ? Color.fromRGBO(26, 18, 11, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _PasswordController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              Container(
                child: Text('terms and conditions apply'),
              ),

              ///SignupButton
              GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: themeProvider._isDarkMode
                          ? Color.fromRGBO(26, 18, 11, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: Text('SIGNUP')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//theme
class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    _isDarkMode = brightness == Brightness.dark;
  }

  bool get isDarkMode => _isDarkMode;

  ThemeData getThemeData() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            scaffoldBackgroundColor:
                Colors.black, 
          )
        : ThemeData.light().copyWith(
            scaffoldBackgroundColor:
                Colors.white,
          );
  }
}
