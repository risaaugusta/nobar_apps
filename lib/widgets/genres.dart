import 'package:flutter/material.dart';
import 'package:nobar/bloc/get_genres_bloc.dart';
import 'package:nobar/model/genre.dart';
import 'package:nobar/model/genre_response.dart';
import 'package:nobar/widgets/genres_list.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {

  @override
  void initState(){
    super.initState();
    genresBloc..getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        if(snapshot.hasData){
          if(snapshot.data.error != null && snapshot.data.error.length > 0){
            return _buildErrorWidget(snapshot.error);
          }
          return _buildGenresWidget(snapshot.data);
        } else if(snapshot.hasError){
          return _buildErrorWidget(snapshot.error);
        } else{
          return _buildLoadingWidget();
        }
      });
  }
}

Widget _buildLoadingWidget(){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
            ),
          )
        ],
      )
  );
}

Widget _buildErrorWidget(String error){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
            ),
          )
        ],
      )
  );
}

Widget _buildGenresWidget(GenreResponse data){
  List<Genre> genres = data.genres;
  if(genres.length == 0){
    return Container(
      child: Text("no genres"),
    );
  }else return GenresList(genres: genres);
}
