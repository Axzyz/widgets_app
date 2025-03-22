import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('¿Estás seguro?'),
            content: const Text(
              'Non consectetur labore cupidatat in. Eiusmod pariatur ullamco tempor ut non eiusmod. Fugiat ea labore voluptate reprehenderit veniam esse incididunt reprehenderit cupidatat veniam excepteur proident. Cupidatat fugiat mollit quis minim aliqua eu laboris eu officia deserunt elit do. Consequat id irure aliquip eu cupidatat dolor aute ex consectetur. Est est amet esse adipisicing. Sint in veniam cupidatat esse duis qui fugiat consequat culpa.',
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y diálogos de Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Proident ex do commodo veniam fugiat labore fugiat ea velit. Adipisicing est sint sit dolor eiusmod officia officia Lorem. Esse culpa cupidatat nulla veniam magna do id quis laborum ipsum ipsum eu sit. Ea minim quis eiusmod cupidatat exercitation deserunt ipsum mollit nulla est labore. Tempor et sunt adipisicing fugiat cupidatat esse.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
