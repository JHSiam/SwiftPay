import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeDashboard(),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Balance Card
    Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    'Your Balance',
    style: TextStyle(
    fontSize: 16,
    color: Colors.grey,
    ),
    ),
    const SizedBox(height: 8),
    const Text(
    '\$12,345.67',
    style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 16),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    _buildBalanceInfo('Income', '\$5,000'),
    _buildBalanceInfo('Expenses', '\$2,500'),
    ],
    ),
    ],
    ),
    ),
    ),

    const SizedBox(height: 24),

    // Quick Actions
    const Text(
    'Quick Actions',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 12),
    GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 4,
    childAspectRatio: 0.8,
    children: [
    _buildQuickAction(Icons.send, 'Send Money', Colors.blue),
    _buildQuickAction(Icons.call_received, 'Receive Money', Colors.green),
    _buildQuickAction(Icons.add_circle, 'Add Funds', Colors.orange),
    _buildQuickAction(Icons.money_off, 'Withdraw', Colors.red),
    ],
    ),

    const SizedBox(height: 24),

    // Recent Transactions
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const Text(
    'Recent Transactions',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    TextButton(
    onPressed: () {},
    child: const Text('View All'),
    ),
    ],
    ),
    const SizedBox(height: 12),
    ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 5,
    separatorBuilder: (context, index) => const Divider(height: 1),
    itemBuilder: (context, index) {
    return _buildTransactionItem(
      icon: Icons.shopping_bag,
      title: 'Purchase #${index + 1}',
      date: 'May ${index + 10}, 2023',
      amount: '-\$${(index + 1) * 20}.00',
      isNegative: true,
    );
    },
    ),
    ],
    ),
        ),
    );
  }

  Widget _buildBalanceInfo(String label, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          radius: 28,
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String date,
    required String amount,
    required bool isNegative,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isNegative ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}