'use strict';

/**
 * @ngdoc function
 * @name probaApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the probaApp
 */
angular.module('probaApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
