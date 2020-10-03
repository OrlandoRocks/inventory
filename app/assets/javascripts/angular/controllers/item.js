/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


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

    $scope.init = function(branches, categories, item){
        $scope.branches = branches;
        $scope.categories = categories;

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


    $scope.showConfirm = function(ev) {

        // Appending dialog to document.body to cover sidenav in docs app
        // var confirm = $mdDialog.confirm()
        //     .title('¿Estas Seguro de querer Guardar el Abono?')
        //     .ariaLabel('Lucky day')
        //     .targetEvent(ev)
        //     .ok('Simon')
        //     .cancel('Nelson');
        //
        // $mdDialog.show(confirm).then(function() {

            $scope.save_sale_detail(ev);
        //     $scope.status = 'You decided to get rid of your debt.';
        // }, function() {
        //     $scope.status = 'You decided to keep your debt.';
        // });
    };


    $scope.get_item_json =  function(id) {



        $http({
            method: 'GET',
            url: '/items/'+id+'.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;
                $scope.branch = $scope.item.branch_id;
                $scope.category = $scope.item.sub_category.category_id;
                $scope.sub_category = $scope.item.sub_category.id;
                $scope.get_department();
                $scope.get_subcategories();
            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };


    $scope.save_sale_detail = function(sale_detail){

        $http({
            url: '/sale_details',
            method: 'POST',
            data: {sale_detail: sale_detail}
        }).then(function successCallback(response) {

            $scope.amount_paid += parseInt(sale_detail.payment);
            $scope.amount_owed -= parseInt(sale_detail.payment);
            $scope.get_sale_details_json($scope.sale);

        }, function errorCallback(response) {
            console.log("algo valio shit!! :(");
        });
    };



    $scope.show = function() {

        console.log('Show');
        console.log($scope.item);
        ModalService.showModal({
            templateUrl: 'modal_venta.html',
            controller: "ModalVentaController as modal",
            inputs:{
                item: $scope.item,
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(sale_detail) {
                $scope.showConfirm(sale_detail);
                // $scope.save_sale_detail(sale_detail);
                // $scope.amount_paid += parseInt(paid);
                // $scope.amount_owed -= paid;
                // $scope.get_sale_details_json($scope.sale);
            });
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

    $scope.get_branch_user = function(user){
        $http({
            url: '/users/'+ user + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {
                $scope.branch_name = response.data.branch.name;
                $scope.department_name = response.data.department.name;
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
    }

}]);




app.controller('ModalVentaController', ['$scope','close' ,'Upload','$http', 'item', '$timeout',function($scope, close, Upload, $http, item, $timeout) {


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();
        console.log("Item Loco");
        console.log($scope.item);
        $scope.opened = true;
    };



    $scope.close = function() {
        close(sale_detail, 500); // close, but give 500ms for bootstrap to animate
    };

    $scope.signature = "";

    $scope.item = item;


    $scope.uploadSell = function() {
;
        console.log("Item Loco");
        console.log($scope.item);
        // $http({
        //     url: `/items/${$scope.item.id}.json`,
        //     method: 'PATCH',
        //     data: {item: {
        //             sale_price: $scope.item.sale_price,
        //             payment_type: $scope.item.payment_type,
        //             status_item_id: 3,
        //             branch_id: $scope.item.branch_id,
        //             department_id: $scope.item.department_id,
        //             user_id: $scope.item.user_id
        //         }}
        // }).then(function successCallback(response) {
        //     $scope.close(response);
        //     console.log("se armo el guiso!! :D");
        // }, function errorCallback(response) {
        //     $scope.close(response);
        //     console.log("algo valio shit!! :(");
        // });



        // if (file) {
        $scope.item.image.upload = Upload.upload({
            url: `/items/${$scope.item.id}.json`,
            method: 'PATCH',
            //  data: {file: file}
            data: {item: {
                    sale_price: $scope.item.sale_price,
                    payment_type: 1,
                    image: $scope.item.image,
                    status_item_id: 3,
                    branch_id: $scope.item.branch_id,
                    department_id: $scope.item.department_id,
                    user_id: $scope.item.user_id
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

