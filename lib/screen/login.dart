import 'package:examen_parcial1/screen/registerForm.dart';
import 'package:examen_parcial1/screen/succes.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}
class _MyLoginState extends State<MyLogin> {
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Inicio de sesion'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debes de ingresar un correo';
              }
              return null;
            },
              decoration: const InputDecoration(
                labelText: 'Ingresa tu Email',
                hintText: 'Ingresa tu correo',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debes de ingresar una contraseña';
              }
              return null;
            },
              decoration: const InputDecoration(
                labelText: 'Ingresa tu Contraseña',
              ),
              obscureText: true, // Para ocultar la contraseña
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                   ElevatedButton.icon(
                onPressed: () {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterForm()),
            );
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Registrarte'),
              ),
              const SizedBox(height: 20.0,width: 20.0,),
            ElevatedButton.icon(
              onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                } 
              },
              icon: const Icon(Icons.subdirectory_arrow_right_outlined),
              label: const Text('Iniciar sesion'),
            ),
              ],
            )
          ],
        ),
      ),
    
      );
  }
}