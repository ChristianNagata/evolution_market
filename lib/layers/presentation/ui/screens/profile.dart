import 'package:evolution_market/layers/presentation/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  final double _profileHeight = 127;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 150 + _profileHeight / 2,
        flexibleSpace: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _Background(profileHeight: _profileHeight),
            Container(
              height: _profileHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          children: [
            const SizedBox(height: 56),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome do Usuário',
              ),
            ),
            const SizedBox(height: 34),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 34),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Data de Inserção',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
    required double profileHeight,
  })  : _profileHeight = profileHeight,
        super(key: key);

  final double _profileHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/upper-profile.bg.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          height: _profileHeight / 2,
        ),
      ],
    );
  }
}
