

class ApiConstants {
 static const baseUrl = "https://mohafez.urapp.site";
// static const baseUrl = "https://a1d6-154-183-223-32.ngrok-free.app";
  static const baseUrlImages = "$baseUrl/images/";
    

  static const loginPath =
      "$baseUrl/user-login";

  static const registerPath = "$baseUrl/signup";
  static const getPhotosPath = "$baseUrl/photos/get-photos-by-placeId?";

 static const getHomePath =
   "$baseUrl/home/get-home-user?";

 static const getSubCategories =
   "$baseUrl/subCategory/get-subcategories-byCtId?categoryId=";


  // static const getCityDetailsPath =
  //     "$baseUrl/cities/get-city-details?";
  // static const getPlaceDetailsPath =
  //     "$baseUrl/places/get-placeDetails?";

  //      static const searchCitiesPath =
  //     "$baseUrl/cities/search_city?";

  //      static const getFavoritesPath =
  //     "$baseUrl/Favorite/get-favorites?";
  static String imageUrl(path) => "$baseUrlImages/$path";
}
