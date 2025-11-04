import 'package:flutter/material.dart';

void main() {
  runApp(const DAMRASystemApp());
}

class DAMRASystemApp extends StatelessWidget {
  const DAMRASystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAMRA SYSTEM - Smart Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SmartHomeDashboard(),
    );
  }
}

class SmartHomeDashboard extends StatefulWidget {
  const SmartHomeDashboard({super.key});

  @override
  State<SmartHomeDashboard> createState() => _SmartHomeDashboardState();
}

class _SmartHomeDashboardState extends State<SmartHomeDashboard> {
  // Mock device states - in a real app, this would sync with Supabase
  Map<String, bool> deviceStates = {
    'Living Room Lights': false,
    'Bedroom Lights': true,
    'Thermostat': true,
    'Security Camera': false,
    'Front Door Lock': true,
  };

  void _toggleDevice(String deviceName) {
    setState(() {
      deviceStates[deviceName] = !deviceStates[deviceName]!;
      // TODO: Send command to backend (e.g., Supabase Edge Function) for real device control
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAMRA Smart Home'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to DAMRA Smart Home',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Control your smart home devices from here.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: deviceStates.length,
                itemBuilder: (context, index) {
                  String deviceName = deviceStates.keys.elementAt(index);
                  bool isOn = deviceStates[deviceName]!;
                  IconData deviceIcon;
                  
                  // Assign icons based on device type
                  if (deviceName.contains('Lights')) {
                    deviceIcon = Icons.lightbulb;
                  } else if (deviceName.contains('Thermostat')) {
                    deviceIcon = Icons.thermostat;
                  } else if (deviceName.contains('Camera')) {
                    deviceIcon = Icons.videocam;
                  } else if (deviceName.contains('Lock')) {
                    deviceIcon = Icons.lock;
                  } else {
                    deviceIcon = Icons.device_unknown;
                  }

                  return Card(
                    color: isOn ? Colors.green[100] : Colors.grey[200],
                    child: InkWell(
                      onTap: () => _toggleDevice(deviceName),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              deviceIcon,
                              size: 40,
                              color: isOn ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              deviceName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isOn ? Colors.green[800] : Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              isOn ? 'On' : 'Off',
                              style: TextStyle(
                                fontSize: 14,
                                color: isOn ? Colors.green[600] : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}