import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherDataDailyWeather {
/*
{
  "id": 800,
  "main": "Clear",
  "description": "clear sky",
  "icon": "01d"
} 
*/

  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDataDailyWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherDataDailyWeather.fromJson(Map<String, dynamic> json) {
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

class WeatherDataDailyFeelsLike {
/*
{
  "day": 39.71,
  "night": 33.11,
  "eve": 38.12,
  "morn": 29.91
} 
*/

  double? day;
  double? night;
  double? eve;
  double? morn;

  WeatherDataDailyFeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });
  WeatherDataDailyFeelsLike.fromJson(Map<String, dynamic> json) {
    day = json["day"]?.toDouble();
    night = json["night"]?.toDouble();
    eve = json["eve"]?.toDouble();
    morn = json["morn"]?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["day"] = day;
    data["night"] = night;
    data["eve"] = eve;
    data["morn"] = morn;
    return data;
  }
}

class WeatherDataDailyTemp {
/*
{
  "day": 42.43,
  "min": 31.67,
  "max": 43.14,
  "night": 35.06,
  "eve": 40.92,
  "morn": 31.67
} 
*/

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  WeatherDataDailyTemp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });
  WeatherDataDailyTemp.fromJson(Map<String, dynamic> json) {
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

class WeatherDataDaily {
/*
{
  "dt": 1631005200,
  "sunrise": 1630982560,
  "sunset": 1631028099,
  "moonrise": 1630982880,
  "moonset": 1631030220,
  "moon_phase": 0,
  "temp": {
    "day": 42.43,
    "min": 31.67,
    "max": 43.14,
    "night": 35.06,
    "eve": 40.92,
    "morn": 31.67
  },
  "feels_like": {
    "day": 39.71,
    "night": 33.11,
    "eve": 38.12,
    "morn": 29.91
  },
  "pressure": 1006,
  "humidity": 11,
  "dew_point": 5.82,
  "wind_speed": 6.75,
  "wind_deg": 327,
  "wind_gust": 13.06,
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "clouds": 0,
  "pop": 0,
  "uvi": 8.25
} 
*/

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  int? moonPhase;
  WeatherDataDailyTemp? temp;
  WeatherDataDailyFeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? rain;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<WeatherDataDailyWeather?>? weather;
  int? clouds;
  int? pop;
  double? uvi;

  WeatherDataDaily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.rain,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
  });
  WeatherDataDaily.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    sunrise = json["sunrise"]?.toInt();
    sunset = json["sunset"]?.toInt();
    moonrise = json["moonrise"]?.toInt();
    moonset = json["moonset"]?.toInt();
    moonPhase = json["moon_phase"]?.toInt();
    temp = (json["temp"] != null)
        ? WeatherDataDailyTemp.fromJson(json["temp"])
        : null;
    feelsLike = (json["feels_like"] != null)
        ? WeatherDataDailyFeelsLike.fromJson(json["feels_like"])
        : null;
    pressure = json["pressure"]?.toInt();
    humidity = json["humidity"]?.toInt();
    rain = json["rain"]?.toDouble();
    dewPoint = json["dew_point"]?.toDouble();
    windSpeed = json["wind_speed"]?.toDouble();
    windDeg = json["wind_deg"]?.toInt();
    windGust = json["wind_gust"]?.toDouble();
    if (json["weather"] != null) {
      final v = json["weather"];
      final arr0 = <WeatherDataDailyWeather>[];
      v.forEach((v) {
        arr0.add(WeatherDataDailyWeather.fromJson(v));
      });
      weather = arr0;
    }
    clouds = json["clouds"]?.toInt();
    pop = json["pop"]?.toInt();
    uvi = json["uvi"]?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    data["moonrise"] = moonrise;
    data["moonset"] = moonset;
    data["moon_phase"] = moonPhase;
    if (temp != null) {
      data["temp"] = temp!.toJson();
    }
    if (feelsLike != null) {
      data["feels_like"] = feelsLike!.toJson();
    }
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    data["rain"] = rain;
    data["dew_point"] = dewPoint;
    data["wind_speed"] = windSpeed;
    data["wind_deg"] = windDeg;
    data["wind_gust"] = windGust;
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["weather"] = arr0;
    }
    data["clouds"] = clouds;
    data["pop"] = pop;
    data["uvi"] = uvi;
    return data;
  }
}

