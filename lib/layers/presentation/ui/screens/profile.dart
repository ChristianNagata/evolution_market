import 'dart:convert';

import 'package:evolution_market/layers/domain/entities/user_entity.dart';
import 'package:evolution_market/layers/presentation/controllers/user_notifier.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserEntity user = context.watch<UserNotifier>().data;
    double screenWidth = MediaQuery.of(context).size.width;
    double avatarRadius = screenWidth / 6;
    double toolBarHeight = screenWidth / 3 + avatarRadius;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: toolBarHeight,
        flexibleSpace: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _Background(avatarRadius, toolBarHeight),
            user.base64String != null
                ? CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: avatarRadius - 5,
                      backgroundImage: Image.memory(
                        base64Decode(user.base64String!),
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  )
                : CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: avatarRadius - 5,
                      backgroundColor: Colors.blueAccent,
                      child: const Icon(Icons.person, size: 64),
                    ),
                  ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23),
          child: Column(
            children: [
              const SizedBox(height: 56),
              TextFormField(
                initialValue: user.name,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nome do Usuário',
                ),
              ),
              const SizedBox(height: 34),
              TextFormField(
                initialValue: user.email,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 34),
              TextFormField(
                initialValue: user.createdAtFormatted,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Data de Inserção',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background(this.avatarRadius, this.toolBarHeight);

  final double avatarRadius;
  final double toolBarHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: toolBarHeight - avatarRadius / 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/upper-profile.bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(height: avatarRadius),
      ],
    );
  }
}
