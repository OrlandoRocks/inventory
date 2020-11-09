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
        $scope.get_trailer_types_json()
        $scope.get_trailers();
        $scope.get_floors();
        $scope.get_ramps();
        $scope.get_redilas();
        $scope.get_capacities();
        $scope.get_widths();
        $scope.get_lengths();
        $scope.get_brakes();
        $scope.get_colors();
        $scope.get_divitions();
        $scope.get_fenders();
        $scope.get_hydraulic_jacks();
        $scope.get_pulls();
        $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();
    };



    $scope.get_trailers = function () {
        $http({
            method: 'GET',
            url: '/trailer_types.json'
        }).then(function successCallback(response) {
            $scope.trailers = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_ramps = function () {
        $http({
            method: 'GET',
            url: '/ramp_types.json'
        }).then(function successCallback(response) {
            $scope.ramps = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_redilas = function () {
        $http({
            method: 'GET',
            url: '/redila_types.json'
        }).then(function successCallback(response) {
            $scope.redilas = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_capacities = function () {
        $http({
            method: 'GET',
            url: '/capacities.json'
        }).then(function successCallback(response) {
            $scope.capacities = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_floors = function () {
        $http({
            method: 'GET',
            url: '/floor_types.json'
        }).then(function successCallback(response) {
            $scope.floors = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_widths = function () {
        $http({
            method: 'GET',
            url: '/trailer_widths.json'
        }).then(function successCallback(response) {
            $scope.widths = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_lengths = function () {
        $http({
            method: 'GET',
            url: '/trailer_lengths.json'
        }).then(function successCallback(response) {
            $scope.lengths = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_brakes = function () {
        $http({
            method: 'GET',
            url: '/brake_types.json'
        }).then(function successCallback(response) {
            $scope.brakes = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_colors = function () {
        $http({
            method: 'GET',
            url: '/colors.json'
        }).then(function successCallback(response) {
            $scope.colors = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_divitions = function () {
        $http({
            method: 'GET',
            url: '/divition_types.json'
        }).then(function successCallback(response) {
            $scope.divitions = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_fenders = function () {
        $http({
            method: 'GET',
            url: '/fender_types.json'
        }).then(function successCallback(response) {
            $scope.fenders = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_hydraulic_jacks = function () {
        $http({
            method: 'GET',
            url: '/hydraulic_jacks.json'
        }).then(function successCallback(response) {
            $scope.hydraulic_jacks = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_pulls = function () {
        $http({
            method: 'GET',
            url: '/pull_types.json'
        }).then(function successCallback(response) {
            $scope.pulls = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_reinforcements = function () {
        $http({
            method: 'GET',
            url: '/reinforcement_types.json'
        }).then(function successCallback(response) {
            $scope.reinforcements = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_roofs = function () {
        $http({
            method: 'GET',
            url: '/roof_types.json'
        }).then(function successCallback(response) {
            $scope.roofs = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_suspensions = function () {
        $http({
            method: 'GET',
            url: '/suspension_types.json'
        }).then(function successCallback(response) {
            $scope.suspensions = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_turns = function () {
        $http({
            method: 'GET',
            url: '/turn_types.json'
        }).then(function successCallback(response) {
            $scope.turns = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
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




    

