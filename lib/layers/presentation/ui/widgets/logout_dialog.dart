import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              _content,
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
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 27;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Não',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
                color: Theme.of(context).primaryColor,
              ),
            )),
        TextButton(
            onPressed: () async => await authNotifier.logout(),
            child: Text(
              'Sim, desejo sair',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
                color: Colors.red,
              ),
            )),
      ],
    );
  }
}
