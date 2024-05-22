import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../model/JangterModel.dart';

class DetailPage extends StatefulWidget {
  JangterModel? jangterModel;
  DetailPage({super.key, this.jangterModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    int likeCount = int.parse(widget.jangterModel!.liked);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jangterModel!.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                    widget.jangterModel!.imgPath,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                widget.jangterModel!.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15,),
              Text(
                widget.jangterModel!.price,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 15,),
              Text(
                widget.jangterModel!.address,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700
                ),
              ),
              SizedBox(height: 15),
              LikeButton(
                isLiked: isLiked,
                likeCount: likeCount,
              ),
              SizedBox(height: 15,),
              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                label: Text('닫 기'),
              ),

            ],
          ),

        ),
      ),

    );
  }
}
