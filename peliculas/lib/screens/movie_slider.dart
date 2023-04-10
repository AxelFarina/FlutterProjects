import 'package:flutter/material.dart';
import 'package:peliculas/Enum/enum_movies.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSlider extends StatefulWidget {
  final String? title;
  final MovieTypes movieTypes;

  const MovieSlider({
    Key? key,
    this.title,
    required this.movieTypes,
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  MoviesProvider? moviesProvider;
  List<Movie> movies = [];
  final ScrollController scrollController = ScrollController();
  final MoviesProvider movie = MoviesProvider();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      loadMovies();
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        loadMovies();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      loadMovies();
    });

    scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(
                      movie: movies[index],
                      heroId: '${widget.title}-${index}-${movies[index].id}',
                    )),
          )
        ],
      ),
    );
  }

  void loadMovies() async {
    switch (widget.movieTypes) {
      case MovieTypes.popular:
        await moviesProvider?.getPopularMovies();
        movies = moviesProvider?.popularMovies ?? [];
        break;
      case MovieTypes.topRated:
        await moviesProvider?.getTopRatedMovies();
        movies = moviesProvider?.topRatedMovies ?? [];
        break;
      case MovieTypes.nowPlaying:
        await moviesProvider?.getOnDisplayMovies();
        movies = moviesProvider?.onDisplayMovies ?? [];
        break;
      case MovieTypes.upComing:
        await moviesProvider?.getUpcomingMovies();
        movies = moviesProvider?.upComingMovies ?? [];
        break;
    }
    setState(() {});
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const _MoviePoster({required this.movie, required this.heroId});

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image(
                      image: AssetImage('assets/no-image.jpg'),
                      fit: BoxFit.cover,
                    );
                  },
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
