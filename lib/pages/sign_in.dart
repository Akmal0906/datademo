import 'package:datademo/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = 'sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  _justdoit(){
    String username=usernameController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    var box=Hive.box('pdp_online');

    box.put('username', username);
    box.put('password', password);
String id=box.get('username');
String pw=box.get('password');
    print(id);
    print(pw);

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
                //#image
                Container(
                  padding: const EdgeInsets.only(left: 115),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Richard.jpg'),
                      width: 90.0,
                      height: 80.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 95),
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
                 onTap: _justdoit,
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

                     ),),
                 ),
               ),
              Container(
               padding:const EdgeInsets.all(40),
                child:   Row(

                  children: [


                    const Text(
                      "Don,t have an account ?",
                      style: TextStyle(color: Colors.grey, fontSize: 17),

                    ),
                   const SizedBox(width: 30,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, SignUp.id);
                        },
                        child:const Text(
                          "Sign Up",
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
