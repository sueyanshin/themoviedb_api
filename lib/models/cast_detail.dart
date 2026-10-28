// import 'package:test_app/models/movie.dart';

// class CastDetail {
//   bool? adult;
//   List<String>? alsoKnownAs;
//   String? biography;
//   String? birthday;
//   String? deathday;
//   int? gender;
//   int? id;
//   String? imdbId;
//   String? knownForDepartment;
//   String? name;
//   String? placeOfBirth;
//   double? popularity;
//   String? profilePath;
//   List<Movie>? movies;

//   CastDetail({
//     this.adult,
//     this.alsoKnownAs,
//     this.biography,
//     this.birthday,
//     this.deathday,
//     this.gender,
//     this.id,
//     this.imdbId,
//     this.knownForDepartment,
//     this.name,
//     this.placeOfBirth,
//     this.popularity,
//     this.profilePath,
//     this.movies,
//   });

//   CastDetail.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     alsoKnownAs = json['also_known_as'].cast<String>();
//     biography = json['biography'];
//     birthday = json['birthday'];
//     deathday = json['deathday'];
//     gender = json['gender'];
//     id = json['id'];
//     imdbId = json['imdb_id'];
//     knownForDepartment = json['known_for_department'];
//     name = json['name'];
//     placeOfBirth = json['place_of_birth'];
//     popularity = json['popularity'];
//     profilePath = json['profile_path'];
//     movies =
//         (json['movie_credits'] != null && json['movie_credits']['cast'] != null)
//         ? (json['movie_credits']['cast'] as List)
//               .map((movie) => Movie.fromJson(movie))
//               .toList()
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['adult'] = adult;
//     data['also_known_as'] = alsoKnownAs;
//     data['biography'] = biography;
//     data['birthday'] = birthday;
//     data['deathday'] = deathday;
//     data['gender'] = gender;
//     data['id'] = id;
//     data['imdb_id'] = imdbId;
//     data['known_for_department'] = knownForDepartment;
//     data['name'] = name;
//     data['place_of_birth'] = placeOfBirth;
//     data['popularity'] = popularity;
//     data['profile_path'] = profilePath;
//     data['movie_credits']['cast'] = movies;
//     return data;
//   }
// }
import 'package:test_app/models/cast_media_credit.dart';

class CastDetail {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  int? gender;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;
  List<CastMediaCredit>? castMediaCredits;

  CastDetail({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.castMediaCredits,
  });

  CastDetail.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    alsoKnownAs = (json['also_known_as'] as List?)
        ?.map((item) => item.toString())
        .toList();

    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];

    // List<dynamic> rawCredits = [];

    // if (json['combined_credits'] != null &&
    //     json['combined_credits']['cast'] != null) {
    //   rawCredits = json['combined_credits']['cast'];
    // }
    // rawCredits.sort((a, b) {
    //   double popA = (a['popularity'] ?? 0).toDouble();
    //   double popB = (b['popularity'] ?? 0).toDouble();

    //   return popB.compareTo(popA);
    // });

    // castMediaCredits = rawCredits
    //     .map((x) => CastMediaCredit.fromJson(x))
    //     .toList();

    castMediaCredits =
        (json['combined_credits'] != null &&
            json['combined_credits']['cast'] != null)
        ? (json['combined_credits']['cast'] as List)
              .map((credit) => CastMediaCredit.fromJson(credit))
              .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['also_known_as'] = alsoKnownAs;
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['place_of_birth'] = placeOfBirth;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['combined_credits']['cast'] = castMediaCredits;
    return data;
  }
}
