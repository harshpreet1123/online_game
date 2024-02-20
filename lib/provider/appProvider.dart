import 'package:flutter/material.dart';
import 'package:online_game/models/gameDetails.dart';
import 'package:online_game/models/sportsModel.dart';

class AppProvider extends ChangeNotifier{
  SportData? selectedSportData; 
  List<GameDetails> bookedGameDetails=[];
  List<String> addedPlayers = []; 

  void addFriend(String friendName) {
    if (!addedPlayers.contains(friendName)) {
      addedPlayers.add(friendName);
      notifyListeners(); 
    }
  }

  void removeFriend(String friendName) {
    if (addedPlayers.contains(friendName)) {
      addedPlayers.remove(friendName);
      notifyListeners(); 
    }
  }

  void updateSelectedSportData(SportData sportData) {
    selectedSportData = sportData;
    notifyListeners(); 
  }

  void addGameDeatils(GameDetails gameDetails){
    bookedGameDetails.add(gameDetails);
    notifyListeners();
  }
}