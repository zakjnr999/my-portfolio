import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isMobile(context) ? 24 : Responsive.isTablet(context) ? 28 : 32;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get In Touch",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
          Responsive(
            mobile: Column(
              children: [
                _buildContactInfo(context),
                SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
                _buildContactForm(context),
              ],
            ),
            tablet: Column(
              children: [
                _buildContactInfo(context),
                const SizedBox(height: defaultPadding),
                _buildContactForm(context),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _buildContactInfo(context)),
                const SizedBox(width: defaultPadding * 2),
                Expanded(flex: 2, child: _buildContactForm(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Information",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: defaultPadding * 2),
          _buildContactItem(
            context,
            Icons.email,
            "Email",
            "zakjnr165@gmail.com",
          ),
          const SizedBox(height: defaultPadding),
          _buildContactItem(
            context,
            Icons.phone,
            "Phone",
            "+233 53 699 7662",
          ),
          const SizedBox(height: defaultPadding),
          _buildContactItem(
            context,
            Icons.location_on,
            "Location",
            "Accra, Ghana",
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor.withValues(alpha: 0.3)),
          ),
          child: Icon(icon, color: primaryColor, size: 24),
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: bodyTextColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return ContactForm();
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate form submission
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Thank you! Your message has been sent."),
            backgroundColor: primaryColor,
          ),
        );
        setState(() {
          _isSubmitting = false;
        });
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
 
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Message",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
            Responsive(
              mobile: Column(
                children: [
                  _buildTextField(
                    controller: _nameController,
                    label: "Your Name",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: defaultPadding / 2),
                  _buildTextField(
                    controller: _emailController,
                    label: "Your Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!value.contains("@")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              tablet: Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _nameController,
                      label: "Your Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: _buildTextField(
                      controller: _emailController,
                      label: "Your Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              desktop: Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _nameController,
                      label: "Your Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: _buildTextField(
                      controller: _emailController,
                      label: "Your Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            _buildTextField(
              controller: _subjectController,
              label: "Subject",
              icon: Icons.subject,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a subject";
                }
                return null;
              },
            ),
            const SizedBox(height: defaultPadding),
            _buildTextField(
              controller: _messageController,
              label: "Message",
              icon: Icons.message,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a message";
                }
                return null;
              },
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: darkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(darkColor),
                        ),
                      )
                    : Text(
                        "Send Message",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: bodyTextColor),
        prefixIcon: Icon(icon, color: primaryColor),
        filled: true,
        fillColor: darkColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: primaryColor.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: primaryColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}

