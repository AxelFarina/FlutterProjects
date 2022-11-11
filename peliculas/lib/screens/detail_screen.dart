import 'package:flutter/material.dart';
import 'package:peliculas/widgets/video_player_widget.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../models/models.dart';
import '../providers/movies_provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
        future: moviesProvider.isConnected(),
        builder: (_, AsyncSnapshot<bool> snapshot) {
          return snapshot.data == false
              ? NoNetworkConnection()
              : Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      _CustomAppBar(
                        movie: movie,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          _PosterAndTitle(
                            movie: movie,
                          ),
                          _OverView(
                            movie: movie,
                          ),
                          _OverView(
                            movie: movie,
                          ),
                          _OverView(
                            movie: movie,
                          ),
                          CastingCards(
                            movieId: movie.id,
                          )
                        ]),
                      )
                    ],
                  ),
                );
        });
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return SliverAppBar(
      expandedHeight: 175,
      floating: true,
      pinned: false,
      flexibleSpace: FutureBuilder(
          future: moviesProvider.getVideoMovies(movie.id),
          builder: (_, AsyncSnapshot<List<Result>> snapshot) {
            if (snapshot.data?.isNotEmpty ?? false) {
              var firsResult = snapshot.data!.firstWhere(
                  (element) => element.type == "Trailer" && element.official,
                  orElse: () => snapshot.data!.first);
              if (firsResult != null)
                return VideoPlayerWidget(videoId: firsResult.key);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3),
                Text(movie.originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${movie.voteAverage}', style: textTheme.caption)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;

  const _OverView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1),
    );
  }
}
