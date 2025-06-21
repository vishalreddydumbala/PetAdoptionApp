import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoptionapp/const/routes/error_page.dart';
import 'package:petadoptionapp/const/routes/route_constants.dart';

import 'package:petadoptionapp/counter/counter.dart';
import 'package:petadoptionapp/modules/home_page.dart';
import 'package:petadoptionapp/modules/settings_page.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteConstants.counterPath,
    debugLogDiagnostics: true,
    routes: [
      // Home/Counter route (keeping your existing counter page as home for now)
      // GoRoute(
      //   path: RouteConstants.home,
      //   name: RouteConstants.home,
      //   builder: (context, state) => const PetAdoptionApp(),
      // ),
      //
      // // Counter route
      GoRoute(
        path: RouteConstants.counterPath,
        name: RouteConstants.counter,
        builder: (context, state) => const HomePage(),
      ),

      // Pet list route
      GoRoute(
        path: RouteConstants.petListPath,
        name: RouteConstants.petList,
        builder: (context, state) => const SettingsPage(),
      ),
      //
      // // Pet details route with parameter
      // GoRoute(
      //   path: '${RouteConstants.petDetailsPath}/:petId',
      //   name: RouteConstants.petDetails,
      //   builder: (context, state) {
      //     final petId = state.pathParameters['petId']!;
      //     return PetDetailsPage(petId: petId);
      //   },
      // ),
      //
      // // Favorites route
      // GoRoute(
      //   path: RouteConstants.favoritesPath,
      //   name: RouteConstants.favorites,
      //   builder: (context, state) => const FavoritesPage(),
      // ),
      //
      // // Profile route
      // GoRoute(
      //   path: RouteConstants.profilePath,
      //   name: RouteConstants.profile,
      //   builder: (context, state) => const ProfilePage(),
      // ),
      //
      // // Adoption routes
      // GoRoute(
      //   path: RouteConstants.adoptionPath,
      //   name: RouteConstants.adoption,
      //   builder: (context, state) => const AdoptionPage(),
      //   routes: [
      //     // Nested route for adoption form
      //     GoRoute(
      //       path: '/form',
      //       name: RouteConstants.adoptionForm,
      //       builder: (context, state) => const AdoptionFormPage(),
      //     ),
      //   ],
      // ),
    ],

    // Error handling
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),

    // Redirect logic (optional)
    redirect: (context, state) {
      // Add any authentication or conditional redirect logic here
      return null; // No redirect
    },
  );
}
