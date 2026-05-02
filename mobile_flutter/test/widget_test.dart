import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Tela de login aparece corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp() as Widget);

    // Verifica elementos da tela
    expect(find.text('Bem-vindo'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}

class MyApp {
  const MyApp();
}