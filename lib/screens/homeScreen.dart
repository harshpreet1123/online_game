import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:online_game/constants/friends.dart';
import 'package:online_game/constants/grounds.dart';
import 'package:online_game/models/gameDetails.dart';
import 'package:online_game/provider/appProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String getInitials(String name) {
  List<String> nameParts = name.split(" ");
  String initials = "";

  for (var part in nameParts) {
    initials += part[0].toUpperCase();
  }
  return initials;
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay fromTime = TimeOfDay.now();
  TimeOfDay toTime = TimeOfDay.now();

  Map<String, dynamic> duration(
      {required TimeOfDay fromTime, required TimeOfDay toTime}) {
    int hour = toTime.hour - fromTime.hour;
    int minute = toTime.minute - fromTime.minute;

    if (minute < 0) {
      minute += 60;
      hour--;
    }
    return {"hour": hour, "minute": minute};
  }

  Event buildEvent(title, hours, minutes, selectedDate) {
    return Event(
        title: title,
        startDate: selectedDate,
        endDate: selectedDate.add(Duration(hours: hours, minutes: minutes)),
        iosParams: const IOSParams(reminder: Duration(minutes: 30)));
  }

  var selectedGround;
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    int addedPlayers = appProvider.addedPlayers.length;
    bool playerNumberValidation = appProvider.addedPlayers.length >=
            appProvider.selectedSportData!.minPlayers &&
        appProvider.addedPlayers.length <=
            appProvider.selectedSportData!.maxPlayers;

    Map<String, dynamic> timeDuration =
        duration(fromTime: fromTime, toTime: toTime);
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sports', (route) => false);
            },
            child: Text('${appProvider.selectedSportData?.name}')),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              isDense: false,
              value: selectedGround,
              hint: const Text('Choose Ground'),
              items: groundsList.map((ground) {
                return DropdownMenuItem(
                  value: ground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ground['name'],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                      Text(
                        ground['address'],
                        style: const TextStyle(
                            fontSize: 12, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGround = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Select Timing',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030));
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                    child: const Text('Selcet Date')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: fromTime,
                          );
                          if (pickedTime != null) {
                            setState(() {
                              fromTime = pickedTime;
                            });
                          }
                        },
                        child: const Text('From')),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${fromTime.hour}:${fromTime.minute}',
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const Text('|'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: toTime,
                          );
                          if (pickedTime != null) {
                            setState(() {
                              toTime = pickedTime;
                            });
                          }
                        },
                        child: const Text('To')),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${toTime.hour}:${toTime.minute}',
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Duration:',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Text(
                  '${timeDuration['hour']} Hours : ${timeDuration['minute']} Minutes',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Minimum Palyers required: ${appProvider.selectedSportData?.minPlayers}'),
                Text(
                    'Maximum Palyers required: ${appProvider.selectedSportData?.maxPlayers}'),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Friends',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  '$addedPlayers/${appProvider.selectedSportData!.maxPlayers}',
                  style: TextStyle(
                      color:
                          playerNumberValidation ? Colors.green : Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: friendsList.length,
                itemBuilder: (context, index) {
                  final name = friendsList[index];
                  bool isAdded = appProvider.addedPlayers.contains(name);
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(getInitials(name)),
                      ),
                      title: Text(name),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isAdded) {
                                appProvider.removeFriend(name);
                              } else {
                                appProvider.addFriend(name);
                              }
                            });
                          },
                          icon: Icon(
                            isAdded ? Icons.remove : Icons.add,
                            color: Colors.blue,
                          )),
                    ),
                  );
                }),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: (playerNumberValidation) ? Colors.blue : Colors.grey,
          onPressed: () {
            if (playerNumberValidation) {
              int hours = timeDuration['hour'];
              int minutes = timeDuration['minute'];
              GameDetails gameDetails = GameDetails(
                  ground: selectedGround!['name'] ?? 'Unknown',
                  address: selectedGround!['address'] ?? 'Unknowm',
                  players: appProvider.addedPlayers,
                  sport: appProvider.selectedSportData!.name,
                  date: selectedDate,
                  playerCount: appProvider.addedPlayers.length,
                  durationHour: hours,
                  durationMinute: minutes);
              // print(gameDetails.ground);
              appProvider.addGameDeatils(gameDetails);
              Add2Calendar.addEvent2Cal(buildEvent(
                  appProvider.selectedSportData!.name,
                  hours,
                  minutes,
                  selectedDate));
            }
          },
          label: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: const Center(
                child: Text(
              'Book Slot',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          )),
    );
  }
}
