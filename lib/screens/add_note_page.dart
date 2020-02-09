import 'package:flutter/material.dart';
class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.white ,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height/2,
        child: Column(

          children: <Widget>[

            Text('Add Note',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Color(0xFFC89C17), ),
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 3,
                autocorrect: true,
                cursorColor: Color(0xFFC89C17),
                decoration: InputDecoration(
                  hintText: 'Type Note Here',


                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFC89C17)),
                  ),
                ),),
            ),
            SizedBox(height: 50.0,),

            MaterialButton(
              minWidth: 200.0,
              height: 20.0,
              child: Text('Save Note',style:TextStyle(color: Colors.white),),
              color: Color(0xFFC89C17),
              textColor: Color(0xFFC89C17),
              padding: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {





              },
            ),

            SizedBox(height: 20.0,),



          ],
        ),
      ),
    );
  }
}
