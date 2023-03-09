import "package:apps/resources/auth_methods.dart";
import "package:apps/utils/colors.dart";
import "package:apps/utils/utils.dart";
import "package:apps/widgets/text_field_input.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  bool _isLoading = false;


  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text);

    setState(() {
      _isLoading = false;
    });


    if(res != "success"){
      showSanckBar(res, context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Container(
        child: Column(
          children: [
            SvgPicture(bytesLoader)
          ],
        ),
      )
        
      ),
    );
  }
}
