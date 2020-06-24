import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location;
  String time;
  String flag;
  String url;
  bool isday;
  bool iseven;
  WorldTime({this.location,this.flag, this.url});  
  Future<void> getTime () async
  {
    try
    {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = offset.substring(0,1)=='+' ? now.add(Duration(hours: int.parse(offset.substring(1,3)), minutes: int.parse(offset.substring(4,6)))) : now.subtract(Duration(hours: int.parse(offset.substring(1,3)), minutes: int.parse(offset.substring(4,6))));
      //now = now.add(Duration(hours: int.parse(offset.substring(1,3)), minutes: int.parse(offset.substring(4,6))));
      isday = now.hour>=6 && now.hour<17 ? true : false;
      iseven = now.hour>=17 && now.hour<20 ? true : false;
      this.time = DateFormat.jm().format(now);
    }
    catch(c)
    {
      print('Caught Error: $c');
      time = 'Could not get time data';
    }
  }
}