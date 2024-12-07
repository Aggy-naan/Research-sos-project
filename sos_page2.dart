import 'package:flutter/material.dart';
import 'emergency_data.dart'; // Import the EmergencyData class

class SOSPage2 extends StatefulWidget {
  final EmergencyData emergencyData; // Receive the initial data from SOSPage1

  const SOSPage2({Key? key, required this.emergencyData}) : super(key: key);

  @override
  _SOSPage2State createState() => _SOSPage2State();
}

class _SOSPage2State extends State<SOSPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _needsController = TextEditingController();
  final TextEditingController _injuriesController = TextEditingController();

  @override
  void dispose() {
    _needsController.dispose();
    _injuriesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Update the EmergencyData instance with additional information
      widget.emergencyData.needs = _needsController.text;
      widget.emergencyData.injuries = _injuriesController.text;

      // Here you can handle the form submission, e.g., navigate to a confirmation page or send the SMS
      print(widget.emergencyData.toJson()); // Debug: print the JSON data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Information'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _needsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Specific needs',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter specific needs';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _injuriesController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Injuries',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter information about injuries';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
