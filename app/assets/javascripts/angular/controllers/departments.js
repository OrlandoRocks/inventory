/**
 * Created by orlando on 1/26/17.
 */
app.controller('departmentsController', ["$scope", "$http", "$window", function ($scope, $http) {

    $scope.delete_department = function (id) {
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este departamento?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/departments/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'El departamento ha sido eliminado',
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

}]);