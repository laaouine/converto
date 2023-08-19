import 'package:flutter/material.dart';
import 'package:tp01/models/bachelor.dart';
import 'package:tp01/widget/bachelor_dt.dart';
import 'package:tp01/widget/bachelors_pr.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

List<Bachelor> generateFakeBachelors() {
  final faker = Faker();
  final bachelors = <Bachelor>[];

  for (var i = 0; i < 30; i++) {
    final firstName = faker.person.firstName();
    final lastName = faker.person.lastName();
    final gender = faker.randomGenerator.element([Gender.male, Gender.female]);
    final avatar = 'images/man-$i.png'; // Chemin vers l'image d'avatar
    final searchFor = gender == Gender.male ? [Gender.female] : [Gender.male];
    final job = faker.job.title();
    final description = faker.lorem.sentence();

    final bachelor = Bachelor(
        firstname: firstName,
        lastname: lastName,
        gender: gender,
        avatar: avatar,
        searchFor: searchFor,
        job: job,
        description: description);

    bachelors.add(bachelor);
  }

  return bachelors;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BachelorsMaster(),
    );
  }
}

class BachelorsMaster extends StatelessWidget {
  final List<Bachelor> bachelors = generateFakeBachelors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bachelors'),
      ),
      body: ListView.builder(
        itemCount: bachelors.length,
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return BachelorPreview(bachelor: bachelor);
        },
      ),
    );
  }
}
