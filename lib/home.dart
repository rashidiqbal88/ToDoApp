import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getPostAPI() async {
    var url = Uri.https('crudcrud.com',
        '/api/8b9ba0b327e84108a975af60df225b2d/unicorns', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
      //  var itemCount = jsonResponse['totalItems'];
      //  print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38B3E3),
        title: Text('To Do App'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getPostAPI(),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Name: ${snapshot.data[index]['name']}'),
                    subtitle:
                        Text('Age: ${snapshot.data[index]['age'].toString()}'),
                    trailing: Icon(Icons.delete),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Add'),
      ),
    );
  }
}
