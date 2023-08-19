import 'package:faker/faker.dart';
import 'package:tp01/models/bachelor.dart';

List<String> maleNames = ["John", "abdel", "alex"];

List<String> femaleNames = ["lyne", "hakima", "sophie"];

List<Bachelor> generateBachelors() {
  final List<Bachelor> bachelors = [];
  final faker = Faker();
  for (int i = 0; i < 15; i++) {
    final gender = i % 2 == 0 ? Gender.male : Gender.female;
    print(gender);
    /*
    final firstName = gender == Gender.male
        ? maleNames[faker.randomGenerator.integer(maleNames.length - 1)]
        : femaleNames[faker.randomGenerator.integer(femaleNames.length - 1)];
  */
    if (gender == Gender.male) {
      final firstName =
          maleNames[faker.randomGenerator.integer(maleNames.length - 1)];

      final lastName = faker.person.lastName();
      final avatar = "images/man-${i + 1}.png";
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
        description: description,
      );

      bachelors.add(bachelor);
    } else {
      final firstName =
          femaleNames[faker.randomGenerator.integer(femaleNames.length - 1)];
      print(firstName);
      final lastName = faker.person.lastName();
      final avatar = "images/man-${i + 1}.png";
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
        description: description,
      );

      bachelors.add(bachelor);
    }
  }

  return bachelors;
}
