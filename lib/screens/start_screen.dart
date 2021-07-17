import 'package:flutter/material.dart';
import 'package:vendora/components/foot_navigation_bar.dart';
import 'package:vendora/components/search_bar.dart';
import 'package:vendora/screens/search_result_screen.dart';
import 'package:vendora/utilities/constants.dart';
import 'search_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static String routeID = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _navBarIndex = 0;

  FocusNode _searchFocus = FocusNode();
  //final List<String> vendorList;

  _StartScreenState() : super();

  @override
  void initState() {
    _searchFocus.addListener(_onSearchFocus);
    super.initState();
  }

  void _onSearchFocus() {
    Navigator.pushNamed(context, SearchResultScreen.routeID);
  }

  @override
  void deactivate() {
    _searchFocus.dispose();
    print('Hey');
    super.deactivate();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        resizeToAvoidBottomInset: false,
        body: StartScreenView(),
        //bottomNavigationBar: FootNavigationBar(navBarIndex: _navBarIndex),
      ),
    );
  }
}

class StartScreenView extends StatelessWidget {
  const StartScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          stretch: true,
          expandedHeight: 150.0,
          centerTitle: true,
          flexibleSpace: Center(
            child: Text(
              'What are you looking for?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 20.0,
              title: Container(
                height: 45.0,
                child: TextFormField(
                  onTap: () async {
                    //Navigator.pushNamed(
                    //context, SearchResultScreen.routeID);
                    await showSearch<String>(
                      context: context,
                      delegate: VendorSearchDelegate(),
                    );
                  },
                  readOnly: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5, left: 15),
                    suffixIcon: IconButton(
                      color: kThemeColor,
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print('Searching...');
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(5.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 170.0,
              mainAxisExtent: 150.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 20.0),
                      Expanded(
                        child: Image.asset(
                          kCategories[index + 1]!['img'].toString(),
                          height: 60.0,
                          width: 60.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        kCategories[index + 1]!['caption'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                );
              },
              childCount: kCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}
