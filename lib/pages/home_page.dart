// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:catalog_2/models/catlog.dart';
import 'package:catalog_2/pages/info_page.dart';
import 'package:catalog_2/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 230, 230),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart)),
      body: SafeArea(
          child: Container(
        padding: Vx.m16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py12().expand()
            else
              CircularProgressIndicator().centered().py16().expand(),
          ],
        ),
      )),
      drawer: MyDrawer(),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.black).make(),
        "Electronic Devices".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => info_page(catalog: catalog)),
                ),
              );
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  CatalogItem({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          // padding: const EdgeInsets.all(14.0),
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.imgURL,
            ).box.rounded.p8.color(Colors.white).make().p16().w40(context),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black26),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.xl.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).blue200.roundedSM.square(150).make().py(10);
  }
}

//  ListView.builder(
//                 itemCount: CatalogModel.items.length,
//                 itemBuilder: (context, index) {
//                   return ItemWidget(
//                     items: CatalogModel.items[index],
//                   );
//                 },
//               )

//  Padding(
//         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 12,
//                   crossAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       //color: Colors.blue[50],
//                       child: GridTile(
//                         header: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.brown[200],
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           child: Text(item.name),
//                         ),
//                         footer: Container(
//                           // ignore: sort_child_properties_last
//                           child: Text(
//                             item.price.toString(),
//                           ),
//                           color: Colors.brown[200],
//                           padding: EdgeInsets.all(6),
//                         ),
//                         child: Image.network(item.imgURL),
//                       ));
//                 },
//                 itemCount: CatalogModel.items.length,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
