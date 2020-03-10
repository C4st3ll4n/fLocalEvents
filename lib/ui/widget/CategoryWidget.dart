import 'package:flocalevents/StyleGuide.dart';
import 'package:flocalevents/model/Category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppState.dart';

class CategoryWidget extends StatelessWidget {

  final Category categoria;

  const CategoryWidget({Key key, this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == categoria.categoryId;

    return GestureDetector(
      onTap: (){
        if(!isSelected){
          appState.updateCategoryId(categoria.categoryId);
        }
      },child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected? Colors.white:Color(0x99FFFFFF),
        width: 3), borderRadius: BorderRadius.all(Radius.circular(16)),
        color: isSelected? Colors.white : Colors.transparent
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(categoria.icon,
          color: isSelected? Theme.of(context).primaryColor: Colors.white, size: 40,),
          SizedBox(height: 10,),
          SizedBox(height: 10,),
          Text(categoria.name, style: isSelected?selectedCategoryTextStyle: categoryTextStyle,)
        ],
      ),
    ),
    );
  }
}
