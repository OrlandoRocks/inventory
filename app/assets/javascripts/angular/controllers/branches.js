/**
 * Created by orlando on 1/26/17.
 */
app.controller('branchesController', ["$scope", "$http", "$window", function ($scope, $http) {
'/????'
    oi$scope.delete_branch = function (id) {
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar esta sucursal?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/branches/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'La sucursal ha sido eliminada',
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