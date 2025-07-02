import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:start/firebase_options.dart';
import 'package:start/pages/auth/login.dart';
import 'package:start/pages/splash.dart';
/* import 'package:start/pages/intro.dart';
import 'package:start/pages/splash.dart'; */
import 'package:start/shared/shared.dart';
import 'package:start/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'ar'],
  );

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,

      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        title: 'Flutter App',
        // theme: lightTheme,
        // home: const HomePage(),
        home: SplashPage(),
        //   darkTheme: darkTheme,
        //  themeMode: ThemeMode.dark,
        navigatorKey: navigatorKey,
      ),
    );
  }
}

// --- Home Page ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Showcase - Page 1')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Headline Medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Body Large: This is the main body text style for your application.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Card with themed content
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Themed Card',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This card uses the CardTheme properties. It has a subtle shadow and rounded corners.',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('ACTION 1'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('ACTION 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Input field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Themed Input Field',
                hintText: 'Type something here...',
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 24),

            // Button to navigate
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondaryPage(),
                    ),
                  );
                },
                child: const Text('Go to Page 2'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // FAB action
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- Secondary Page ---
class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Showcase - Page 2')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Another Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          const Text(
            'This page confirms that the theme is applied consistently across your navigation stack. All elements should match the style of the first page.',
          ),
          const Divider(height: 40),
          ListTile(
            leading: Icon(Icons.color_lens, size: 40),
            title: Text('ListTile with Icon'),
            subtitle: Text(
              'The icon color should match the theme\'s primary icon color.',
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.palette, size: 40),
            title: Text('Another ListTile'),
            subtitle: Text('Demonstrating consistency.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(height: 40),
          Center(child: CircularProgressIndicator()),
          const SizedBox(height: 20),
          Center(child: Text("Circular Progress Indicator")),
        ],
      ),
    );
  }
}
