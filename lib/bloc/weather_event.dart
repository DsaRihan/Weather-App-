part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}
 class Fetchweather extends WeatherEvent {
    final Position position;

	  Fetchweather(this.position);
 }
