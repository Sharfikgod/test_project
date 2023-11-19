import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/const/color_constants.dart';
import 'package:test_project/const/string_constants.dart';
import 'package:test_project/pages/contact_us/cubit/contact_us_cubit.dart';
import 'package:test_project/utils/validate_operations.dart';
import 'package:test_project/widgets/flushbar.dart';
import 'package:test_project/widgets/icon_container_widget.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  static const routeName = '/contactUsPage';

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool nameIsValid = false;
  bool emailIsValid = false;
  bool messageIsValid = false;

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = nameIsValid && emailIsValid && messageIsValid;

    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state.contactUsStatus == ContactUsStatus.success) {
            showPopup(StringConstants.doneTitle, context, true);
          } else if (state.contactUsStatus == ContactUsStatus.error) {
            showPopup(state.errorMessage!, context, false);
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              StringConstants.contactUsTitle,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextInputWidget(
                      onChanged: (value) {
                        setState(() {
                          nameIsValid = value.isNotEmpty;
                        });
                      },
                      validator: (value) => ValidateOperations.normalValidation(value),
                      controller: nameController,
                      labelText: StringConstants.nameTitle,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    CustomTextInputWidget(
                      validator: (value) => ValidateOperations.emailValidation(value),
                      controller: emailController,
                      onChanged: (value) {
                        final isValid =
                            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$')
                                .hasMatch(value);

                        setState(() {
                          emailIsValid = isValid;
                        });
                      },
                      labelText: StringConstants.emailTitle,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    CustomTextInputWidget(
                      onChanged: (value) {
                        setState(() {
                          messageIsValid = value.isNotEmpty;
                        });
                      },
                      validator: (value) => ValidateOperations.normalValidation(value),
                      controller: messageController,
                      labelText: StringConstants.messageTitle,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: ColorConstants.buttonBackgroundColor,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey,
                          disabledForegroundColor: Colors.white,
                        ),
                        onPressed: isButtonEnabled && state.contactUsStatus != ContactUsStatus.loading
                            ? () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                await context.read<ContactUsCubit>().sendData(
                                      name: nameController.text,
                                      email: emailController.text,
                                      message: messageController.text,
                                    );
                              }
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.contactUsStatus == ContactUsStatus.loading) ...[
                              const SizedBox(width: 14, height: 14, child: CircularProgressIndicator()),
                              const SizedBox(width: 10),
                            ],
                            Text(
                              state.contactUsStatus == ContactUsStatus.loading
                                  ? StringConstants.waitButtonTitle
                                  : StringConstants.sendButtonTitle,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
