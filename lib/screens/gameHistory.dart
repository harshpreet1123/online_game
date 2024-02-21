import 'package:flutter/material.dart';
import 'package:online_game/models/gameDetails.dart';
import 'package:online_game/provider/appProvider.dart';
import 'package:online_game/widgets/gameHistoryCard.dart';
import 'package:provider/provider.dart';

class GameHistory extends StatelessWidget {
  const GameHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    List<GameDetails> gameHistoryList = appProvider.bookedGameDetails;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        appBar: AppBar(
          title: const Text('Game History'),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: appProvider.bookedGameDetails.isNotEmpty
                    ? gameHistoryCard(gameHistoryList: gameHistoryList)
                    : const Center(
                        child: Icon(
                          Icons.not_interested,
                          size: 100,
                        ),
                      ),
              ),
              appProvider.bookedGameDetails.isNotEmpty
                  ? const SizedBox(
                      height: 100,
                    )
                  : Container()
            ],
          ),
        ));
  }
}
