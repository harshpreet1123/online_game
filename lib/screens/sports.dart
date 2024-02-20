import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_game/constants/sportsList.dart';
import 'package:online_game/models/sportsModel.dart';
import 'package:online_game/provider/appProvider.dart';
import 'package:provider/provider.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sportsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  final sport = sportsList[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: InkWell(
                      onTap: () {
                        final selectedSportData = SportData(
                          name: sport['name'],
                          svg: sport['svg'],
                          minPlayers: sport['minPlayers'],
                          maxPlayers: sport['maxPlayers'],
                        );
                        appProvider.updateSelectedSportData(selectedSportData);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset(
                            'assets/svg/${sport['svg']}',
                            height: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${sport['name']}',
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
