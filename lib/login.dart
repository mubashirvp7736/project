import 'package:flutter/material.dart';
import 'home.dart';

class ScreenLogin extends StatefulWidget {
   ScreenLogin ({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
final _usernameController = TextEditingController();

final _passwordController = TextEditingController();

bool _isDataMatched = true;

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        // appBar: AppBar(backgroundColor: Colors.blue,),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey ,
            child: Column(
              mainAxisAlignment : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('LOGIN',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                 
                  
                ),
                ),
              TextFormField(
              
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                 validator: (value){


                  if(  value == null || value.isEmpty){
                    return 'Value is Empty';
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20, ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Value is Empty';
                  }else{
                    return null;
                  }
          
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isDataMatched,
                    child: Text( 
                      'Username password doesnot match',
                      style: TextStyle(
                        color: Colors.red ,
                      ),
                    ),
                  ) 
                ],
              ),
              ElevatedButton.icon(
                
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    checkLogin(context);
                  }else{
                      print('Data is empty');
                  }
                  
                  checkLogin(context);
                },
               icon: Icon(Icons.check),
                label: Text('Login' ,
                
                ),
                )
            ],
            ),
          ),
        ),
      ),
    );
  }

void checkLogin(BuildContext ctx)
{
  final _username = _usernameController.text;
  final _password = _passwordController.text;

  if(_username =='mubu' &&  _password == '123'){

    print('Username pass match');
    // Goto Home

    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
  }else{

    // print('Username pass doesnot match');
  final _errorMessage = 'Username password doesnot match';

  showDialog(context: ctx,
   builder: (ctx1){
    return AlertDialog(
      title: Text('Error'),
    content: Text(_errorMessage),
    actions: [
      TextButton(
        onPressed: (){
          Navigator.of(ctx1).pop();
        },
       child: Text('close'),
       ),

    ],
    );
  });

  }
}
}