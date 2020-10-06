/**
 * Created by orlando on 11/12/16.
 */
app.controller('trailerController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


    // $scope.get_companies_services_json =  function(id) {
    //     $http.get('/admin/companies_services/show_by_company/'+id+'.json')
    //         .success(function(data, status, headers, config) {
    //             $scope.company_data = data;
    //         })
    //         .error(function(error, status, headers, config) {
    //             console.log(status);
    //             console.log("Error occured");
    //         });
    //
    // };


    // $scope.get_companies_services_json($scope.company);

    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

    $scope.init = function(categories){
        $scope.categories = categories;
    };





    $scope.get_trailer_json =  function(id) {

        $http({
            method: 'GET',
            url: '/trailers/'+id+'.json'
        }).then(function successCallback(response) {

            console.log('Hola bebe');

            if (response.data != null) {
                $scope.trailer = response.data;
                console.log($scope.trailer);
            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };




}]);




    

