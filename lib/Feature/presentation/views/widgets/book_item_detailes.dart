import 'package:bookshop/Feature/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookDetailes extends StatelessWidget {
  const BookDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: true,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              size: 24,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 24,
                            ))
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://i.ytimg.com/vi/duL9hKwRgXA/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCA8MWmtOOn24cMVqCvG1VmT80OjA"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Title",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text("Author", style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Free', style: TextStyle(fontSize: 20)),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("4.8 (2380)")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                ),
                                child: const Text(
                                  "19",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                ),
                                child: const Text(
                                  "Free preview",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomListViewItem(
                                imageUrl:
                                    "https://i.ytimg.com/vi/duL9hKwRgXA/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCA8MWmtOOn24cMVqCvG1VmT80OjA"),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
