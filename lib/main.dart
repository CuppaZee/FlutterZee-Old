import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuppaZee',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'FlutterZeeeee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> atAGlanceData = [];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  initState(){
    Firestore.instance
      .collection('data')
      .document('version')
      .get()
      .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        // log(ds["dev"]);
        setState((){
          atAGlanceData = jsonDecode(ds["news"]);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: AtAGlance(entries: atAGlanceData)
        // child: Column(
          
        //   // Column is also layout widget. It takes a list of children and
        //   // arranges them vertically. By default, it sizes itself to fit its
        //   // children horizontally, and tries to be as tall as its parent.
        //   //
        //   // Invoke "debug painting" (press "p" in the console, choose the
        //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //   // to see the wireframe for each widget.
        //   //
        //   // Column has various properties to control how it sizes itself and
        //   // how it positions its children. Here we use mainAxisAlignment to
        //   // center the children vertically; the main axis here is the vertical
        //   // axis because Columns are vertical (the cross axis would be
        //   // horizontal).
        //   mainAxisAlignment: MainAxisAlignment.center,
          
        //   children: <Widget>[
        //     // Text(
        //     //   'Taps:',
        //     //   style: Theme.of(context).textTheme.display1,
        //     // ),
        //     // Text(
        //     //   '$_counter',
        //     //   style: Theme.of(context).textTheme.display2,
        //     // ),
        //     // RotatedBox(
        //     //   quarterTurns: (_counter),
        //     //   child: Image.network(
        //     //     'https://cuppazee.uk/statics/cuppazee.png', 
        //     //     height:100,
        //     //   ),
        //     // ),
            
        //     // Container(
        //     //   height:,
        //     //   child:AtAGlance()
        //     // )
            
            
        //   ],
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.exposure_plus_1),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class AtAGlance extends StatelessWidget {
  AtAGlance({this.entries});

  List<dynamic> entries = [];
//   final List<Map> entries = <Map>[
//     {
//         "title": "🌲 Nymph Myth [Available Friday 9th August - 10:00 MHQ]",
//         "sub": "New Myth. \$15, Bouncer Upgrade purchasable separately. Lands on Greenies, Earth Mysteries and 4 Shades of Black Virtuals. If upgraded, will also land on green.",
//         "url": "https://www.munzeeblog.com/introducing-the-all-new-nymph-mythological-munzee/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/08/NymphFull_512-150x150.png"
//     },{
//         "title": "💍 \"She said Yes!\" MOB [Until 23rd August]",
//         "sub": "New MOB. Celebrating Rob & Louise. 2019 total. Some physical, some virtual. Land on Flat Robs, Flat Lous, Diamonds, Greenies, and Pink Virtuals. 8 hour bounce time.",
//         "url": "https://www.munzeeblog.com/guess-whos-getting-married-engagement-specials/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/08/Proposal-badge-720.png"
//     },{
//         "title": "🎬 Livestream Overview",
//         "sub": "Read the blog. Watch the video.",
//         "url": "https://www.munzeeblog.com/chitchat-with-rob-and-matt-august-2-videocast-notes/",
//         "icon": "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/studio-microphone_1f399.png"
//     },{
//         "title": "🎱 8,888,888th Munzee becomes a special!",
//         "sub": "The 8,888,888th Munzee, is now a PERMANENT Magic 8 Ball, with the functionality of the specials, except you get 40 points for capturing. Check it out on the Unique Munzees page.",
//         "url": "https://www.munzeeblog.com/qrazy-update-permanent-8-ball-marks-munzee-milestone/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/QRazy8s_Badge_720-300x300.png"
//     },{
//         "title": "🐸 Frog Evolutions Leap onto the Map",
//         "sub": "Like Butterflies. 5 Stages: Frog Egg, Tadpole, Pollywog, Froglet and Frog. Stage 5 Frog (POB) has 3 variants: Tree Frog, Poison Dart Frog and Tomato Frog",
//         "url": "https://www.munzeeblog.com/latest-evolution-prepares-to-leap-onto-the-map/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/Frog_Red_FULL_512-300x300.png"
//     },{
//         "title": "⚔️ August 2019 ZeeOps",
//         "sub": "Unable to Summarise. Please see blog.",
//         "url": "https://www.munzeeblog.com/legazeeops-operation-clan-clash-august-2019/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/LegaZeeOps_OperationClanClash_720-1.png"
//     },{
//         "title": "📅 August 2019 Flats/QRewZee Schedule",
//         "sub": "Please see CuppaZee's Munzee Calendar",
//         "url": "https://www.munzeeblog.com/august-flat-schedules-and-qrewsdays/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/04/preview-full-QRewzee_512-150x150.png"
//     },{
//         "title": "🛠️ August 2019 POTM Requirements",
//         "sub": "Requires Nomination. You can nominate players who readily respond to missing munzees and are dedicated to keeping the map clean!",
//         "url": "https://www.munzeeblog.com/july-potm-and-august-potm-requirements/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/01/POTM_720-300x300-1.png"
//     },{
//         "title": "🃏 QRazy 8's Deploy Challenge Update",
//         "sub": "Everyone who deployed 8 munzees in July will get a Virtual, a Virtual Color, an Urban Fit, a Physical Capture Booster, and the unique \"QRazy 8’s\" badge!",
//         "url": "https://www.munzeeblog.com/july-potm-and-august-potm-requirements/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/QRazy8s_Badge_720-300x300.png"
//     },{
//         "title": "🏆 July 2019 Player of the Month Winners",
//         "sub": "Unique Badge. Everyone who deployed 16 munzees (exc. socials/personals) throughout July will get this badge on 1st August.",
//         "url": "https://www.munzeeblog.com/july-potm-and-august-potm-requirements/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/06/preview-full-POTM_July_2019_720-300x300.png"
//     },{
//         "title": "🏆 July 2019 Garden of the Month Winners",
//         "sub": "4 Winners, rather than normal 2. 7th Birthday Garden, Happy Birthday Karte, Munzee Logo and I HEART MUNZEE gardens won this month.",
//         "url": "https://www.munzeeblog.com/july-gotm-is-twice-as-nice-with-double-the-winning-gardens/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/new_badges/gotm1913.png"
//     },{
//         "title": "⚔️ Clan Requirements for August 2019",
//         "sub": "See the requirements table on CuppaZee Clan Stats",
//         "url": "https://www.munzeeblog.com/august-2019-clan-war-requirements/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/v4pins/clan_weapons_filter.png"
//     },{
//         "title": "🏆 New Cap, Deploy and CapOn Leaderboard Badges",
//         "sub": "9 Badges. The badges are Top 3 for each of the leaderboards. These badges ARE NOT retroactive.",
//         "url": "https://www.munzeeblog.com/introducing-new-leaderboard-badge-lines/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/DailyDeploys1_720.png"
//     },{
//         "title": "🍴 New Global Grub Badges",
//         "sub": "6 Badges. First one is for capping 1 Global Grub. 2nd is cap 5, 3rd is cap 15. Others not revealed yet. These badges ARE retroactive.",
//         "url": "https://www.munzeeblog.com/the-global-grub-overall-capture-line-is-here/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/GGMenu_720.png"
//     },
//     {
//         "title": "🛒 CELEBR8 Sale [Expires 31st July 23:59]",
//         "sub": "12% off many items in store, from Premium Memberships to Flat Friends. Discount automatically applied at checkout.",
//         "url": "https://www.munzeeblog.com/celebr8-sale-pt-2-is-live-with-premium-membership-discounts/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/premium.png"
//     },
//     {
//         "title": "🔵 Munzee App Filters and Circles Update",
//         "sub": "There are now more built-in filters, a deploy mode for each map layer. Circles on the map are now different colours on different layers. Premium members now have 5 custom filter presets.",
//         "url": "https://www.munzeeblog.com/new-magnet-updates-are-quite-attractive/",
//         "icon": "https://img.icons8.com/material-outlined/96/000000/filter.png"
//     },
//     {
//         "title": "🧲 Munzee App Magnet Update",
//         "sub": "Magnetizing in the Munzee App is now significantly easier. Munzee have created a new video showing how to do this.",
//         "url": "https://www.munzeeblog.com/new-magnet-updates-are-quite-attractive/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/magnet.png"
//     },
//     {
//         "title": "🧲 5-Bouncer Magnets on Weekend [20th - 21st July]",
//         "sub": "On Saturday 20th July and Sunday 21st July, Magnets will be able to bring in up to 5 bouncers, more than the normal 3.",
//         "url": "https://www.munzeeblog.com/new-magnet-updates-are-quite-attractive/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/magnet.png"
//     },
//     {
//         "title": "🛒 Weekend Magnet Sale [Expires 22nd July 10:00]",
//         "sub": "5-packs of physical and virtual magnets available in Store for only \$4.50.",
//         "url": "https://www.munzeeblog.com/new-magnet-updates-are-quite-attractive/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/magnet.png"
//     },
//     {
//         "title": "🏆 New \"Classical AlternaMyth Wrangler\" Badge",
//         "sub": "Non-retroactive. Achieved when capping the Fire Pegasus, Cherub, Ogre and Chimera in one day.",
//         "url": "https://www.munzeeblog.com/introducing-the-alternamyth-wrangler-badge-2/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/ogre.png"
//     },
//     {
//         "title": "🚀 Blast off Personal Tags [Available Until 24th July]",
//         "sub": "\$10 Each. Available now in Freeze Tag Store. Free Blast Included!",
//         "url": "https://www.munzeeblog.com/blast-off-personal-tag-on-sale-now/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/personalmunzee.png"
//     },
//     {
//         "title": "🎉 New 1000 Point \"M8\" MOB [Expires 31st July]",
//         "sub": "8 Total. Lands on Greenies. Cap: 1000pts + 8 PinPoints. CapOn: 108pts. 8 hours between bounces.= Attracted to Magnets.",
//         "url": "https://www.munzeeblog.com/introducing-the-flat-flyby-specials/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/8mate.png"
//     },
//     {
//         "title": "🚀 New \"Flat Shuttle\" MOB [Expires 31st July]",
//         "sub": "500 Total. Lands on Virtuals. Cap: 69. CapOn: 19. 6 hours between bounces. Scatters out Flat Flybys within 1000 ft (See below). Attracted to Magnets.",
//         "url": "https://www.munzeeblog.com/introducing-the-flat-flyby-specials/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/flatshuttle.png"
//     },
//     {
//         "title": "👨‍🚀 New \"Flat Flyby\" Scatter [Expires 31st July]",
//         "sub": "Scatters from Flat Shuttles. Lands on Greenies. Cap: 50. CapOn: 19. 4 Variants (Rob, Matt, Lou, Hammock).",
//         "url": "https://www.munzeeblog.com/introducing-the-flat-flyby-specials/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/flatflybyrob.png"
//     },
//     {
//         "title": "🏆 New \"Coupe Champion Nomad\" MOB [Permanent]",
//         "sub": "11 Total. Lands on Greenies. Cap: 500. CapOn: 250. 12 hours between bounces. Attracted to Magnets. Get 1 of 23 Icon Variants on cap.",
//         "url": "https://www.munzeeblog.com/team-usa-earns-golden-icon-for-coupe-du-munzee-victory/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/coupechampionnomad.png"
//     },
//     {
//         "title": "🍴 New \"USA Global Grub\" MOB [Expires 31st December]",
//         "sub": "7 Total. Lands on Virtuals. Cap: 200. CapOn: 100. 12 hours between bounces. Attracted to Magnets. Food is Mac and Cheese.",
//         "url": "https://www.munzeeblog.com/its-a-party-in-the-usa-with-our-latest-global-grub/",
//         "icon": "https://munzee.global.ssl.fastly.net/images/pins/usaglobalgrub.png"
//     },
//     {
//         "title": "🏆 New 8th Place Badges",
//         "sub": "Non-retroactive. 3 Badges achieved for 8th Place on the Daily Total, Physical and Virtual leaderboards respectively.",
//         "url": "https://www.munzeeblog.com/celebrate-the-8zees-with-new-8th-place-badges/",
//         "icon": "https://munzeeblog-new.s3.amazonaws.com/uploads/2019/07/8th_Deb8_720-300x300.png"
//     }
// ];
  @override
  Widget build(BuildContext context) {
    if(entries.length==0){
      return CircularProgressIndicator(
        key:null
      );
    } else {
      return ListView.builder(
        // padding: const EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            dense:true,
            leading: Image.network(
              '${entries[index]["icon"]}',
            ),
            title: Text('${entries[index]["title"]}'),
            subtitle: Text(
              '${entries[index]["sub"]}'
            ),
            onTap:()=>{
              _launchURL(entries[index]["url"])

            }
            // trailing: Icon(Icons.more_vert),
          );
        }
      );
    }
  }
}

_launchURL(String url) async {
  await launch(
    url,
    option: new CustomTabsOption(
      toolbarColor: Colors.green,
      enableDefaultShare: true,
      enableUrlBarHiding: true,
      showPageTitle: true,
      animation: new CustomTabsAnimation.slideIn(),
      extraCustomTabs: <String>[
        // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
        'org.mozilla.firefox',
        // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
        'com.microsoft.emmx',
      ],        
    )
  );
}
