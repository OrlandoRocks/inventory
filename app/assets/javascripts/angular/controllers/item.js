/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {



    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

    $scope.init = function(branches, categories, item){
        $scope.branches = branches;
        $scope.get_trailers();

        if(item !== null && item !== undefined){

            $scope.get_item_json(item);

        }

    };

    $scope.init_order = function(item_id, users){
        $scope.users = users;
        $scope.get_trailers();

        if(item_id){
            $scope.get_orders(item_id);
        }
    };





    $scope.get_item_json =  function(id) {

        $http({
            method: 'GET',
            url: '/items/'+id+'.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;
                $scope.branch = $scope.item.branch_id;
                $scope.trailer = $scope.item.trailer_id;
                if($scope.branch !== null){
                    $scope.get_department();
                }
                if($scope.item.status_shipping_id === 1){
                    $scope.branch = $scope.item.department_user.branch_id;
                    $scope.get_department();
                }
                $scope.get_subcategories();
                $scope.get_trailer($scope.item.trailer_id);
                $scope.get_fiscal_vouchers();
                $scope.get_clients();

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };


    $scope.get_orders = function(id){
        $http({
            method: 'GET',
            url: '/items/'+id+'.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;
                $scope.user = parseInt($scope.item.user_id);
                $scope.trailer = $scope.item.trailer_id;
                $scope.get_trailer($scope.item.trailer_id);
                $scope.get_branch_user($scope.item.user_id);

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_department = function(){
        $http({
            url: '/departments_by_branch/'+ $scope.branch + '.json',
            method: 'GET'
        }).then(function (response) {

            $scope.department = response.data;
            $scope.consignee = response.data.manager;
            $scope.full_name = $scope.consignee.first_name + ' ' + $scope.consignee.last_name;
        });
    };

    $scope.get_subcategories = function(){
        $http({
            url: '/subcategory_by_category/'+ $scope.category + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.sub_categories = response.data;

        });
    };

    $scope.get_trailers = function(){
        $http({
            method: 'GET',
            url: '/trailers.json'
        }).then(function successCallback(response) {
            $scope.trailers = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_fiscal_vouchers = function(){
        $http({
            method: 'GET',
            url: '/fiscal_vouchers.json'
        }).then(function successCallback(response) {
            $scope.fiscal_vouchers = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_clients = function(){
        $http({
            method: 'GET',
            url: '/clients.json'
        }).then(function successCallback(response) {
            $scope.clients = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };



    $scope.get_branch_user = function(user){
        $http({
            url: '/users/'+ user + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {

                $scope.branch_name = response.data.branch.name;
                $scope.department_name = response.data.department.name;
                $scope.department_id = response.data.department_id;
            }
        });
    };

    $scope.get_trailer = function(trailer){
        $http({
            url: '/trailers/'+ trailer + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {
                $scope.model_name = response.data.model;
                $scope.sub_category_name = response.data.sub_category.name;
                $scope.category_name = response.data.category.name;
            }

        });
    };



    $scope.delete_order = function(id){
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este pedido?',
            type: 'question',
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


    $scope.delete_item = function(id){
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este artículo?',
            type: 'question',
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
                            text: 'El artículo ha sido eliminado',
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

    $scope.show_receive = function() {

        swal({
            title: 'Producto Recibido',
            text: '¿Ha recibido este producto?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/items/' + $scope.item.id + '.json',
                    method: 'PUT',
                    data: {
                        item: {
                            status_shipping_id: 3
                        }
                    }
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Recibido',
                            text: 'El producto a sido actulizado',
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



    $scope.show = function() {

        ModalService.showModal({
            templateUrl: 'modal_venta.html',
            controller: "ModalVentaController as modal",
            inputs:{
                item: $scope.item,
                fiscal_vouchers: $scope.fiscal_vouchers,
                clients: $scope.clients
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(sale_detail) {


                // $scope.showConfirm(sale_detail);
                // $scope.save_sale_detail(sale_detail);
                // $scope.amount_paid += parseInt(paid);
                // $scope.amount_owed -= paid;
                // $scope.get_sale_details_json($scope.sale);
            });
        });
    };




}]);




app.controller('ModalVentaController', ['$scope','close' ,'Upload','$http', 'item', 'fiscal_vouchers','clients', '$timeout',function($scope, close, Upload, $http, item, fiscal_vouchers, clients, $timeout) {


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();
        $scope.opened = true;
    };






    $scope.close = function() {
        close('', 500); // close, but give 500ms for bootstrap to animate
    };

    $scope.signature = "";

    $scope.item = item;
    $scope.fiscal_vouchers = fiscal_vouchers;
    $scope.clients = clients;
    $scope.payment_types = {0: {id:1, type:'Cash'},
                            1: {id:2, type:'Deposito'},
                            2: {id:3, type:'Transferencia'}
                            };


    $scope.uploadSell = function(status_vendido,status_pendiente_factura) {

        swal({
            title: '¿Estas seguro de vender este artículo?',
            text: 'una vez vendido no podras modificarlo',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                if ($scope.item.image) {

                    $scope.item.image.upload = Upload.upload({
                        url: `/items/${$scope.item.id}.json`,
                        method: 'PUT',
                        //  data: {file: file}
                        data: {
                            item: {
                                sale_price: $scope.item.sale_price,
                                payment_type: $scope.item.payment_type,
                                image: $scope.item.image,
                                status_item_id: status_vendido,
                                branch_id: $scope.item.branch_id,
                                department_id: $scope.item.department_id,
                                user_id: $scope.item.user_id
                            }
                        }
                    });
                    $scope.item.image.upload.then(function (response) {
                        $timeout(function () {
                            $scope.item.image.result = response.data;
                            if (response.data) {
                                swal({
                                    title: 'Vendido',
                                    text: 'El artículo ha sido Vendido correctamente. La factura esta en proceso',
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
                    }, function (response) {
                        if (response.status > 0)
                            $scope.errorMsg = response.status + ': ' + response.data;


                    }, function (evt) {
                        $scope.item.image.progress = Math.min(100, parseInt(100.0 *
                            evt.loaded / evt.total));
                    });

                 }else{
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
                                description: $scope.item.description
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

            }

        }, function (iSConfirm) {

        });
    }



}]).directive('format', ['$filter', function ($filter) {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;

            ctrl.$formatters.unshift(function (a) {
                return $filter(attrs.format)(ctrl.$modelValue)
            });

            elem.bind('blur', function(event) {
                var plainNumber = elem.val().replace(/[^\d|\-+|\.+]/g, '');
                elem.val($filter(attrs.format)(plainNumber));
            });
        }
    };
}]);






app.controller('ModalFileController', ['$scope','close', 'Upload','$http', '$timeout',function($scope, close, Upload, $http, $timeout) {


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };
    

    $scope.close = function(result) {
        close(result, 500); // close, but give 500ms for bootstrap to animate
    };



    $scope.uploadFiles = function(file) {
        if (file) {
            file.upload = Upload.upload({
                url: '/item_file',
                //  data: {file: file}
                data: {item_file: {
                    item_id: servicio,
                    file_type: company,
                    description: $scope.data_com_ser.description,
                    file: file
                }}
            });

            file.upload.then(function (response) {
                $timeout(function () {
                    file.result = response.data;
                    $scope.close("Cancel");
                });
            }, function (response) {
                if (response.status > 0)
                    $scope.errorMsg = response.status + ': ' + response.data;
            }, function (evt) {
                file.progress = Math.min(100, parseInt(100.0 *
                    evt.loaded / evt.total));
            });
        }
    }

    


}]);

