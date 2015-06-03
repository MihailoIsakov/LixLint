'use strict';

/**
 * @ngdoc function
 * @name probaApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the probaApp
 */
angular.module('probaApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
