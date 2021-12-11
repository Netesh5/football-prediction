//Fetching Data from API
import 'package:http/http.dart' as http;

class APIdata {
  Future fetchdata() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://football-prediction-api.p.rapidapi.com/api/v2/predictions"),
        headers: {
          'x-rapidapi-host': 'football-prediction-api.p.rapidapi.com',
          'x-rapidapi-key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55'
        });
    return response;
  }
}
