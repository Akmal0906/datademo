
import 'package:datademo/pages/signin_new.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import '../model/account_model.dart';
import '../service/db_service.dart';
class SignUpNew extends StatefulWidget {
  const SignUpNew({Key? key}) : super(key: key);
static const String id='signup_new';
  @override
  State<SignUpNew> createState() => _SignUpNewState();
}

class _SignUpNewState extends State<SignUpNew> {
  final usernameController = TextEditingController();

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  _doSignUp(){
    String username=usernameController.text.toString().trim();

    String phone=phoneController.text.toString().trim();
    String email=emailController.text.toString().trim();
var account=Account(email: email,password: phone,username: username);

    HiveDB().storeAccount(account);
    var account2=HiveDB().loadAccount();

    print(account2.username);
    print(account2.email);
    print(account2.password);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff07807b),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff07807b),
      body: SingleChildScrollView(


        child: Column(

          children: [
            //#image

            Container(
              width: double.infinity,
              color: const Color(0xff07807b),
              child: Column(
                children:const [

                Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                   SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      'Sign in to continue',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                   SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),



            Container(
              height: 600,
              padding:const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              ),
              child: Column(
                children: [

                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        hintText: 'username',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'email',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        hintText: 'phone',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Forgot password ?',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  const SizedBox(
                    height: 30,
                  ),


                GestureDetector(
                  onTap: _doSignUp,
                  child:   Container(
                    width: double.infinity,
                    height: 40,
                    margin:const EdgeInsets.symmetric(horizontal: 40),
                    color: const Color(0xff07807b),
                    child: const Center(
                        child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
                    ),
                  ),
                ),
                  Container(
                    margin:const EdgeInsets.only(left: 20),
                    padding:const EdgeInsets.all(25),
                    child:   Row(

                      children: [


                        const Text(
                          "Don,t have an account ?",
                          style: TextStyle(color: Colors.grey, fontSize: 17),

                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, SignInNew.id);
                            },
                            child:const Text(
                              "Sign In ",
                              style: TextStyle(color: Colors.black87, fontSize: 17),
                            )),


                      ],

                    ),
                  ),
                  Container(
                    width:300,
                    height:80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: const <Widget>[

                        Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 25.0),
                        Icon(FontAwesomeIcons.instagram, color: Colors.black87, size: 25.0),
                        Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 25.0)
                      ],
                    ),
                  )

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
