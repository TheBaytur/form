class User{
  late final String name;
  final String story;
  late final String phoneNumber;
  late final String email;
  final String country;

  User({
    required this.name,
    required this.story,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  String toString() {
    return 'User(name: $name, story: $story, phoneNumber: $phoneNumber, email: $email, country: $country)';
  }
}