part of 'contact_us_cubit.dart';

enum ContactUsStatus {
  initial,
  loading,
  success,
  error,
}

class ContactUsState {
  final ContactUsStatus contactUsStatus;
  final String? errorMessage;
  ContactUsState({
    this.contactUsStatus = ContactUsStatus.initial,
    this.errorMessage,
  });

  ContactUsState copyWith({
    ContactUsStatus? contactUsStatus,
    String? errorMessage,
  }) {
    return ContactUsState(
      contactUsStatus: contactUsStatus ?? this.contactUsStatus,
      errorMessage: errorMessage,
    );
  }
}
