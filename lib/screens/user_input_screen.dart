import 'package:flutter/material.dart';

class UserInputScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController departController = TextEditingController();

  String? name;
  String? depart;
  bool? editMode;
  UserInputScreen({this.name, this.depart, this.editMode});

  @override
  Widget build(BuildContext context) {
    nameController.text = name ?? '';
    departController.text = depart ?? '';
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 123, 180, 197),
      body: Container(
        margin: EdgeInsets.only(top: 115,left: 15,right: 15),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue,
                hintText: 'Enter Your Name' ,hintStyle: TextStyle(
                  color: Colors.white
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              
              style: TextStyle(fontSize: 20),
              
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue,
                hintText: 'Enter Your Department',hintStyle: TextStyle(
                  color: Colors.white,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              controller: departController,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context, [nameController.text, departController.text]);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                      
                      ),
                      child: Text('Save')),
                      SizedBox(width: 10,),
                      ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context, );
                      },
                      style: ElevatedButton.styleFrom(
                        primary:Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                      
                      ),
                      child: Text('Cancel')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
