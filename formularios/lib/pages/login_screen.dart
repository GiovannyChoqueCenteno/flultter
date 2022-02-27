import 'package:flutter/material.dart';
import 'package:formularios/provider/login_form_provider.dart';
import 'package:formularios/ui/input_decorations.dart';
import 'package:formularios/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Crear una nueva cuenta',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'example@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.email_sharp,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
            ),
            SizedBox(height: 10),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                child: Text(
                  loginForm.isLoading ? 'Esperar' : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      //TODO login form
                      FocusScope.of(context).unfocus();
                      if (!loginForm.isValid()) {
                        return;
                      }
                      loginForm.isLoading = true;
                      await Future.delayed(Duration(seconds: 2));
                      loginForm.isLoading = false;
                      Navigator.pushReplacementNamed(context, 'home');
                    },
            )
          ],
        ),
      ),
    );
  }
}
