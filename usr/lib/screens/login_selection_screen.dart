import 'package:flutter/material.dart';
import 'login_screen.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skoly - Connexion'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenue sur Skoly',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSpaceCard(context, 'Espace Élève', Icons.school, 'student'),
                    _buildSpaceCard(context, 'Espace Parent', Icons.family_restroom, 'parent'),
                    _buildSpaceCard(context, 'Espace Professeur', Icons.person, 'teacher'),
                    _buildSpaceCard(context, 'Espace Vie Scolaire', Icons.admin_panel_settings, 'vie_scolaire'),
                    _buildSpaceCard(context, 'Espace Administration', Icons.settings, 'admin'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpaceCard(BuildContext context, String title, IconData icon, String role) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(spaceName: title, role: role),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: 200,
          height: 150,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
