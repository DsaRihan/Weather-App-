import 'package:bloc/bloc.dart';
import 'package:flutter_application/data/my_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<Fetchweather>((event, emit) async{
      emit(WeatherLoading());
      try{
        WeatherFactory wf=WeatherFactory(API_KEY,language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude
          );
          print(weather);
        emit(WeatherSuccess(weather));
      }
      catch(e){
        emit(WeatherFailure());
      }
    });
  }
}
