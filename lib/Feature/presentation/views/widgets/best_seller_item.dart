import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/bookDetails');
        },
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Container(
                // height: 200,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.ytimg.com/vi/duL9hKwRgXA/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCA8MWmtOOn24cMVqCvG1VmT80OjA"),
                        fit: BoxFit.fill)),
                // child: Image.network(""),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: const Text("Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text("Author", style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: const [
                        Text('Free', style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("4.8 (2380)")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
