import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/models/food_recipe_model.dart';
import 'package:food_recipe/ui/general/appbar/account_appbar.dart';
import 'package:food_recipe/ui/general/appbar/post_detail_appbar.dart';

class PostDetails extends StatefulWidget {
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    var count = 0;
    final size = MediaQuery.of(context).size;
    final FoodRecipe foodRecipe = ModalRoute.of(context).settings.arguments;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PostDetailAppbar(
          title: foodRecipe.title,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                child: CachedNetworkImage(
                  imageUrl: foodRecipe.imagePath,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    color: Colors.black12,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                height: size.height * 0.7,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.grading,
                              color: Colors.black,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.widgets,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              child: ListView(
                                children: foodRecipe.ingredients.map((e) {
                                  return Card(
                                    elevation: 2,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    child: ListTile(
                                      key: UniqueKey(),
                                      leading: Icon(
                                        Icons.restaurant_menu,
                                        color: Colors.black,
                                      ),
                                      title: Text(e),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              child: ListView(
                                children: foodRecipe.steps.map((stepMap) {
                                  return Container(
                                    width: size.width,
                                    child: Card(
                                      elevation: 2,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 3,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Step Number : ' +
                                                  stepMap['step_number'],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10),
                                              child: Text(
                                                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
