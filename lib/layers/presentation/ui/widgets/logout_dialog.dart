import 'package:flutter/material.dart';

const String _content = 'A ação de logout irá desconectar sua conta da '
    'plataforma, tem certeza que deseja prosseguir?';

const String _title = 'Deseja realizar Logout?';

showLogoutDialog(BuildContext context) => showDialog(
      context: context,
      builder: (_) => const _LogoutDialog(),
    );

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              _title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              _content,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(161, 165, 183, 1),
              ),
            ),
            SizedBox(height: 16),
            _Options(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'Não',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.blue),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Sim, desejo sair',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 14, color: Colors.red),
            )),
      ],
    );
  }
}
