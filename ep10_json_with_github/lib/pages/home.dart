import 'package:ep8_layout/pages/detail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const txtstyle1 =
      TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);
  static const txtstyle2 = TextStyle(fontSize: 18, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('สิ่งที่นักพัฒนาควรเรียนรู้'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder(
              builder: (context, snapshot) {
                var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext contect, int index) {
                    return Mybox(data[index]['title'], data[index]['subtitle'],
                        data[index]['img_url'], data[index]['detail']);
                  },
                  itemCount: data.length,
                );
              },
              future:
                  DefaultAssetBundle.of(context).loadString('assets/data.json'),
            )));
  }

  Widget Mybox(String title, String subtitle, String img_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = img_url;
    v4 = detail;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.40), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: txtstyle1,
          ),
          SizedBox(height: 10), // ระยะระหว่างข้อความ
          Text(
            subtitle,
            style: txtstyle2,
          ),
          SizedBox(
            height: 1,
          ),
          TextButton(
            onPressed: () {
              print("Next Page >>>");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(v1, v2, v3, v4)));
            },
            child: Text(
              "อ่านต่อ >>>",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
