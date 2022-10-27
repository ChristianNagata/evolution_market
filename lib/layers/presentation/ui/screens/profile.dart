import 'package:evolution_market/layers/domain/entities/user_entity.dart';
import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

UserEntity _user = UserEntity(
    name: 'John Doe', email: 'johndoe@email.com', insertionDate: 'dd/mm/aaaa');

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            CircleAvatar(
              radius: avatarRadius,
              child: const Icon(
                Icons.person,
                size: 56,
              ),
            )
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
                initialValue: _user.name,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nome do Usuário',
                ),
              ),
              const SizedBox(height: 34),
              TextFormField(
                initialValue: _user.email,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 34),
              TextFormField(
                initialValue: _user.insertionDate,
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
