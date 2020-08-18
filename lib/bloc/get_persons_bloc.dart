import 'package:nobar/model/person_response.dart';
import 'package:nobar/respository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

  getMovies() async {
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose() async{
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject ;
}

final personsBloc = PersonsListBloc();