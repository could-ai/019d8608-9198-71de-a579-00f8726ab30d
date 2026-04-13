import 'package:flutter/material.dart';
import '../login_selection_screen.dart';

class VieScolaireDashboard extends StatelessWidget {
  const VieScolaireDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Vie Scolaire'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginSelectionScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Tableau de bord Vie Scolaire\n(Absences, Retards, Sanctions, Infirmerie)'),
      ),
    );
  }
}
