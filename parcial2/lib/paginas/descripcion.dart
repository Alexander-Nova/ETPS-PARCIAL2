import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/paginas/pagar.dart';
import '../constantes/constantes.dart';

class Descripcion extends StatefulWidget {
  final dynamic product;
  Descripcion({Key? key, this.product}) : super(key: key);

  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  var img;
  var st =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyDescripcion(),
    );
  }

  Widget bodyDescripcion() {
    var tamanio = MediaQuery.of(context).size;
    List sillasColores = widget.product['colors'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: tamanio.width,
                height: 300,
                decoration: BoxDecoration(
                  // AssetImage(widget.product["img"]
                  image:
                      DecorationImage(image: st == 1 ? AssetImage(img) : AssetImage(widget.product["img"]), fit: BoxFit.none),
                  color: Color.fromARGB(246, 233, 233, 233),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.product['title'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "\$ " + widget.product['precio'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.grey),
                        Text(
                          "200 reviews",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.product["description"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Colors: ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                        children: List.generate(sillasColores.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // print(sillasColores[index]["color"]);
                                setState(() {
                                  img = sillasColores[index]["img"];
                                  st = 1;
                                  print(img);
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: sillasColores[index]["color"] ==
                                            "red"
                                        ? Colors.red
                                        : sillasColores[index]["color"] ==
                                                "orange"
                                            ? Colors.orange
                                            : sillasColores[index]["color"] ==
                                                    "green"
                                                ? Colors.green
                                                : sillasColores[index]
                                                            ["color"] ==
                                                        "gray"
                                                    ? Colors.grey
                                                    : Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    icon: Icon(Icons.shopping_bag), // Your icon here
                    label: Text("Comprar"), // Your text here
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.topCenter,
                              child: Pagar(
                                  // product: sillas[index],
                                  ),
                              type: PageTransitionType.fade));
                    },
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      FeatherIcons.shoppingBag,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
