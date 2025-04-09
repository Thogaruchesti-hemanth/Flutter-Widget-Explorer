import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Widget Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Basic Text
            const Text(
              "Basic Text",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //Text with Overflow ellipse
            const Text(
              "This is a very long text that might not fit in a single line, so it should show an ellipsis at the end.",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            //text with different font styles
            const Text(
              "Italic and Bold Text",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            //Text with shadows
            const Text(
              "Shadow text",
              style: TextStyle(
                fontSize: 22,
                color: Colors.orange,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //Text with multiple lines
            const Text(
              "This is a multi-line text example.\nIt will break into multiple lines automatically.",
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            //Text with letter spacing
            const Text(
              "Letter spaced Text",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 4,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            //RichText
            RichText(
              text: const TextSpan(
                text: "Rich ",
                style: TextStyle(fontSize: 22, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Text ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: "Example",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            //RichText Example
          ],
        ),
      ),
    );
  }
}
