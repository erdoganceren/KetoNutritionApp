import 'package:flutter/material.dart';
import 'package:myapp1/model/detailmodel.dart';
import 'package:myapp1/model/ketolist.dart';
import 'package:myapp1/theme/mytheme.dart';

class DetailView extends StatefulWidget {
  KetoList model;
  DetailView({this.model});
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool goRecipe = false;
  @override
  void initState() {
    super.initState();
    goRecipe = false;
  }

  @override
  Widget build(BuildContext context) {
    double SCREENWIDTH = MediaQuery.of(context).size.width;
    double SCREENHEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              goRecipe = false;
            });
          } ,
          itemCount: widget.model.detail.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Material(
            type: MaterialType.transparency,
            child: Container(
              width: SCREENWIDTH,
              height: SCREENHEIGHT,
              decoration: BoxDecoration(
                color:Colors.black,
                image: DecorationImage(
                  image: NetworkImage(widget.model.detail[index].detailImage),
                  fit: BoxFit.cover,
                  colorFilter: getColorFilter(),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey[600],
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "1/27",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: Colors.grey[600]),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 26,
                    child: Column(
                      children: getPage(widget.model.detail[index]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> recipe(Detail model, double SCREENWIDTH, double SCREENHEIGHT) =>
      [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: SCREENHEIGHT * .03),
            child: Icon(
              Icons.shopping_cart,
              size:  SCREENHEIGHT * .04,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: SCREENHEIGHT * .03,bottom:  SCREENHEIGHT * .03),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: model.materials
                    .map((item) => Text(
                          item,
                          style: themeData.textTheme.display1,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: SCREENHEIGHT * .03,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      Text(
                        " ${model.minPrep} dk hazırlama",
                        style: themeData.textTheme.display2,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: SCREENHEIGHT * .03,
                        color: Colors.white.withOpacity(0.8)
                      ),
                      Text(
                        " ${model.serving} servis",
                        style: themeData.textTheme.display2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: SingleChildScrollView(
                      child: Container(
              padding: EdgeInsets.all(SCREENHEIGHT * .03),
              child: Text(model.recipe,style: themeData.textTheme.display1),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey[600],
                size:  SCREENHEIGHT * .05,
              ),
              onPressed: () {
                setState(() {
                  goRecipe = false;
                });
              },
            ),
          ),
        )
      ];

  List<Widget> detail(Detail model, double SCREENWIDTH, double SCREENHEIGHT) =>
      [
        Expanded(
          flex: 3,
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SCREENHEIGHT * .04,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getBenefit(SCREENHEIGHT, model),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getIcons(SCREENHEIGHT, model),
            ),
          ),
        ),
        Expanded(
            flex: 8,
            child: InkWell(
              onTap: () => setState(() {
                goRecipe = true;
              }),
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  radius: SCREENHEIGHT * 0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: SCREENHEIGHT * .06,
                      ),
                      Text(
                        "TARİF",
                        style: TextStyle(
                fontSize: SCREENHEIGHT * .03,
                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "${model.netCarb}g  |  ${model.totalCarb}g",
                    style: TextStyle(
                        color: Colors.white, fontSize: SCREENHEIGHT * .024),
                  ),
                  Text("net karbo  |  toplam",
                      style: TextStyle(
                          color: Colors.white, fontSize: SCREENHEIGHT * .024)),
                ],
              ),
              Column(
                children: [
                  Text("${model.protein}g",
                      style: TextStyle(
                          color: Colors.white, fontSize: SCREENHEIGHT * .024)),
                  Text("protein",
                      style: TextStyle(
                          color: Colors.white, fontSize: SCREENHEIGHT * .024)),
                ],
              ),
              Column(
                children: [
                  Text("${model.totalFat}g  |  &${model.saturation}",
                      style: TextStyle(
                          color: Colors.white, fontSize: SCREENHEIGHT * .024)),
                  Text("toplam yağ  |  yüzde",
                      style: TextStyle(
                          color: Colors.white, fontSize: SCREENHEIGHT * .024)),
                ],
              )
            ],
          ),
        ),
      ];

  ColorFilter getColorFilter() {
    if (goRecipe == false) {
      return ColorFilter.mode(
          Color.fromARGB(180, 0, 0, 0), BlendMode.xor);
    }
    return ColorFilter.mode(Color.fromARGB(230, 0, 0, 0), BlendMode.xor);
  }

  List<Widget> getBenefit(double SCREENHEIGHT, Detail model) {
    List<Widget> list = [];
    if (model.benefit != " ") {
      list.addAll([
        Icon(
          Icons.fitness_center,
          color: Colors.white,
        ),
        Text("  "),
        Text(
          model.benefit,
          style: TextStyle(fontSize: SCREENHEIGHT * .02, color: Colors.white),
        )
      ]);
    } else {
      list.add(Text(" "));
    }
    return list;
  }

  List<Widget> getIcons(double SCREENHEIGHT, Detail model) {
    List<Widget> list = [];
    if (model.isGlutenFree == true) {
      list.add(Column(
        children: [
          Icon(
            Icons.local_florist,
            color: Colors.white,
            size: 18,
          ),
          Text("glutensiz",
              style: TextStyle(
                  fontSize: SCREENHEIGHT * .014, color: Colors.white)),
        ],
      ));
    }
    if (model.isFastPrep) {
      list.add(
        Column(
          children: [
            Icon(
              Icons.timer,
              color: Colors.white,
              size: 18,
            ),
            Text("hızlı hazırlık",
                style: TextStyle(
                    fontSize: SCREENHEIGHT * .014, color: Colors.white)),
          ],
        ),
      );
    }
    if (model.isVegan) {
      list.add(
        Column(
          children: [
            Icon(
              Icons.done,
              color: Colors.white,
              size: 18,
            ),
            Text("vegan",
                style: TextStyle(
                    fontSize: SCREENHEIGHT * .014, color: Colors.white)),
          ],
        ),
      );
    }
    return list;
  }

  List<Widget> getPage(Detail model) {
    if (goRecipe == true) {
      return recipe(model, MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height);
    }
    return detail(model, MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height);
  }
}
