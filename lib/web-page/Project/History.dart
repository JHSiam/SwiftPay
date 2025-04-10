import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const AuthPage() : const HomePage(),
    );
  }
}

// Existing AuthPage, AddWithdrawPage, and TransactionHistoryPage remain unchanged...
// HomePage and SettingsPage added below

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Balance: ₹1000', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send Money'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Receive Money'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddWithdrawPage()),
                  ),
                  child: const Text('Add Funds'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Withdraw'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Recent Transactions', style: TextStyle(fontSize: 18)),
            const ListTile(
              title: Text('Sent ₹500'),
              subtitle: Text('2025-04-01'),
            ),
            const ListTile(
              title: Text('Received ₹750'),
              subtitle: Text('2025-04-02'),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings / Profile')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change PIN/Password'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Manage Bank Accounts / Cards'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}