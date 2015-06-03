'use strict';

/**
 * @ngdoc overview
 * @name injeraApp
 * @description
 * # injeraApp
 *
 * Main module of the application.
 */
angular
  .module('injeraApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.router'
  ])
  /*.config(function ($stateProvider) {
   /* $stateProvider
      .state('home',{
        url: '/home',
        templateUrl: 'views/upload.html',
        controller: 'HomeController'
      })
      .state('home.analysis',{
        url: '/analysis',
        controller: 'AnalysisController',
        views : {
          'left': {
            templateUrl: 'views/code.html'
          },
          'right': {
            templateUrl: 'views/graph.html'
          }
        }
      });
  });*/
  .config(function ($routeProvider) {
    $routeProvider
      .when('/home', {
        templateUrl: 'views/upload.html',
        controller: 'HomeController'
      })
      .when('/analysis', {
        templateUrl: 'views/analysis.html',
        controller: 'AnalysisController'
      })
      .otherwise({
        redirectTo: '/home'
      });
  });
