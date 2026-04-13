import 'package:flutter/material.dart';
import '../login_selection_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AdminUsersPage(),
    const AdminClassesPage(),
    const AdminTimetablePage(),
    const AdminAbsencesPage(),
    const AdminPunitionsPage(),
    const AdminSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Administration'),
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
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.people), label: Text('Utilisateurs')),
              NavigationRailDestination(icon: Icon(Icons.class_), label: Text('Classes & Matières')),
              NavigationRailDestination(icon: Icon(Icons.calendar_today), label: Text('Emploi du temps')),
              NavigationRailDestination(icon: Icon(Icons.sick), label: Text('Absences/Retards')),
              NavigationRailDestination(icon: Icon(Icons.gavel), label: Text('Sanctions')),
              NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Paramètres')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Gestion des Utilisateurs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Créer un utilisateur'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Card(
          child: ListTile(
            title: Text('JDOE - John Doe (Élève)'),
            subtitle: Text('Classe: 3ème A | Identifiants: JDOE / temp_pass'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Icon(Icons.delete, color: Colors.red),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AdminClassesPage extends StatelessWidget {
  const AdminClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Gestion des Classes, Matières et Salles'));
  }
}

class AdminTimetablePage extends StatelessWidget {
  const AdminTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Gestion de l\'Emploi du temps (Correction du bug)'));
  }
}

class AdminAbsencesPage extends StatelessWidget {
  const AdminAbsencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Gestion des Absences, Retards et Infirmerie'));
  }
}

class AdminPunitionsPage extends StatelessWidget {
  const AdminPunitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Gestion des Punitions, Retenues et Exclusions'));
  }
}

class AdminSettingsPage extends StatelessWidget {
  const AdminSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Paramètres (Fermeture des espaces, etc.)'));
  }
}
