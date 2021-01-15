/**
 * Created by orlando on 1/26/17.
 */
app.controller('userController',["$scope", "$http", function($scope, $http) {

    $scope.departments = [];
    $scope.branches = [];
    $scope.user_type = '';
    $scope.company = '';
    $scope.branch_selected= '';
    $scope.department_selected= '';
    $scope.level = 0;
    $scope.boss = '';

    $scope.set_role= function(role){

        $scope.boss='';
        $http({
            method: "GET",
            url: "/roles/"+role.id+".json"
        }).then(function successCallback(response) {
            switch (response.data.key) {
                case 'admin_empresa':
                    $scope.level = 1;
                    break;
                case 'admin_sucursal':
                    $scope.level = 2;
                    break;
                case 'admin_departamento':
                    $scope.level = 3;
                    break;
                case 'empleado_sin_acceso':
                    $scope.level = 4;
                    break;
                default:
                    $scope.level = 0;

            }

        }, function errorCallback(response) {
        });




    };

    $scope.set_branches = function (company) {
        // $scope.branches = [];
        // $scope.branch_selected = '';
        // $scope.departments = [];
        // $scope.department_selected = '';
        // $scope.boss='';

        if(company) {
            $http({
                method: "GET",
                url: "/companies/" + company + ".json"
            }).then(function successCallback(response) {

                $scope.branches = response.data.branches;
                if ($scope.level == 1) {
                    $scope.boss = response.data.boss;
                } else if ($scope.level == 2) {
                    $scope.boss = response.data.manager
                }

            }, function errorCallback(response) {
            });
        }
    };

    // $scope.set_branches();

    
    $scope.set_department = function (branch) {
        // $scope.departments = [];
        // $scope.department_selected = '';
        // $scope.boss='';
        if(branch){
            $http({
                method: "GET",
                url: "/branches/"+branch+".json"
            }).then(function successCallback(response) {
                $scope.department = response.data;

            }, function errorCallback(response) {
            });
        }
    }

    $scope.set_department_boss = function (department) {
        // $scope.boss='';
        if(department) {
            // $http({
            //     method: "GET",
            //     url: "/departments/" + department + ".json"
            // }).then(function successCallback(response) {
            //     if ($scope.level == 4) {
            //         $scope.boss = response.data.manager;
            //     }
            //
            //
            // }, function errorCallback(response) {
            // });
        }



    };

    $scope.delete_user = function(id){
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este usuario?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/users/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'El usuario ha sido eliminado',
                            type: 'success',
                            showCancelButton: false
                        }).then(function (isConfirm) {
                            if (isConfirm) {
                                location.reload();
                            }

                        }, function (iSConfirm) {

                        });
                    }
                });
            }

        }, function (iSConfirm) {

        });
    }

}]).directive('convertToNumber', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attrs, ngModel) {
            ngModel.$parsers.push(function(val) {
                return parseInt(val, 10);
            });
            ngModel.$formatters.push(function(val) {
                return '' + val;
            });
        }
    };
});