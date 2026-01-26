import 'package:flutter/material.dart';
class HomeProvider with ChangeNotifier
{
int count =0;
void increment ()
{
  count++;
  notifyListeners();
}
}



class HomeProvider2 with ChangeNotifier
{
  int count =0;
  void increment ()
  {
    count++;
    notifyListeners();
  }
}


class HomeProvider3 with ChangeNotifier
{
  int count =0;
  void increment ()
  {
    count++;
    notifyListeners();
  }
}