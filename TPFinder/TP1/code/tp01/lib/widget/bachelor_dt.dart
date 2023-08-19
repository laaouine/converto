import 'package:flutter/material.dart';
import 'package:tp01/models/bachelor.dart';
import 'package:meta/meta.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorDetails({Key? key, required this.bachelor}) : super(key: key);

  @override
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bachelor.firstname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.bachelor.avatar),
              ),
              title: Text(widget.bachelor.firstname),
              subtitle: Text(widget.bachelor.firstname),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.work),
              title: Text(widget.bachelor.job),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.description),
              title: Text(widget.bachelor.description),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(isLiked ? 'Liked!' : 'Unliked!')),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.bachelor.avatar),
                  ),
                  Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: 48.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
