// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// The main page with three tabbed views.

import 'dart:ui' as $ui;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'package:core/models.dart';

import '../widgets/widgets.dart';
import '../blocs/blocs.dart';
import '../pages/pages.dart';
import '../pages/about.dart';
import '../utils/utils.dart';

// Local conf for a tab.
class _TabConf {
  final String name;
  final String title;
  final String bgImage;
  final MaterialColor color;
  final bool showRefresh;
  final bool showSettings;
  final bool showSearch;
  final GetFlavor flavor;

  _TabConf(
      {this.name,
      this.title,
      this.bgImage,
      this.color = Colors.blue,
      this.showRefresh = true,
      this.showSettings = true,
      this.showSearch = false,
      this.flavor = GetFlavor.significant});

  SettingsState settings(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context).state;
  }

  EarthquakesBloc bloc(BuildContext context) {
    switch (flavor) {
      case GetFlavor.significant:
        return BlocProvider.of<SignificantEarthquakesBloc>(context);
      case GetFlavor.latest:
        return BlocProvider.of<LatestEarthquakesBloc>(context);
      case GetFlavor.nearby:
        return BlocProvider.of<NearbyEarthquakesBloc>(context);
    }
    throw "Unknown flavor";
  }

  BlocBuilder<EarthquakesBloc, EarthquakesState> createBlocBuilder(
      Widget Function(BuildContext, EarthquakesState) builder) {
    switch (flavor) {
      case GetFlavor.significant:
        return BlocBuilder<SignificantEarthquakesBloc, EarthquakesState>(
          builder: builder,
        );
      case GetFlavor.latest:
        return BlocBuilder<LatestEarthquakesBloc, EarthquakesState>(
          builder: builder,
        );
      case GetFlavor.nearby:
        return BlocBuilder<NearbyEarthquakesBloc, EarthquakesState>(
          builder: builder,
        );
    }
    throw "Unknown flavor";
  }
}

// A stateful widget for the page containing three tabs.
class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  // Tab items for the bottom navigation bar
  final _tabs = [
    _TabConf(
        name: 'eqs-alerts',
        title: 'Earthquake alerts',
        bgImage: 'assets/earthquake-1790921_1280.jpg',
        color: Colors.orange,
        flavor: GetFlavor.significant),
    _TabConf(
        name: 'eqs-latest',
        title: 'Latest earthquakes',
        bgImage: 'assets/earthquake-1790896_1280.jpg',
        color: Colors.green,
        flavor: GetFlavor.latest),
    _TabConf(
        name: 'eqs-nearby',
        title: 'Earthquakes nearby',
        showSearch: true,
        bgImage: 'assets/earthquake-1790920_1280.jpg',
        color: Colors.blue,
        flavor: GetFlavor.nearby),
  ];
  final List<TabItem> _tabItems = List.of([
    new TabItem(Icons.notifications_active, "Alerts", Colors.orange),
    new TabItem(Icons.list, "Latest", Colors.green),
    new TabItem(Icons.search, "Nearby", Colors.blue),
  ]);

  State<Wrapper> createState() => WrapperState();
}

class WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  // controller for bottom navigation bar
  CircularBottomNavigationController _navController;

  // controller for a TabBarView
  TabController _tabController;

  // Image (dart:ui) for bg map
  $ui.Image _bgMapImage;
  $ui.Image _mapSymbolImage;

  @override
  void initState() {
    super.initState();

    // initialize the bottom navigation bar
    _navController = new CircularBottomNavigationController(0);

    // initialize controllers
    _tabController =
        new TabController(vsync: this, length: widget._tabs.length);
    _tabController.addListener(() {
      if (_navController.value != _tabController.index) {
        setState(() {
          _navController.value = _tabController.index;
        });
      }
    });

    // load image assets used by custom canvas 
    loadImageAsset('assets/Mark-s0.png')
        .then((img) => setState(() {
              _mapSymbolImage = img;
            }))
        .catchError((e) => print(e));
    loadImageAsset('assets/earth_2048_1024.jpg')
        .then((img) => setState(() {
              _bgMapImage = img;
            }))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        widget._tabItems,
        controller: _navController,
        selectedCallback: (index) {
          _tabController.animateTo(index);
        },
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        final media = MediaQuery.of(context);
        debugPrint(
            'Size width: ${media.size.width} height: ${media.size.height}');
        // For example
        //   iPhone Pro width 375.0 height: 812.0
        //   iPad 9.7 width: 768.0 height: 1024.0
        /*
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        */

        return TabBarView(
          controller: _tabController,
          children: widget._tabs.map((tab) {
            return SafeArea(
              top: false,
              bottom: false,
              child: GradientContainer(
                color: tab.color,
                child: CustomScrollView(
                  key: PageStorageKey(tab.name),
                  slivers: <Widget>[
                    _buildSliverAppBar(context, tab),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: tab
                          .createBlocBuilder(_builderFuncForSliverContent(tab)),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, _TabConf tab) {
    return SliverAppBar(
      stretch: true,
      snap: true,
      floating: true,
      elevation: 8,
      leading: GestureDetector(
        onTap: () async {
          await showAppAboutDialog(context);
        },
        child: Container(
          padding: EdgeInsets.all(4),
          child: Card(
            child: CircleAvatar(
              maxRadius: 54.0,
              child: Image.asset('assets/apps-logo-256x256-true-color.jpg'),
            ),
            elevation: 12.0,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
          ),
        ),
      ),
      actions: <Widget>[
        tab.showSearch
            ? _buildActionIcon(context, tab, Icons.search, () async {
                final city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitySelection(),
                  ),
                );
                if (city != null) {
                  tab.bloc(context).add(GetEarthquakes(
                      action: GetAction.fetch,
                      flavor: GetFlavor.nearby,
                      limit: tab.settings(context).limit,
                      place: city));
                }
              })
            : Container(),
        tab.showRefresh
            ? _buildActionIcon(context, tab, Icons.refresh, () {
                final bloc = tab.bloc(context);
                final state = bloc.state;
                if (state is EarthquakesLoaded) {
                  bloc.add(
                    GetEarthquakes(
                        action: GetAction.fetch,
                        flavor: tab.flavor,
                        limit: tab.settings(context).limit,
                        place: state.place),
                  );
                } else if (state is EarthquakesError && !tab.showSearch) {
                  bloc.add(
                    GetEarthquakes(
                      action: GetAction.fetch,
                      flavor: tab.flavor,
                      limit: tab.settings(context).limit,
                    ),
                  );
                }
              })
            : Container(),
        tab.showSettings
            ? _buildActionIcon(context, tab, Icons.settings, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              })
            : Container(),
      ],
      onStretchTrigger: () {
        // Function callback for stretch
        return;
      },
      expandedHeight: 160.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: Text(tab.title),
        background: Stack(
          fit: StackFit.expand,
          children: [
            tab.bgImage != null
                ? Image.asset(tab.bgImage, fit: BoxFit.cover)
                : Container(),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context, _TabConf tab, IconData iconData,
      void Function() onPressed) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: new Icon(
          iconData,
          color: Colors.white,
          size: 28.0,
        ),
        shape: new CircleBorder(),
        fillColor: tab.color.withAlpha(0xd0),
        splashColor: tab.color,
        constraints: BoxConstraints(minHeight: 48.0, minWidth: 48.0),
      ),
    );
  }

  Widget Function(BuildContext, EarthquakesState) _builderFuncForSliverContent(
      _TabConf tab) {
    return (context, state) {
      if (state is EarthquakesEmpty) {
        // if empty and no not have search box, then ask bloc to initiate loading
        if (!tab.showSearch) {
          tab.bloc(context).add(GetEarthquakes(
                action: GetAction.fetch,
                flavor: tab.flavor,
                limit: tab.settings(context).limit,
              ));
        }

        return SliverFillRemaining(
          hasScrollBody: false,
          child: _buildTextTag(
              context,
              tab.color,
              tab.showSearch
                  ? 'Please select a place.'
                  : 'Waiting for some earthquakes...',
              false),
        );
      }
      if (state is EarthquakesLoading) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (state is EarthquakesLoaded) {
        return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settings) {
          return _buildLoadedAsList(context, tab, settings, state.items);
        });
      }

      // Assumimg: state is EarthquakesError
      return SliverFillRemaining(
        hasScrollBody: false,
        child: _buildTextTag(
            context,
            Colors.red,
            state is EarthquakesError
                ? 'Could not load earthquakes (${state.errorText})!'
                : 'Something weird just happened!',
            true),
      );
    };
  }

  Widget _buildLoadedAsList(
      BuildContext context, _TabConf tab, SettingsState settings, List items) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];

          // Earthquake card
          if (item is Earthquake) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 512.0),
                child: EarthquakeCard(
                    bgMapImage: _bgMapImage,
                    mapSymbolImage: _mapSymbolImage,
                    earthquake: item,
                    color: tab.color,
                    units: settings.unitSystem),
              ),
            );
          }

          // Header
          final text = item.toString();
          return text.length > 0
              ? _buildTextTag(context, tab.color, text, true)
              : Container();
        },
        childCount: items.length,
      ),
    );
  }

  Widget _buildTextTag(
      BuildContext context, Color color, String text, bool isHeader) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16.0)),
          child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontSize: isHeader ? 20.0 : 16.0,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
