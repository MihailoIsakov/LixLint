(function(){
  angular.module('injeraApp')
    .controller('AnalysisController', function ($scope, shareDataService) {


      $scope.tableData = shareDataService.getList()[0];
    });

})();
