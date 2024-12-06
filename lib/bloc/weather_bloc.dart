import 'package:bloc/bloc.dart';
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
        WeatherFactory wf=WeatherFactory("_apiKey",language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
          position.latitude,
          position.longitude
          );
        emit(WeatherSuccess(weather));
      }
      catch(e){
        emit(WeatherFailure());
      }
    });
  }
}
