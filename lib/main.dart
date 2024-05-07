import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/main-theme',
      routes: {
        '/main-theme': (_) => const MainTheme(),
        '/override-theme': (_) => const OverrideTheme(),
        '/override-app-bar-theme': (_) => const OverrideAppBarTheme(),
      },
    );
  }
}

class MainTheme extends StatelessWidget {
  const MainTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Theme'),
      ),
      body: const Body(),
    );
  }
}

class OverrideTheme extends StatelessWidget {
  const OverrideTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.green,
        ),
        typography: Typography.material2021(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Override Theme'),
        ),
        body: const Body(),
      ),
    );
  }
}

class OverrideAppBarTheme extends StatelessWidget {
  const OverrideAppBarTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          titleTextStyle: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Override App Bar Theme')),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/main-theme'),
            child: const Text('Main Theme'),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, '/override-theme'),
            child: const Text('Override Theme'),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, '/override-app-bar-theme'),
            child: const Text('Override App Bar Theme'),
          ),
        ],
      ),
    );
  }
}
