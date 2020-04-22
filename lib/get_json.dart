import 'dart:convert';

import 'package:http/http.dart' as http;

class GetJson{
  List<dynamic> _videosData=List<dynamic>();

  Future<List<dynamic>> getData() async{
    var url = 'https://raw.githubusercontent.com/Mahmoudtarek59/videos-Json/master/Videos_Json';
    var response = await http.get(url);
    if(response.statusCode==200){
      _videosData = await jsonDecode(response.body);
    }
    else{
      return null;
    }
    return _videosData;
  }
}