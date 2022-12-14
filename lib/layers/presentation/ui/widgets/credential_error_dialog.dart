import 'package:flutter/material.dart';

const String _title = 'Credenciais inválidas!';

showCredentialErrorDialog(BuildContext context, String message) => showDialog(
      context: context,
      builder: (_) => CredentialErrorDialog(message),
    );

class CredentialErrorDialog extends StatelessWidget {
  const CredentialErrorDialog(this.message, {Key? key}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth / 23,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              // TODO: Utilizar erro proveniente da API para mostrar no modal.
              message,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth / 32,
                color: const Color.fromRGBO(161, 165, 183, 1),
              ),
            ),
            const SizedBox(height: 16),
            const _Options(),
          ],
        ),
      ),
    );
  }
}

class _Options extends StatelessWidget {
  const _Options({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 27;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Prosseguir',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
                color: Theme.of(context).primaryColor,
              ),
            )),
      ],
    );
  }
}
