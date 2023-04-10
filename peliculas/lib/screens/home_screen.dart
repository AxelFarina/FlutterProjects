import 'package:flutter/material.dart';
import 'package:peliculas/Enum/enum_movies.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../AppTheme/theme_service.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> ls = [
    //Tarjetas principales
    const CardSwiper(),
     MovieSlider(
      title: 'Popular',
      movieTypes: MovieTypes.popular,
    ),
     MovieSlider(
      title: 'Top Rated',
      movieTypes: MovieTypes.topRated,
    ),
     MovieSlider(
      title: 'Upcoming',
      movieTypes: MovieTypes.upComing,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final themeService = Provider.of<ThemeService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(child: Text('Peliculas en cine')),
          leading: IconButton(
            onPressed: () {
              themeService.darkTheme = !themeService.darkTheme;
            },icon: Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode),

          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined))
          ],
        ),
        body: FutureBuilder(
          future: moviesProvider.isConnected(),
          builder: (_, AsyncSnapshot<bool> snapshot) {
            return snapshot.data == false
                ? const NoNetworkConnection()
                : ListView.builder(
                    itemCount: ls.length,
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: true,
                    itemBuilder: (BuildContext context, int index) =>
                        ls[index]);
            /*SingleChildScrollView(
                    child: Column(
                      children: [
                        //Tarjetas principales
                        CardSwiper(),

                        //Slider de peliculas
                        MovieSlider(
                            popularMovies: moviesProvider.popularMovies,
                            title: 'Popular',
                            onNextPage: () =>
                                moviesProvider.getPopularMovies()),
                        MovieSlider(
                            popularMovies: moviesProvider.topRatedMovies,
                            title: 'Top Rated',
                            onNextPage: () =>
                                moviesProvider.getTopRatedMovies())
                      ],
                    ),
                  );*/
          },
        ));
  }
}
