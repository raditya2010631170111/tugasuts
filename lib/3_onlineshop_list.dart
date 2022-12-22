import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts/1_onlineshop_model.dart';
import 'package:uts/4_onlineshop_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:
          SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/splash.png")),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: defaultMargin * 4, left: defaultMargin * 2),
            child: Text(
              "Online Shop Router",
            ),
          )
        ],
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  const ItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        color: cChocolate,
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OnlineShop()));
          },
          child: Text(
            "Router",
          ),
        ));
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: ItemButton(),
        body: Stack(children: [
          Container(
            height: 900,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/login.jpg"))),
          ),
          Container(
            margin: EdgeInsets.only(
                left: defaultMargin,
                top: defaultMargin * 4,
                right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your name"),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  cursorColor: cWhite,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(color: cWhite),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cWhite)),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}


class OnlineShop extends StatelessWidget {
  const OnlineShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Router')),
        body: FutureBuilder<String>(
          future:
              DefaultAssetBundle.of(context).loadString('assets/hospital.json'),
          builder: (context, snapshot) {
            List<OnlineShopModel> onlineshop = parse(snapshot.data);

            return ListView.builder(
              itemCount: onlineshop.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnlineShopDetail(
                            onlineshopModel: onlineshop[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.network(onlineshop[index].pictureId),
                    title: Text(onlineshop[index]
                        .name), //subtitle: Text(onlineshop[index].merk),
                    trailing: Text("${onlineshop[index].rating}"),
                    contentPadding: const EdgeInsets.all(
                      8.0,
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}


//  FutureBuilder<String>(
//         future:
//             DefaultAssetBundle.of(context).loadString('assets/hospital.json'),
//         builder: (context, snapshot) {
//           List<HospitalModel> hospitals = parse(snapshot.data);
//           return ListView.builder(
//             itemCount: hospitals.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HospitalDetail(
//                         hospitalModel: hospitals[index],
//                       ),
//                     )),
//                 child: ListTile(
//                   leading: Image.network(
//                     hospitals[index].pictureId,
//                   ),
//                   title: Text(
//                     hospitals[index].name,
//                   ),
//                   contentPadding: const EdgeInsets.all(8.0),
//                 ),
//               );
//             },
//           );
//         },
//       ),