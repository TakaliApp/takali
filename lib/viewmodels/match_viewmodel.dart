import 'package:takali/models/matchprofil_model.dart';
import 'package:takali/viewmodels/base.viewmodel.dart';

class MatchViewModel extends BaseViewModel {

List<MatchProfileModel> matchProfiles = [
    MatchProfileModel(
      username: "john_doe",
      birthday: DateTime(1995, 5, 10),
      createdAt: DateTime(2022, 1, 15),
      gender: "Homme",
      genderPreference: "Femme",
      isDeletedAccount: true,
      localization: "Paris, France",
      lookingFor: "Une relation sérieuse",
      phone: "+33123456789",
      referralSource: ["Tiktok", "Proche à toi"],
      photoUrl: [
        "https://images.unsplash.com/photo-1488161628813-04466f872be2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1584043720379-b56cd9199c94?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D",
      ],
    ),
    MatchProfileModel(
      username: "jane_smith",
      birthday: DateTime(1992, 8, 24),
      createdAt: DateTime(2021, 11, 5),
      gender: "Femme",
      genderPreference: "Homme",
      isDeletedAccount: true,
      localization: "New York, USA",
      lookingFor: "De nouveaux amis",
      phone: "+12125550123",
      referralSource: ["Google Play/App Store"],
      photoUrl: [
        "https://images.unsplash.com/photo-1602442787305-decbd65be507?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGZlbW1lfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1539701938214-0d9736e1c16b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGZlbW1lfGVufDB8fDB8fHww",
      ],
    ),
    MatchProfileModel(
      username: "alex_king",
      birthday: DateTime(1989, 2, 14),
      createdAt: DateTime(2020, 6, 18),
      gender: "Homme",
      genderPreference: "Femme",
      isDeletedAccount: true,
      localization: "Berlin, Allemagne",
      lookingFor: "Une relation sérieuse",
      phone: "+4915123456789",
      referralSource: ["Instagram"],
      photoUrl: [
        "https://images.unsplash.com/photo-1492288991661-058aa541ff43?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D"
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D",
      ],
    ),
    MatchProfileModel(
      username: "emma_wat",
      birthday: DateTime(1998, 12, 30),
      createdAt: DateTime(2023, 3, 25),
      gender: "Femme",
      genderPreference: "Homme",
      isDeletedAccount: true,
      localization: "Tokyo, Japon",
      lookingFor: "Je ne suis pas sûr(e)",
      phone: "+81312345678",
      referralSource: ["Autre"],
      photoUrl: [
        "https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmVsbGUlMjBmZW1tZXxlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlbGxlJTIwZmVtbWV8ZW58MHx8MHx8fDA%3D"
      ],
    ),
    MatchProfileModel(
      username: "mike_hunt",
      birthday: DateTime(1990, 7, 18),
      createdAt: DateTime(2019, 9, 12),
      gender: "Homme",
      genderPreference: "Femme",
      isDeletedAccount: true,
      localization: "Sydney, Australie",
      lookingFor: "De nouveaux amis",
      phone: "+61234567890",
      referralSource: ["Proche à toi"],
      photoUrl: [
        "https://images.unsplash.com/photo-1461800919507-79b16743b257?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1552642986-ccb41e7059e7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fGhvbW1lc3xlbnwwfHwwfHx8MA%3D%3D"
      ],
    ),
    MatchProfileModel(
      username: "sophia",
      birthday: DateTime(2000, 3, 15),
      createdAt: DateTime(2022, 5, 10),
      gender: "Femme",
      genderPreference: "Homme",
      isDeletedAccount: true,
      localization: "Toronto, Canada",
      lookingFor: "une relation sérieuse",
      phone: "+14165550123",
      referralSource: ["Tiktok"],
      photoUrl: [
        "https://images.unsplash.com/photo-1485875437342-9b39470b3d95?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZmVtbWVzfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1621095058736-e62ddccd9b13?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjB8fGZlbW1lfGVufDB8fDB8fHww"
      ],
    ),
  ];

  void dislikeMatch(int index) {
    matchProfiles.removeAt(index);
    notifyListeners();
  }

}