import 'package:flutter/material.dart';
import 'package:parcial2/paginas/descripcion.dart';
import 'package:parcial2/paginas/principal.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../constantes/constantes.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activoMenu1 = 0;
  int activoMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 165, 136),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(FeatherIcons.alignJustify),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FeatherIcons.shoppingBag),
          ),
        ],
      ),
      body: bodyApp(),
      // body: Principal(),
    );
  }

  Widget bodyApp() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Comercial SIVAR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: Icon(FeatherIcons.search),
                hintText: "Buscar...",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 32.0),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //crossAxisAlignment: CrossAxisAlignment.start,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  children: List.generate(categorias.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activoMenu1 = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categorias[index],
                          style: TextStyle(
                              //color: Colors.grey,
                              fontSize: 15,
                              color: activoMenu1 == index
                                  ? Colors.teal
                                  : Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // activoMenu1 == index
                        //     ? Container(
                        //         width: 10,
                        //         height: 3,
                        //         decoration: BoxDecoration(
                        //             color: Colors.purple[800],
                        //             borderRadius: BorderRadius.circular(10)),
                        //       )
                        //     : Container(),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(sillas.length - 2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.topCenter,
                              child: Descripcion(
                                product: sillas[index],
                              ),
                              type: PageTransitionType.fade));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(sillas[index]['img']),
                                  fit: BoxFit.none),
                              border: Border.all(
                                  color: Colors.black, // Set border color
                                  width: 0.5),
                              color: Color.fromARGB(246, 233, 233, 233),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          sillas[index]['title'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          sillas[index]['precio'],
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(sillas.length - 2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.topCenter,
                              child: Descripcion(
                                product: sillas[index + 2],
                              ),
                              type: PageTransitionType.fade));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(sillas[index + 2]['img']),
                                  fit: BoxFit.none),
                              border: Border.all(
                                  color: Colors.black, // Set border color
                                  width: 0.5),
                              color: Color.fromARGB(246, 233, 233, 233),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          sillas[index + 2]['title'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          sillas[index + 2]['precio'],
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