class WeatherDataHourlyWeather {
/*
{
  "id": 800,
  "main": "Clear",
  "description": "clear sky",
  "icon": "01d"
} 
*/

  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDataHourlyWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherDataHourlyWeather.fromJson(Map<String, dynamic> json) {
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

class WeatherDataHourly {
/*
{
  "dt": 1631012400,
  "temp": 43.14,
  "feels_like": 39.85,
  "pressure": 1005,
  "humidity": 9,
  "dew_point": 3.48,
  "uvi": 5.94,
  "clouds": 0,
  "visibility": 10000,
  "wind_speed": 4.46,
  "wind_deg": 290,
  "wind_gust": 3.77,
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "pop": 0
} 
*/

  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? rain;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<WeatherDataHourlyWeather?>? weather;
  int? pop;

  WeatherDataHourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.rain,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });
  WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    temp = json["temp"]?.toDouble();
    feelsLike = json["feels_like"]?.toDouble();
    pressure = json["pressure"]?.toInt();
    humidity = json["humidity"]?.toInt();
    rain = json["rain"]?.toDouble();
    dewPoint = json["dew_point"]?.toDouble();
    uvi = json["uvi"]?.toDouble();
    clouds = json["clouds"]?.toInt();
    visibility = json["visibility"]?.toInt();
    windSpeed = json["wind_speed"]?.toDouble();
    windDeg = json["wind_deg"]?.toInt();
    windGust = json["wind_gust"]?.toDouble();
    if (json["weather"] != null) {
      final v = json["weather"];
      final arr0 = <WeatherDataHourlyWeather>[];
      v.forEach((v) {
        arr0.add(WeatherDataHourlyWeather.fromJson(v));
      });
      weather = arr0;
    }
    pop = json["pop"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    data["rain"] = rain;
    data["dew_point"] = dewPoint;
    data["uvi"] = uvi;
    data["clouds"] = clouds;
    data["visibility"] = visibility;
    data["wind_speed"] = windSpeed;
    data["wind_deg"] = windDeg;
    data["wind_gust"] = windGust;
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["weather"] = arr0;
    }
    data["pop"] = pop;
    return data;
  }
}

class WeatherDataMinutely {
/*
{
  "dt": 1631015460,
  "precipitation": 0
} 
*/

  int? dt;
  int? precipitation;

  WeatherDataMinutely({
    this.dt,
    this.precipitation,
  });
  WeatherDataMinutely.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    precipitation = json["precipitation"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    data["precipitation"] = precipitation;
    return data;
  }
}

