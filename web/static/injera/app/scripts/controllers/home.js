(function(){
  angular.module('injeraApp')
    .controller('HomeController', function ($scope, $location, apiService, shareDataService) {

      $scope.showContent = function($fileContent){
        $scope.content = $fileContent;
      };

      $scope.upload = function(){
        if($scope.content){
          apiService.sendFile($scope.content, function(data){
            $scope.data = data;
            shareDataService.addList(data);
            $location.path('/analysis');
          });
        } else {
          alert("Please provide .ex file for static analysis.");
        }
      }
    });

})();
