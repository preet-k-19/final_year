
//jay Shree Ganeshay Namah..
import  'package:flutter/material.dart';


class login123 extends StatefulWidget {
  @override
  State<login123> createState() => _login123State();
}

class _login123State extends State<login123> {
  var size,height,width;
  String? error;
  bool pass = true;
  String Email = '';
  String Pass = '';
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child:  Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Asset/bg/bg14.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top:135.0,left:25,right:25),
                child: Container(
                  transformAlignment: Alignment.center,
                  height: 400,
                  width: 650,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),topLeft: Radius.circular(80)),
                    color: Colors.white24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      TextField(
                        controller: EmailController,
                        onChanged: (val){
                          error = val.length>10?'Invalid Email': null;
                          if(val.length==10){
                            EmailController.text =val+ '@gmail.com';
                          };
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          hintText: "Please Enter UserName",
                          hintStyle: TextStyle(color: Colors.white70),
                          labelText: "UserName",
                          labelStyle: TextStyle(color:Colors.deepOrange),
                          prefixIcon: Icon(Icons.person,color: Colors.tealAccent),
                        ),
                      ),
        
                      SizedBox(height: 50.0),
                      TextField(
                        controller: PassController,
                        onChanged: (val){
                          error = val.length>10?'Upto 8 Characters Accepted': null;
        
                          setState(() {});
                        },
                        obscureText: pass,
                        cursorColor: Colors.red ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color:Colors.black),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          hintText: "Enter Your Password",
                          hintStyle: TextStyle(color:Colors.white70),
                          labelText: "PassWord",
                          labelStyle: TextStyle(color: Colors.teal),
                          prefixIcon: Icon(Icons.lock,color: Colors.yellowAccent),
                          suffixIcon: IconButton(
                            onPressed: (){
                              pass=!pass;
                              setState(() {});
                            },
                            icon: Icon(Icons.visibility),
                          ),
                          //suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            shadowColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(ContinuousRectangleBorder(side: BorderSide(color: Colors.deepPurpleAccent,width: 2))),
                            surfaceTintColor: MaterialStateProperty.all(Colors.brown),
                            overlayColor: MaterialStateProperty.all(Colors.teal),
                            backgroundColor: MaterialStateProperty.all(Colors.white10),
                            //shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color:Colors.amber,width: 3,strokeAlign: StrokeAlign.outside,style: BorderStyle.solid))),
                          ),
                          onPressed: () {
                           // Navigator.push(context,MaterialPageRoute(builder: (context) => myapp()));
                          },
                          child: Text("Let's Get Started")),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}