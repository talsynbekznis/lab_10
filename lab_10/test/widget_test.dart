import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_10/pages.dart/register_form_page.dart';


void main() {
  testWidgets('Проверка формы регистрации', (WidgetTester tester) async {
    // Загружаем страницу регистрации
    await tester.pumpWidget(MaterialApp(home: RegistrationPage()));

    // Проверяем наличие полей ввода
    expect(find.byType(TextFormField), findsNWidgets(5));
    expect(find.text("Полное имя"), findsOneWidget);
    expect(find.text("Email"), findsOneWidget);
    expect(find.text("Телефон"), findsOneWidget);
    expect(find.text("Пароль"), findsOneWidget);
    expect(find.text("Подтвердите пароль"), findsOneWidget);

    // Вводим данные
    await tester.enterText(find.byType(TextFormField).at(0), "Иван Иванов");
    await tester.enterText(find.byType(TextFormField).at(1), "ivan@test.com");
    await tester.enterText(find.byType(TextFormField).at(2), "1234567890");
    await tester.enterText(find.byType(TextFormField).at(3), "password123");
    await tester.enterText(find.byType(TextFormField).at(4), "password123");

    // Нажимаем кнопку регистрации
    await tester.tap(find.text("Зарегистрироваться"));
    await tester.pump();

    // Проверяем, что появилось SnackBar-сообщение об успешной регистрации
    expect(find.text("Регистрация успешна!"), findsOneWidget);
  });
}