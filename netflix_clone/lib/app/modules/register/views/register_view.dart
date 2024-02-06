import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/register/ccontroller/register_controller.dart';

class RegisterView extends GetView<RegisterController>{
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://assets.nflxext.com/ffe/siteui/vlv3/c0a32732-b033-43b3-be2a-8fee037a6146/2fe6e3c0-5613-4625-a0c1-3d605effd10b/IN-en-20210607-popsignuptwoweeks-perspective_alpha_website_large.jpg'),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 120.0),
              child: Material(
                elevation: 4,
                color: Colors.black54,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text('Create an Account', style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w600),))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _registerFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              //style: TextStyle(color: Colors.white70),
                              validator: (value) {
                                if(value != null){
                                  if (value.isEmpty) {
                                    return "Invalid Username";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text("Username"),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.redAccent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: _emailController,
                              //style: TextStyle(color: Colors.white70),
                              validator: (value) {
                                if (!EmailValidator.validate(value!)) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                label: Text("E-mail"),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.redAccent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Obx(() => TextFormField(
                              controller: _passwordController,
                              //style: TextStyle(color: Colors.white70),
                              validator: (value) {
                                if(value!=null){
                                  if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: controller.obscure.value,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: controller.obscure.value == true ? Colors.grey : Colors.redAccent,
                                    ),
                                    onPressed: (){
                                      controller.obscure.value =! controller.obscure.value;
                                    }),
                                label: Text("Password"),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.redAccent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            )),

                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              height: 50,
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)),
                                  backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                                  elevation: MaterialStateProperty.all(3),
                                ),
                                onPressed: ()async{
                                  Get.offAllNamed('/base');
                                },
                                child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?', style: TextStyle(color: Colors.white60),),
                                TextButton(
                                  onPressed: ()  => Get.toNamed('/login'),
                                  child: Text('Sign in', style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );  }
}