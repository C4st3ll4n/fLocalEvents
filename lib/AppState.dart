import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{
  int selectedCategoryId = 0;

  void updateCategoryId(int newCatID){
    this.selectedCategoryId = newCatID;
    notifyListeners();
  }
}