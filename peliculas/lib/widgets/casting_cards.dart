import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';


class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MoviesProvider>(context);
    final double radius = 20;

    return FutureBuilder(
      future: movieProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot){

        if(!snapshot.hasData){
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(
              radius: radius,
            ),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(actor: cast[index],),
            )
        );
    },);

  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.getFullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5,),
          Text(actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}

