import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Live"), backgroundColor: Colors.black, foregroundColor: Colors.yellow),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            "Аудио қазір қолжетімсіз, тікелей эфир емес",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )
      ),
    );
  }
}
