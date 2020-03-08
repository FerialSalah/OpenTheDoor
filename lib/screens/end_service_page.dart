import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/models/serviceDetails.dart';

class EndPage extends StatefulWidget {
  ServiceDetailsModel data;
  EndPage({this.data});
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("End Service"),
          backgroundColor: Color(0xFFC89C17),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false)),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            ProviderData(data: widget.data),
            Row(children: <Widget>[
              Text('Note'),
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
                  ),
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                Text('Report Problem'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    autocorrect: true,
                    cursorColor: Color(0xFFC89C17),
                    decoration: InputDecoration(
                      hintText: 'write here the reasons..',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC89C17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Give Bonus'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    autocorrect: true,
                    cursorColor: Color(0xFFC89C17),
                    decoration: InputDecoration(
                      hintText: 'bonus',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC89C17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Hours of service provide:',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  // SizedBox(width: 20.0,),
                  Text(
                    '00:00:00 hours',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Given Bonus:',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  // SizedBox(width: 20.0,),
                  Text(
                    '${widget.data.providerPricePerHour} SAR',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total cost:',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${widget.data.total} SAR',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Payment way:',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  new DropdownButton<String>(
                    items: <String>['Cash', 'Visa'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            MaterialButton(
              minWidth: 250.0,
              height: 10.0,
              child: Text('Confirm Payment'),
              color: Color(0xFFC89C17),
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(left: 38, right: 38, top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
            ),
            SizedBox(
              height: 10.0,
            )
          ]),
        ));
  }
}

class ProviderData extends StatefulWidget {
  ServiceDetailsModel data;
  ProviderData({this.data});
  @override
  _ProviderDataState createState() => _ProviderDataState();
}

class _ProviderDataState extends State<ProviderData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(40.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(8.0),
        color: Colors.red.shade50,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: new Stack(
                  children: <Widget>[
                    Card(
                      child: Container(
                        height: 50.0,
                      ),
                    ),
                    FractionalTranslation(
                      translation: Offset(0.0, -0.6),
                      child: Align(
                        child: CircleAvatar(
                          radius: 45.0,
                          //child: Text("A"),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 60.0,
                          ),
                          backgroundColor: Color(0xFFC89C17),
                        ),
                        alignment: FractionalOffset(0.5, 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            '${widget.data.providerName}',
            style: TextStyle(color: Color(0xFFC89C17), fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Text('Information About Provider:'),
          ]),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${widget.data.providerPricePerHour} SAR/Hour',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Text('Notes:'),
          ]),
          SizedBox(
            height: 10.0,
          ),
          Text('${widget.data.notes}'),
        ],
      ),
    );
  }
}
