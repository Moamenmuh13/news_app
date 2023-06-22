import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget myDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0),
    child: Divider(),
  );
}

Widget buildArticleItem(article) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                      '${article['urlToImage']}'),
                  fit: BoxFit.cover),
            )),
        SizedBox(width: 10.0,),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                ),
                // Expanded(
                //     child: Text(
                //       "NASA has announced Space Act agreements with seven private space companies in the hopes of spurring tech developments the government may invest in down the line, from space stations to human transpor… [+2168 chars]", style: TextStyle(
                //         fontSize: 16.0 , color: Colors.black
                //     ), maxLines: 3 , overflow: TextOverflow.ellipsis,)),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget articleBuilder(list){
  return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index]),
        itemCount: list.length,
        separatorBuilder: (context, index) => myDivider(),
      ),
      fallback: (context) =>
      const Center(child: CircularProgressIndicator()));
}
