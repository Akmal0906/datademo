import 'package:datademo/model/user_model.dart';
import 'package:datademo/service/db_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id='home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();
void _doIt(){
  String username=usernameController.text.toString().trim();
  String password=passwordController.text.toString().trim();
  var user=User(password: password, username: username);
 HiveDB().storeUser(user);
  var user2=HiveDB().loadUser();

print(user2.username);
print(user2.password);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration:const InputDecoration(
                hintText: 'username'
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration:const InputDecoration(
                  hintText: 'password'
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.deepPurple,
                primary: Colors.white
              ),
              onPressed: _doIt,
              child:const Text('Press me'),
            )
          ],
        ),
      ),
    );
  }
}
