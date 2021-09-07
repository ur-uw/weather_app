import 'dart:convert';

DailyWeatherData dailyWeatherDataFromJson(String str) =>
    DailyWeatherData.fromJson(json.decode(str));

String dailyWeatherDataToJson(DailyWeatherData data) =>
    json.encode(data.toJson());

class DailyWeatherDataListWeather {
/*
{
  "id": 800,
  "main": "Clear",
  "description": "sky is clear",
  "icon": "01n"
} 
*/

  int? id;
  String? main;
  String? description;
  String? icon;

  DailyWeatherDataListWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  DailyWeatherDataListWeather.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    main = json["main"]?.toString();
    description = json["description"]?.toString();
    icon = json["icon"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}

class DailyWeatherDataListTemp {
/*
{
  "day": 285.51,
  "min": 285.51,
  "max": 285.51,
  "night": 285.51,
  "eve": 285.51,
  "morn": 285.51
} 
*/

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  DailyWeatherDataListTemp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });
  DailyWeatherDataListTemp.fromJson(Map<String, dynamic> json) {
    day = json["day"]?.toDouble();
    min = json["min"]?.toDouble();
    max = json["max"]?.toDouble();
    night = json["night"]?.toDouble();
    eve = json["eve"]?.toDouble();
    morn = json["morn"]?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["day"] = day;
    data["min"] = min;
    data["max"] = max;
    data["night"] = night;
    data["eve"] = eve;
    data["morn"] = morn;
    return data;
  }
}

class DailyWeatherDataList {
/*
{
  "dt": 1485741600,
  "temp": {
    "day": 285.51,
    "min": 285.51,
    "max": 285.51,
    "night": 285.51,
    "eve": 285.51,
    "morn": 285.51
  },
  "pressure": 1013.75,
  "humidity": 100,
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "sky is clear",
      "icon": "01n"
    }
  ],
  "speed": 5.52,
  "deg": 311,
  "gust": 11.3,
  "clouds": 0
} 
*/

  int? dt;
  DailyWeatherDataListTemp? temp;
  double? pressure;
  int? humidity;
  List<DailyWeatherDataListWeather?>? weather;
  double? speed;
  int? deg;
  double? gust;
  int? clouds;

  DailyWeatherDataList({
    this.dt,
    this.temp,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
  });
  DailyWeatherDataList.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    temp = (json["temp"] != null)
        ? DailyWeatherDataListTemp.fromJson(json["temp"])
        : null;
    pressure = json["pressure"]?.toDouble();
    humidity = json["humidity"]?.toInt();
    if (json["weather"] != null) {
      final v = json["weather"];
      final arr0 = <DailyWeatherDataListWeather>[];
      v.forEach((v) {
        arr0.add(DailyWeatherDataListWeather.fromJson(v));
      });
      weather = arr0;
    }
    speed = json["speed"]?.toDouble();
    deg = json["deg"]?.toInt();
    gust = json["gust"]?.toDouble();
    clouds = json["clouds"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    if (temp != null) {
      data["temp"] = temp!.toJson();
    }
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["weather"] = arr0;
    }
    data["speed"] = speed;
    data["deg"] = deg;
    data["gust"] = gust;
    data["clouds"] = clouds;
    return data;
  }
}

class DailyWeatherDataCity {
/*
{
  "geoname_id": 1907296,
  "name": "Tawarano",
  "lat": 35.0164,
  "lon": 139.0077,
  "country": "JP",
  "iso2": "JP",
  "type": "",
  "population": 0
} 
*/

  int? geonameId;
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? iso2;
  String? type;
  int? population;

  DailyWeatherDataCity({
    this.geonameId,
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.iso2,
    this.type,
    this.population,
  });
  DailyWeatherDataCity.fromJson(Map<String, dynamic> json) {
    geonameId = json["geoname_id"]?.toInt();
    name = json["name"]?.toString();
    lat = json["lat"]?.toDouble();
    lon = json["lon"]?.toDouble();
    country = json["country"]?.toString();
    iso2 = json["iso2"]?.toString();
    type = json["type"]?.toString();
    population = json["population"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["geoname_id"] = geonameId;
    data["name"] = name;
    data["lat"] = lat;
    data["lon"] = lon;
    data["country"] = country;
    data["iso2"] = iso2;
    data["type"] = type;
    data["population"] = population;
    return data;
  }
}

class DailyWeatherData {
/*
{
  "cod": "200",
  "message": 0,
  "city": {
    "geoname_id": 1907296,
    "name": "Tawarano",
    "lat": 35.0164,
    "lon": 139.0077,
    "country": "JP",
    "iso2": "JP",
    "type": "",
    "population": 0
  },
  "cnt": 10,
  "list": [
    {
      "dt": 1485741600,
      "temp": {
        "day": 285.51,
        "min": 285.51,
        "max": 285.51,
        "night": 285.51,
        "eve": 285.51,
        "morn": 285.51
      },
      "pressure": 1013.75,
      "humidity": 100,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "sky is clear",
          "icon": "01n"
        }
      ],
      "speed": 5.52,
      "deg": 311,
      "gust": 11.3,
      "clouds": 0
    }
  ]
} 
*/

  String? cod;
  int? message;
  DailyWeatherDataCity? city;
  int? cnt;
  List<DailyWeatherDataList?>? list;

  DailyWeatherData({
    this.cod,
    this.message,
    this.city,
    this.cnt,
    this.list,
  });
  DailyWeatherData.fromJson(Map<String, dynamic> json) {
    cod = json["cod"]?.toString();
    message = json["message"]?.toInt();
    city = (json["city"] != null)
        ? DailyWeatherDataCity.fromJson(json["city"])
        : null;
    cnt = json["cnt"]?.toInt();
    if (json["list"] != null) {
      final v = json["list"];
      final arr0 = <DailyWeatherDataList>[];
      v.forEach((v) {
        arr0.add(DailyWeatherDataList.fromJson(v));
      });
      list = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cod"] = cod;
    data["message"] = message;
    if (city != null) {
      data["city"] = city!.toJson();
    }
    data["cnt"] = cnt;
    if (list != null) {
      final v = list;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["list"] = arr0;
    }
    return data;
  }
}
