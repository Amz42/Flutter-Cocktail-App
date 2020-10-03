import 'package:flutter/material.dart';
import 'package:flutter_cocktail/drink_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("CockTail App"),
        elevation: 0.0,
      ),
      body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(drink[
                                  'strDrinkThumb'] ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQXQpJnnPzhDYwOTr9S8quxVfMhbjcWiD9Haw&usqp=CAU"),
                        ),
                      ),
                      title: Text(
                        "${drink['strDrink']}",
                      ),
                      // subtitle: Text(
                      //   "${drink['idDrink']}",
                      // ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrinkDetail(drink: drink)));
                      },
                    );
                  },
                )
              : CircularProgressIndicator()),
    );
  }
}
