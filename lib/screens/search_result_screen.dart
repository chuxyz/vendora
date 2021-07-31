import 'package:flutter/material.dart';
import 'package:vendora/bloc/modal_bloc/modal_bloc.dart';
import 'package:vendora/components/foot_navigation_bar.dart';
import 'package:vendora/components/search_text_field.dart';
import 'package:vendora/utilities/constants.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  static String routeID = 'search_result_screen';

  @override
  Widget build(BuildContext context) {
    Map<String, int> _args =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return SearchResultScreenView(args: _args);
  }
}

class SearchResultScreenView extends StatefulWidget {
  const SearchResultScreenView({Key? key, required this.args})
      : super(key: key);

  final Map<String, int> args;

  @override
  _SearchResultScreenViewState createState() => _SearchResultScreenViewState();
}

class _SearchResultScreenViewState extends State<SearchResultScreenView> {
  final List<Item> _data = [
    Item(
        title: 'Gardens By the Bay',
        catagory: "Gardens",
        place: "Singapore",
        ratings: "5.0/80",
        discount: "10 %",
        image:
            "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Singapore Zoo',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        discount: null,
        image:
            "https://images.pexels.com/photos/1736222/pexels-photo-1736222.jpeg?cs=srgb&dl=adult-adventure-backpacker-1736222.jpg&fm=jpg"),
    Item(
        title: 'National Orchid Garden',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        discount: "12 %",
        image:
            "https://images.pexels.com/photos/62403/pexels-photo-62403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Godabari',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        discount: "15 %",
        image:
            "https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Rara National Park',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        discount: "12 %",
        image:
            "https://images.pexels.com/photos/1319515/pexels-photo-1319515.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 20.0,
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            height: 45.0,
            child: SearchTextField(
              hintText: 'Search for Vendors...',
              prefixIcon: BackButton(
                color: kThemeColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(6),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          Item item = _data[index];
          return Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 110,
                  padding:
                      EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item.image!), fit: BoxFit.cover)),
                  child: item.discount == null
                      ? Container()
                      : Container(
                          color: Colors.deepOrange,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                item.discount!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "Discount",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title!,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Text(
                        item.catagory!,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      Text(
                        item.place!,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            item.ratings!,
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ratings",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: FootNavigationBar(
        navBarIndex: 0,
        bloc: ModalBloc(),
      ),
    );
  }
}

class Item {
  final String? title;
  final String? catagory;
  final String? place;
  final String? ratings;
  final String? discount;
  final String? image;

  Item(
      {this.title,
      this.catagory,
      this.place,
      this.ratings,
      this.discount,
      this.image});
}
