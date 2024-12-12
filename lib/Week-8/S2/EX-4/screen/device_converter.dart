import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController _dollarController = TextEditingController();
  String _selectedCurrency = 'EURO';
  double _convertedAmount = 0.0;

  final Map<String, double> _conversionRates = {
    'EURO': 0.9, // 1 USD = 0.9 EURO
    'YEN': 150.0, // 1 USD = 150 YEN
    'POUND': 0.78, // 1 USD = 0.78 POUND
    'Riel': 4000.0, // 1 USD = 4000 Riel
  };

  void _convertCurrency() {
    final double? dollarAmount = double.tryParse(_dollarController.text);
    if (dollarAmount != null) {
      setState(() {
        _convertedAmount = dollarAmount * (_conversionRates[_selectedCurrency] ?? 1.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:", style: TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            TextField(
              controller: _dollarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) => _convertCurrency(),
            ),
            const SizedBox(height: 30),
            const Text("Device:", style: TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCurrency = newValue!;
                    _convertCurrency();
                  });
                },
                items: _conversionRates.keys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: Container(), 
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:", style: TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount.toStringAsFixed(2),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
