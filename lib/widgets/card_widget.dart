import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/model/ketolist.dart';
import 'package:myapp1/views/detail_view.dart';

Widget cardWidget(KetoList model, BuildContext context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => DetailView(
                      model: model,
                    )));
      },
      child: Hero(
        tag: "${model.title}",
        child: Material(
          type: MaterialType.transparency,
          child: Container(
              margin: EdgeInsets.only(bottom: 3),
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: getImage(model.detail[0].detailImage),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(180, 0, 0, 0), BlendMode.luminosity)),
              ),
              child: cardContent(model)),
        ),
      ),
    );
ImageProvider getImage(url) {
  print(url);
  try {
    return NetworkImage(
      url,
    );
  } catch (e) {
    return AssetImage('assets/images/keto1.jpg');
  }
}

Widget cardContent(KetoList model) => Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  title(model.title),
                  Icon(
                    Icons.photo_library,
                    color: Colors.white,
                  ),
                  countOfMenu(model.detail.length.toString()),
                ],
              ),
            ),
            Expanded(flex: 3, child: subTitle(model.subtitle)),
          ]),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );

Widget countOfMenu(String number) => Text(
      number,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            // bottomLeft
            offset: Offset(0, 0),
            color: Colors.black,
            blurRadius: 20,
          ),
        ],
      ),
    );

Widget title(String title) => Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            offset: Offset(0, 0),
            color: Colors.black,
            blurRadius: 20,
          ),
        ],
      ),
    );

Widget subTitle(String subtitle) => Center(
      child: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          shadows: [
            Shadow(
              // bottomLeft
              offset: Offset(0, 0),
              color: Colors.black,
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
