import 'package:articles_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _passwordNotVisible;

  @override
  void initState() {
    super.initState();
    _passwordNotVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Widget input(String hint, TextEditingController textEditingController,
        bool isTextNotVisible) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: textEditingController,
          obscureText:
              isTextNotVisible ? _passwordNotVisible : isTextNotVisible,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: IconTheme(
                  data: const IconThemeData(color: Colors.white),
                  child: isTextNotVisible
                      ? IconButton(
                          icon: Icon(_passwordNotVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _passwordNotVisible = !_passwordNotVisible;
                            });
                          },
                        )
                      : const SizedBox(),
                ),
              )),
        ),
      );
    }

    Widget form(
      String label,
    ) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: input('login', _loginController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: input('password', _passwordController, true),
          ),
        ],
      );
    }

    bool registered(String login, String password) {
      return login == "admin" && password == "password123";
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            form("admin"),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (_) => const StartScreen());
                  registered(_loginController.text, _passwordController.text)
                      ? Navigator.push(context, route)
                      : showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Ошибка входа!'),
                              content: const Text('неверный логин или пароль'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                },
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                        child: Text(
                      'Log in',
                      textScaleFactor: 1.4,
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
