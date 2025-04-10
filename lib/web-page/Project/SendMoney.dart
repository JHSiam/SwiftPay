import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      home: const SendMoneyScreen(),
    );
  }
}

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  int _currentStep = 0;
  String? _selectedContact;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final List<Map<String, String>> _contacts = [
    {'name': 'John Doe', 'phone': '+1 555-0100', 'avatar': 'JD'},
    {'name': 'Jane Smith', 'phone': '+1 555-0101', 'avatar': 'JS'},
    {'name': 'Robert Johnson', 'phone': '+1 555-0102', 'avatar': 'RJ'},
    {'name': 'Emily Davis', 'phone': '+1 555-0103', 'avatar': 'ED'},
    {'name': 'Michael Brown', 'phone': '+1 555-0104', 'avatar': 'MB'},
  ];

  @override
  void dispose() {
    _phoneController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        centerTitle: true,
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _continue,
        onStepCancel: _cancel,
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                if (_currentStep != 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                  ),
                if (_currentStep != 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(_currentStep == 2 ? 'Send Money' : 'Continue'),
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Recipient'),
            content: _buildRecipientStep(),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('Amount'),
            content: _buildAmountStep(),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('Confirm'),
            content: _buildConfirmationStep(),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select from contacts or enter phone number',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        
        // Contact list
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: _contacts.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final contact = _contacts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text(contact['avatar']!),
                ),
                title: Text(contact['name']!),
                subtitle: Text(contact['phone']!),
                trailing: _selectedContact == contact['phone']
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedContact = contact['phone'];
                    _phoneController.text = contact['phone']!;
                  });
                },
              );
            },
          ),
        ),
        
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 16),
        
        // Phone number input
        const Text('Or enter phone number', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone),
            hintText: 'Enter recipient phone number',
          ),
          onChanged: (value) {
            setState(() {
              if (_selectedContact != null && value != _selectedContact) {
                _selectedContact = null;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildAmountStep() {
    return Column(
      children: [
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            labelText: 'Amount',
            hintText: '0.00',
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _noteController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.note),
            labelText: 'Note (optional)',
            hintText: 'e.g. For dinner',
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        const Text('Available balance: \$1,234.56', 
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildConfirmationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Review Transaction',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildDetailRow('Recipient', _phoneController.text),
        _buildDetailRow('Amount', '\$${_amountController.text}'),
        if (_noteController.text.isNotEmpty)
          _buildDetailRow('Note', _noteController.text),
        const SizedBox(height: 24),
        const Divider(),
        _buildDetailRow('Fee', '\$0.50'),
        _buildDetailRow(
          'Total', 
          '\$${(double.tryParse(_amountController.text) ?? 0 + 0.5}',
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }

  void _continue() {
    if (_currentStep == 0 && _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select or enter a phone number')),
      );
      return;
    }

    if (_currentStep == 1 && _amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an amount')),
      );
      return;
    }

    if (_currentStep < 2) {
      setState(() => _currentStep += 1);
    } else {
      _sendMoney();
    }
  }

  void _cancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    } else {
      Navigator.pop(context);
    }
  }

  void _sendMoney() {
    // Show processing dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Processing Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Please wait while we process your transaction'),
          ],
        ),
      ),
    );

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close processing dialog
      
      // Show success screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionSuccessScreen(
            recipient: _phoneController.text,
            amount: _amountController.text,
          ),
        ),
      );
    });
  }
}

class TransactionSuccessScreen extends StatelessWidget {
  final String recipient;
  final String amount;

  const TransactionSuccessScreen({
    super.key,
    required this.recipient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, 
                color: Colors.green, size: 80),
              const SizedBox(height: 24),
              const Text(
                'Money Sent!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                '\$$amount sent to $recipient',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Done'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // View receipt functionality
                },
                child: const Text('View Receipt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}