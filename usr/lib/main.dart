import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'screens/login_selection_screen.dart';

void main() {
  runApp(const SkolyApp());
}

class SkolyApp extends StatelessWidget {
  const SkolyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skoly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return SecurityWrapper(child: child!);
      },
      home: const LoginSelectionScreen(),
    );
  }
}

class SecurityWrapper extends StatelessWidget {
  final Widget child;

  const SecurityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        if (event.buttons == kSecondaryMouseButton) {
          // Intercept right click
        }
      },
      child: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          if (HardwareKeyboard.instance.isControlPressed || HardwareKeyboard.instance.isMetaPressed) {
            if (event.logicalKey == LogicalKeyboardKey.keyC || event.logicalKey == LogicalKeyboardKey.keyV) {
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: child,
      ),
    );
  }
}
