import 'package:flutter/material.dart';

class LoadingtxtWidget extends StatelessWidget {
  final String loadingText;

  // Constructor to optionally allow custom text
  const LoadingtxtWidget({super.key, this.loadingText = "Loading..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         // const CircularProgressIndicator(), 
         // const SizedBox(height: 16), // Space between the spinner and the text
          Text(
            loadingText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
