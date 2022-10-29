import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) => showDialog(
      context: context,
      builder: (_) => const _LoadingDialog(),
    );

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
