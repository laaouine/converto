import 'package:flutter/material.dart';
import 'package:tp01/models/bachelor.dart';
import 'package:meta/meta.dart';
import 'package:tp01/widget/bachelor_dt.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({Key? key, required this.bachelor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(bachelor.avatar),
      ),
      title: Text(bachelor.firstname),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorDetails(bachelor: bachelor),
          ),
        );
      },
    );
  }
}
