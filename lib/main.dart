import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          RoutedNavigationScreen(),

          PlatformScreen(),
        ],
      ),
    );
  }
}

class RoutedNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' 2 экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
              },
              child: Text('Перейти к экрану 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Text('Перейти к экрану 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlatformScreen()));
              },
              child: Text('Перейти к экрану определения платформы'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Вернуться назад'),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Вернуться назад'),
        ),
      ),
    );
  }
}

class PlatformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String platform;

    if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'iOS';
    } else if (Platform.isLinux) {
      platform = 'Linux';
    } else if (Platform.isMacOS) {
      platform = 'macOS';
    } else if (Platform.isWindows) {
      platform = 'Windows';
    } else {
      platform = 'неизвестная платформа';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Экран платформы'),
      ),
      body: Center(
        child: Text('Приложение запущено на: $platform'),
      ),
    );
  }
}
