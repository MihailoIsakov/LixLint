'use strict';

/**
 * @ngdoc function
 * @name injeraApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the injeraApp
 */
angular.module('injeraApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
