import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/homepage.dart';
import 'package:to_do/pages/more.dart';
import 'package:to_do/pages/settings.dart';
import 'package:to_do/pages/trash.dart';
import 'package:to_do/util/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() async {
  //Initialize Hive
  await Hive.initFlutter();

  var box = await Hive.openBox('MyBox');
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          routes: {
            '/Homepage': (context) => Homepage(),
            '/Settings': (context) => Settings(),
            '/More': (context) => MorePage(),
            '/Trash': (context) => Trash(),
          },
          theme: ThemeData.from(
            colorScheme: _colorScheme,
            textTheme: GoogleFonts.robotoTextTheme(_textTheme),
          ).copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: _colorScheme.primary,
              foregroundColor: _colorScheme.onPrimary,
            ),
          ),
          home: Homepage(),
          debugShowCheckedModeBanner: false,

          // Custome themes applied
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
        );
      }),
    );
  }
}

const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
// static const _bold = FontWeight.w700;

ColorScheme get _colorScheme => ColorScheme.fromSeed(
      seedColor: Colors.green,
    );

TextTheme get _textTheme => TextTheme(
      headlineMedium: const TextStyle(
        fontWeight: _medium,
      ),
      bodySmall: TextStyle(
        fontWeight: _regular,
        // color: _defaultColorScheme.onSurfaceVariant,
      ),
      headlineSmall: const TextStyle(
        fontWeight: _medium,
      ),
      titleMedium: const TextStyle(
        fontWeight: _medium,
      ),
      bodyLarge: const TextStyle(
        fontWeight: _regular,
      ),
      titleSmall: const TextStyle(
        fontWeight: _medium,
      ),
      bodyMedium: const TextStyle(
        fontWeight: _regular,
      ),
      titleLarge: const TextStyle(
        fontWeight: _semiBold,
      ),
      labelLarge: const TextStyle(
        fontWeight: _semiBold,
      ),
    );
