import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListView.builder(
      //reverse: true,
      itemCount: 2,
      itemBuilder: (context, index){
        if(index == 0){
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Hello I am a large school \nin the kwangju 첫번째',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onPrimary
                ),
              ),

            ),
          );
        } // if        
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Hi I am Smart Internet of \nThings Teacher 두번째',
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onPrimary
              ),
            ),

          ),
        );
      } 
      
    );
  }
}
