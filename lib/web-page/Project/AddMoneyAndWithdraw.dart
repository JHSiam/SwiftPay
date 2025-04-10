import 'package:flutter/material.dart';

class AddFundsWithdrawPage extends StatefulWidget {
  const AddFundsWithdrawPage({super.key});

  @override
  State<AddFundsWithdrawPage> createState() => _AddFundsWithdrawPageState();
}

class _AddFundsWithdrawPageState extends State<AddFundsWithdrawPage> {
  final _amountController = TextEditingController();
  String _selectedMethod = 'Bank Card';

  final List<String> _methods = [
    'Bank Card',
    'Mobile Money',
    'Bank Account',
  ];

  void _confirmTransaction() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Amount: ₹${_amountController.text}"),
            Text("Method: $_selectedMethod"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              _showSuccessScreen();
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void _showSuccessScreen() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Success 🎉"),
        content: const Text("Transaction completed successfully."),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _linkBankCard() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Link Bank Card"),
        content: const Text("Mock card linking completed."),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Funds / Withdraw")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedMethod,
              items: _methods.map((method) {
                return DropdownMenuItem(value: method, child: Text(method));
              }).toList(),
              onChanged: (value) => setState(() {
                _selectedMethod = value!;
              }),
              decoration: const InputDecoration(
                labelText: "Select Method",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedMethod == 'Bank Card')
              ElevatedButton(
                onPressed: _linkBankCard,
                child: const Text("Link Bank Card"),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: _confirmTransaction,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text("Proceed"),
            ),
          ],
        ),
      ),
    );
  }
}