class WeatherDataCurrentWeather {
/*
{
  "id": 800,
  "main": "Clear",
  "description": "clear sky",
  "icon": "01d"
} 
*/

  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDataCurrentWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherDataCurrentWeather.fromJson(Map<String, dynamic> json) {
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

class WeatherDataCurrent {
/*
{
  "dt": 1631015421,
  "sunrise": 1630982560,
  "sunset": 1631028099,
  "temp": 43.13,
  "feels_like": 39.84,
  "pressure": 1005,
  "humidity": 9,
  "dew_point": 3.47,
  "uvi": 3.75,
  "clouds": 0,
  "visibility": 10000,
  "wind_speed": 4.84,
  "wind_deg": 289,
  "wind_gust": 4.14,
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ]
} 
*/

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? rain;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<WeatherDataCurrentWeather?>? weather;

  WeatherDataCurrent({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.rain,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });
  WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    sunrise = json["sunrise"]?.toInt();
    sunset = json["sunset"]?.toInt();
    temp = json["temp"]?.toDouble();
    feelsLike = json["feels_like"]?.toDouble();
    pressure = json["pressure"]?.toInt();
    humidity = json["humidity"]?.toInt();
    rain = json["rain"]?.toDouble();
    dewPoint = json["dew_point"]?.toDouble();
    uvi = json["uvi"]?.toDouble();
    clouds = json["clouds"]?.toInt();
    visibility = json["visibility"]?.toInt();
    windSpeed = json["wind_speed"]?.toDouble();
    windDeg = json["wind_deg"]?.toInt();
    windGust = json["wind_gust"]?.toDouble();
    if (json["weather"] != null) {
      final v = json["weather"];
      final arr0 = <WeatherDataCurrentWeather>[];
      v.forEach((v) {
        arr0.add(WeatherDataCurrentWeather.fromJson(v));
      });
      weather = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    data["rain"] = rain;
    data["dew_point"] = dewPoint;
    data["uvi"] = uvi;
    data["clouds"] = clouds;
    data["visibility"] = visibility;
    data["wind_speed"] = windSpeed;
    data["wind_deg"] = windDeg;
    data["wind_gust"] = windGust;
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["weather"] = arr0;
    }
    return data;
  }
}

class WeatherData {
/*
{
  "lat": 32.6027,
  "lon": 44.0197,
  "timezone": "Asia/Baghdad",
  "timezone_offset": 10800,
  "current": {
    "dt": 1631015421,
    "sunrise": 1630982560,
    "sunset": 1631028099,
    "temp": 43.13,
    "feels_like": 39.84,
    "pressure": 1005,
    "humidity": 9,
    "dew_point": 3.47,
    "uvi": 3.75,
    "clouds": 0,
    "visibility": 10000,
    "wind_speed": 4.84,
    "wind_deg": 289,
    "wind_gust": 4.14,
    "weather": [
      {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01d"
      }
    ]
  },
  "minutely": [
    {
      "dt": 1631015460,
      "precipitation": 0
    }
  ],
  "hourly": [
    {
      "dt": 1631012400,
      "temp": 43.14,
      "feels_like": 39.85,
      "pressure": 1005,
      "humidity": 9,
      "dew_point": 3.48,
      "uvi": 5.94,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 4.46,
      "wind_deg": 290,
      "wind_gust": 3.77,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "pop": 0
    }
  ],
  "daily": [
    {
      "dt": 1631005200,
      "sunrise": 1630982560,
      "sunset": 1631028099,
      "moonrise": 1630982880,
      "moonset": 1631030220,
      "moon_phase": 0,
      "temp": {
        "day": 42.43,
        "min": 31.67,
        "max": 43.14,
        "night": 35.06,
        "eve": 40.92,
        "morn": 31.67
      },
      "feels_like": {
        "day": 39.71,
        "night": 33.11,
        "eve": 38.12,
        "morn": 29.91
      },
      "pressure": 1006,
      "humidity": 11,
      "dew_point": 5.82,
      "wind_speed": 6.75,
      "wind_deg": 327,
      "wind_gust": 13.06,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 8.25
    }
  ]
} 
*/

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  WeatherDataCurrent? current;
  List<WeatherDataMinutely?>? minutely;
  List<WeatherDataHourly?>? hourly;
  List<WeatherDataDaily?>? daily;

  WeatherData({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });
  WeatherData.fromJson(Map<String, dynamic> json) {
    lat = json["lat"]?.toDouble();
    lon = json["lon"]?.toDouble();
    timezone = json["timezone"]?.toString();
    timezoneOffset = json["timezone_offset"]?.toInt();
    current = (json["current"] != null)
        ? WeatherDataCurrent.fromJson(json["current"])
        : null;
    if (json["minutely"] != null) {
      final v = json["minutely"];
      final arr0 = <WeatherDataMinutely>[];
      v.forEach((v) {
        arr0.add(WeatherDataMinutely.fromJson(v));
      });
      minutely = arr0;
    }
    if (json["hourly"] != null) {
      final v = json["hourly"];
      final arr0 = <WeatherDataHourly>[];
      v.forEach((v) {
        arr0.add(WeatherDataHourly.fromJson(v));
      });
      hourly = arr0;
    }
    if (json["daily"] != null) {
      final v = json["daily"];
      final arr0 = <WeatherDataDaily>[];
      v.forEach((v) {
        arr0.add(WeatherDataDaily.fromJson(v));
      });
      daily = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["lat"] = lat;
    data["lon"] = lon;
    data["timezone"] = timezone;
    data["timezone_offset"] = timezoneOffset;
    if (current != null) {
      data["current"] = current!.toJson();
    }
    if (minutely != null) {
      final v = minutely;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["minutely"] = arr0;
    }
    if (hourly != null) {
      final v = hourly;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["hourly"] = arr0;
    }
    if (daily != null) {
      final v = daily;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["daily"] = arr0;
    }
    return data;
  }
}
