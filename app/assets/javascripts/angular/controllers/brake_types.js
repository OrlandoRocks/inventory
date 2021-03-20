/**
 * Created by orlando on 11/12/16.
 */
app.controller('brakeTypesController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


    $scope.init = function(id){
        $scope.trailer_categories = [];

        $scope.get_trailers();
        $scope.get_brakes(id);


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


    $scope.get_brakes = function (id) {
        $http({
            method: 'GET',
            url: `/brake_types/${id}.json`
        }).then(function successCallback(response) {
            $scope.brakes = response.data;
            $scope.trailer_categories = $scope.brakes.trailer_category;
            console.log($scope.brakes);
            console.log($scope.trailers);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };




    $scope.delete_order = function (id) {
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este pedido?',
            type: 'question',
            confirmButtonText: "SI",
            cancelButtonText: "NO",
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/items/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'El pedido ha sido eliminado',
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
    };


    $scope.show = function () {

        ModalService.showModal({
            templateUrl: 'modal_venta.html',
            controller: "ModalVentaController as modal",
            inputs: {
                item: $scope.item,
                fiscal_vouchers: $scope.fiscal_vouchers,
                clients: $scope.clients
            }
        }).then(function (modal) {
            modal.element.modal();
            modal.close.then(function (params) {

            });
        });
    };




}]);



app.controller('ModalFileController', ['$scope', 'close', 'Upload', '$http', '$timeout', function ($scope, close, Upload, $http, $timeout) {


    $scope.open = function ($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };


    $scope.close = function (result) {
        close(result, 500); // close, but give 500ms for bootstrap to animate
    };


    $scope.uploadFiles = function (file) {
        $http({
            url: `/items/${$scope.item.id}.json`,
            method: 'PUT',
            //  data: {file: file}
            data: {
                item: {
                    sale_price: $scope.item.sale_price,
                    payment_type: $scope.item.payment_type,
                    status_item_id: status_pendiente_factura,
                    branch_id: $scope.item.branch_id,
                    department_id: $scope.item.department_id,
                    user_id: $scope.item.user_id,
                    client_id: $scope.item.client_id,
                    fiscal_voucher_id: $scope.item.fiscal_voucher_id,
                    description: $scope.item.description,
                    purchased_date: new Date()
                }
            }
        }).then(function (response) {
            if (response.data) {
                swal({
                    title: 'Vendido (Falta Comprobante)',
                    text: 'El artículo ha sido Vendido y se facturara cuando se agregue el comprobante de pago',
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


}]);




    

