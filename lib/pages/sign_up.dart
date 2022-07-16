import 'package:datademo/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
static const String id='sign_up';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  _doLogn(){
    String username=usernameController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    String phone=phoneController.text.toString().trim();
    String email=emailController.text.toString().trim();
    var box=Hive.box('pdp_online');
    box.put('username', username);
    box.put('password', password);
    box.put('phone', phone);
    box.put('email', email);
    String name=box.get('username');
    String name_pass=box.get('password');
    String name_e=box.get('email');
    String name_p=box.get('phone');
    print(name);
    print(name_pass);
    print(name_e);
    print(name_p);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff191d38),
          elevation: 0,
        ),
        backgroundColor: const Color(0xff191d38),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                const Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),

                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      hintText: 'username',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      hintText: 'phone number',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.phone)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: 'email',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
               GestureDetector(
                 onTap: _doLogn,
                 child:  Container(
                   width: 50,
                   height: 50,
                   margin: const EdgeInsets.only(left: 140),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       color: const Color(0xff2180ff)),
                   child: const Center(
                       child: Icon(
                         Icons.arrow_forward_rounded,
                         color: Colors.white,
                       )),
                 ),
               ),
                Container(
                  padding:const EdgeInsets.all(30),
                  child:   Row(

                    children: [


                      const Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.grey, fontSize: 17),

                      ),
                      const SizedBox(width: 30,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, SignIn.id);
                          },
                          child:const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),


                    ],

                  ),
                )

              ],
            ),
          ),
        ));
  }
}
