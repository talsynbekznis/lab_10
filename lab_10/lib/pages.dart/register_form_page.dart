import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>(); // Глобальный ключ для формы

                                              // Контроллеры для очистки полей
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

   // Переменные для скрытия пароля
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Поле имени с кнопкой очистки
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Полное имя",
                  suffixIcon: _nameController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _nameController.clear();
                            });
                          },
                        )
                      : null,
                ),
              ),

              SizedBox(height: 10),

              // Поле email с кнопкой очистки
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  suffixIcon: _emailController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _emailController.clear();
                            });
                          },
                        )
                      : null,
                ),
              ),

              SizedBox(height: 10),

              // Поле номера телефона с кнопкой очистки
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Телефон",
                  suffixIcon: _phoneController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _phoneController.clear();
                            });
                          },
                        )
                      : null,
                ),
              ),

              SizedBox(height: 10),

              // Поле пароля с глазиком и валидацией
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Пароль",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Введите пароль";
                  }
                  if (value.length < 8) {
                    return "Пароль должен содержать минимум 8 символов";
                  }
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(value)) {
                    return "Пароль должен содержать буквы и цифры";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              // Поле подтверждения пароля с глазиком
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: "Подтвердите пароль",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Пароли не совпадают";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Кнопка регистрации
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Регистрация успешна!")),
                    );
                  }
                },
                child: Text("Зарегистрироваться"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}