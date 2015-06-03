/**
 * Created by branko on 27.5.15..
 */
(function(){
  var shareDataService = function() {

    var myList = [];

    var addList = function(newObj) {
      myList.push(newObj);
    }

    var getList = function(){
      return myList;
    }

    return {
      addList: addList,
      getList: getList
    };
  };

  var app = angular.module('injeraApp')
  app.factory('shareDataService', shareDataService);
})();
