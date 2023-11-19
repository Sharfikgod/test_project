class ContactUs {
  final String name;
  final String email;
  final String message;
  ContactUs({
    required this.name,
    required this.email,
    required this.message,
  });

  @override
  String toString() {
    return 'ContactUs: {name: $name, email: $email, message: $message}';
  }
}
