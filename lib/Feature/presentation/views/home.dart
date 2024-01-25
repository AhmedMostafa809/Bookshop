import 'package:bookshop/Feature/presentation/views/widgets/best_seller_item.dart';
import 'package:bookshop/Feature/presentation/views/widgets/book_item.dart';
import 'package:bookshop/Feature/view_model/featured_books_cubit/cubit/featured_books_cubit.dart';
import 'package:bookshop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/Logo.png",
                    height: 20,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
                builder: (context, state) {
                  if (state is FeaturedBooksSuccess) {
                    print(state.featuredBooks.length.toString());
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.featuredBooks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomListViewItem(
                              imageUrl: state.featuredBooks[index].volumeInfo
                                  .imageLinks!.smallThumbnail),
                        );
                      },
                    );
                  } else if (state is FeaturedBooksError) {
                    return Text(state.errorMessage);
                  } else {
                    return Shimmer(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor
                                .withOpacity(.8)
                                .withGreen(10),
                            Colors.white.withOpacity(.1).withGreen(100)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 20.0,
                                        // color: AppColors.primaryColor,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ));
                    //const Center(

                    // child: CircularProgressIndicator(),
                    // );
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Best Seller",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const BookListViewItem();
              },
            )
          ],
        ),
      ),
    );
  }
}
