import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp1/model/ketolist.dart';
import 'package:http/http.dart' as http;
import 'package:myapp1/widgets/card_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
      (child: Container(child: _datasWidget)),
    );
  }

  Widget get _datasWidget => FutureBuilder(
        future: getJsonPlaceHolderDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    cardWidget(snapshot.data[index], context));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
  Future<List<KetoList>> getJsonPlaceHolderDatas() async {
    try {
      final _response =
          await http.get("https://myapp-97275.firebaseio.com/.json");
      switch (_response.statusCode) {
        case 200:
          final _mapJson = json.decode(_response.body);
          List<KetoList> ketolist = new List<KetoList>();
          for (Map<String, dynamic> item in _mapJson) {
            //print("item" + item.toString());
            KetoList keto = KetoList.fromJson(item);
            ketolist.add(keto);
          }
          return ketolist;
          break;
        case 400:
          print(_response.body.toString());
          break;
        case 401:
          print(_response.body.toString());
          break;
        case 403:
          print(_response.body.toString());
          break;
        case 500:
          print(_response.body.toString());
          break;
        default:
          print("${_response.statusCode}");
      }
    } catch (e) {
      print("**" + e.toString());
    }
  }
}
