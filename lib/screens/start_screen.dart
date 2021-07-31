import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/modal_bloc/modal_bloc.dart';
import 'package:vendora/bloc/vendor_search_bloc/vendor_search_bloc.dart';
import 'package:vendora/components/foot_navigation_bar.dart';
import 'package:vendora/components/search_bar.dart';
import 'package:vendora/components/search_text_field.dart';
import 'package:vendora/screens/search_result_screen.dart';
import 'package:vendora/utilities/auth_utils.dart';
import 'package:vendora/utilities/constants.dart';
import 'search_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static String routeID = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final int _navBarIndex = 0;
  final ModalBloc modalBloc = ModalBloc();

  late bool _isVisible;
  late ScrollController _hideBottomNavController;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideBottomNavController = ScrollController();
    _hideBottomNavController.addListener(() {
      if (_hideBottomNavController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      }
      if (_hideBottomNavController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _hideBottomNavController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          child: StartScreenView(scrollController: _hideBottomNavController),
          create: (_) => this.modalBloc,
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: _isVisible ? 54.0 : 0.0,
          child: Wrap(
            children: [
              FootNavigationBar(
                navBarIndex: _navBarIndex,
                bloc: this.modalBloc,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StartScreenView extends StatefulWidget {
  StartScreenView({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  _StartScreenViewState createState() => _StartScreenViewState();
}

class _StartScreenViewState extends State<StartScreenView> {
  final AuthUtils auth = AuthUtils();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      shrinkWrap: true,
      slivers: <Widget>[
        BlocBuilder<ModalBloc, ModalState>(
          builder: (context, state) {
            return SliverAppBar(
              elevation: 0.0,
              pinned: true,
              stretch: true,
              expandedHeight: 150.0,
              centerTitle: true,
              leading: auth.isLogin()
                  ? TextButton(
                      onPressed: () {
                        BlocProvider.of<ModalBloc>(context).add(LoggedOut());
                      },
                      child: Icon(
                        Icons.account_circle,
                        size: 30.0,
                      ),
                    )
                  : null,
              flexibleSpace: Center(
                child: Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: AppBar(
                  elevation: 0.0,
                  title: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: SearchTextField(
                      hintText: 'Search for Vendors',
                      readOnly: true,
                      autoFocus: false,
                      suffixIcon: IconButton(
                        color: kThemeColor,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      onTap: () async {
                        Navigator.pushNamed(context, SearchResultScreen.routeID,
                            arguments: {'vendorCategoryId': 0});
                      },
                    ),
                  ),
                ),
              ),
            );
          },
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
                int vendorCategoryId = index + 1;
                return GestureDetector(
                  onTap: () {
                    print(vendorCategoryId);
                    Navigator.pushNamed(context, SearchResultScreen.routeID,
                        arguments: {'vendorCategoryId': vendorCategoryId});
                  },
                  child: Container(
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
                            kCategories[vendorCategoryId]!['img'].toString(),
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          kCategories[vendorCategoryId]!['caption'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
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
