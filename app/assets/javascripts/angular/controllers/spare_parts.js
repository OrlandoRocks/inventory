app.controller('sparePartController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {



    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

    $scope.init = function(spare_part){



        $scope.get_categories();

        if(spare_part !== null && spare_part !== undefined){

            $scope.get_spare_part(spare_part);

            $scope.get_subcategories();
        }



    };

    $scope.show = function(spare_part) {

        ModalService.showModal({
            templateUrl: 'modal.html',
            controller: "ModalSparePartController as modal",
            inputs:{
                spare_part: spare_part
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {
                // $scope.get_companies_services_json(company_id);
            });
        });
    };



    $scope.get_categories = function(category){
        $http({
            url: '/categories.json',
            method: 'GET'
        }).then(function (response) {
            $scope.categories = response.data;
        });
    };

    $scope.get_subcategories = function(category){
        $http({
            url: '/subcategory_by_category/'+ category + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.sub_categories = response.data;

        });
    };

    $scope.get_spare_part = function(spare_part){
        $http({
            url: '/spare_parts/'+ spare_part + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.spare_part = response.data;

            $scope.category = $scope.spare_part.category.id;

            $scope.get_subcategories($scope.category);

            $scope.sub_category = $scope.spare_part.sub_category_id;

        });
    };

    $scope.delete_spare_part = function(id){
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar esta Refacción?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/spere_parts/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'La refacción ha sido eliminada',
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





app.controller('ModalSparePartController', ['$scope','close', 'Upload','$http', '$timeout', 'spare_part',function($scope, close, Upload, $http, $timeout,spare_part) {


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;


    };

    $scope.payment_types = {
        0: {id: 1, type: 'Cash'},
        1: {id: 2, type: 'Deposito'},
        2: {id: 3, type: 'Transferencia'},
        4: {id: 4, type: 'Crédito'}
    };

    $scope.get_fiscal_vouchers = function () {
        $http({
            method: 'GET',
            url: '/fiscal_vouchers.json'
        }).then(function successCallback(response) {
            $scope.fiscal_vouchers = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_spare_part = function () {
        $http({
            url: '/spare_parts/'+ spare_part + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.spare_part = response.data;
            $scope.spare_part.instock =parseFloat($scope.spare_part.instock);
            $scope.instock =parseFloat($scope.spare_part.instock);

        });
    };


    $scope.get_clients = function () {
        $http({
            method: 'GET',
            url: '/clients.json'
        }).then(function successCallback(response) {
            $scope.clients = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_from_instock = function (quantity) {
        $scope.spare_part.instock = $scope.instock - quantity;

    };

    $scope.close = function(result) {
        close(result, 500); // close, but give 500ms for bootstrap to animate
    };



    $scope.sellSparePart = function () {

        // angular.forEach(status, function (stats) {
        //     if (stats.key === 'vendido') {
        //         status_vendido = stats.id;
        //
        //     } else if (stats.key === 'pendiente_factura') {
        //         status_pendiente_factura = stats.id;
        //     } else if (stats.key === 'vendido_credito') {
        //         status_credito = stats.id;
        //     }
        //
        //
        // });


        if ($scope.spare_part.instock<0) {
            swal({
                title: 'Error',
                text: 'No tenemos suficientes en existencia',
                type: 'error',
                showCancelButton: false
            }).then(function (isConfirm) {
                if (isConfirm) {
                    location.reload();
                }

            }, function (iSConfirm) {

            });

        }else{
            swal({
                title: '¿Estas seguro de vender este artículo?',
                text: 'una vez vendido no podras modificarlo',
                confirmButtonText: "SI",
                cancelButtonText: "NO",
                type: 'question',
                showCancelButton: true
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal({
                        title: 'Espere un momento',
                        text: '',
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: false,
                        showConfirmButton: false,
                        onOpen: function () {
                            swal.showLoading()
                        }
                    });

                    $http({
                        url: `/spare_part_solds.json`,
                        method: 'POST',
                        data: {
                            spare_part_sold: {
                                client_id: $scope.client_id,
                                user_id: $scope.user_id,
                                spare_part_id: $scope.spare_part.id,
                                quantity: $scope.quantity,
                                unit_sale_price: parseFloat($scope.unit_sale_price),
                                payment_type: $scope.payment_type,
                                fiscal_voucher_id: $scope.fiscal_voucher_id,
                                advance_payment: $scope.advance_payment
                            }
                        }
                    }).then(function (response) {
                        if (response.data) {
                            swal({
                                title: 'Vendido',
                                text: 'El artículo ha sido Vendido',
                                type: 'success',
                                showCancelButton: false
                            }).then(function (isConfirm) {
                                if (isConfirm) {

                                    $http({
                                        url: `/spare_parts/${$scope.spare_part.id}.json`,
                                        method: 'PUT',
                                        data: {
                                            spare_part: {
                                                sub_category_id: $scope.spare_part.sub_category_id,
                                                instock: $scope.spare_part.instock
                                            }
                                        }
                                    }).then(function (response) {
                                        if (response.data) {

                                            location.reload();
                                        }
                                    });





                                }

                            }, function (iSConfirm) {

                            });
                        }
                    });



                }

            }, function (iSConfirm) {

            });
        };
    };





    $scope.get_spare_part();
    $scope.get_clients();
    $scope.get_fiscal_vouchers();


}]);
