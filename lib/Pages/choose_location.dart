
import 'package:flutter/material.dart';
import 'package:myapp1/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png',),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png',),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.png',),
    WorldTime(url: 'Europe/Athens', location: 'Greece', flag: 'greece.png',),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png',),
    WorldTime(url: 'Asia/Jakarta', location: 'indonesia', flag: 'indonesia.png',),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png',),
    WorldTime(url: 'Asia/Seoul', location: 'South Korea', flag: 'south_korea.png',),
    WorldTime(url: 'America/New_York', location: 'America', flag: 'usa.png',),
    WorldTime(url: 'Europe/Samara', location: 'Russia', flag: 'russia.jpg',),
    WorldTime(url: 'Europe/Madrid', location: 'Spain', flag: 'spain.png',),
  ];


  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday': instance.isday,
      'iseven': instance.iseven,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}