/**
 * Created by branko on 25.5.15..
 */
(function () {

  var apiService = function ($http) {

    var service = {};

    var mockic = [
      {type: "default", row: "defmodule Printer do"},
      {type:"warning" , row: "def sayHi(message) do"},
      {type:"warning", row:"IO.puts message"},
      {type:"green" , row: "end"},
      {type:"success",row:"end"}
    ];

    service.sendFile = function (content, successCallback, errorCallback) {
      successCallback(mockic);
      //return $http.get('http://localhost:8081/airline/departureAirports');
    };

    return service;
  };


  var app = angular.module('injeraApp')
  app.factory('apiService', apiService);


})();
