import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)?.settings.arguments as int?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          index != null ? 'Task Details: ${index + 1}' : 'Task Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:
              index != null
                  ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Details for Task ${index + 1}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Here you can show dynamic information about Task ${index + 1}.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Back to Dashboard'),
                      ),
                    ],
                  )
                  : Text(
                    'No task selected.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
        ),
      ),
    );
  }
}
