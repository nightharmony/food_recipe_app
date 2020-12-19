import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../models/models.dart';

class PostItem extends StatefulWidget {
  final FoodRecipe foodRecipe;

  const PostItem({
    Key key,
    this.foodRecipe,
  }) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {

  _goToPostDetails(){
    Navigator.of(context).pushNamed('post-details',arguments: widget.foodRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _goToPostDetails,
          child: Container(
        child: CachedNetworkImage(
          imageUrl: widget.foodRecipe.imagePath,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => Container(
            color: Colors.black12,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
