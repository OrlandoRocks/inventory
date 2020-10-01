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

    $scope.init_order = function(item){
        console.log(item);
    }


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
                console.log($scope.item);
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

        console.log(sale_detail.payment);
        $http({
            url: '/sale_details',
            method: 'POST',
            data: {sale_detail: sale_detail}
        }).then(function successCallback(response) {

            $scope.amount_paid += parseInt(sale_detail.payment);
            $scope.amount_owed -= parseInt(sale_detail.payment);
            $scope.get_sale_details_json($scope.sale);

            console.log("se armo el guiso!! :D");
        }, function errorCallback(response) {
            console.log("algo valio shit!! :(");
        });
    };



    $scope.show = function() {

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
            console.log('response');
            console.log(response.data);
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
    }

}]);




app.controller('ModalVentaController', ['$scope','close' ,'Upload','$http', 'item', '$timeout',function($scope, close, Upload, $http, item, $timeout) {


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };



    $scope.close = function(sale_detail) {
        close(sale_detail, 500); // close, but give 500ms for bootstrap to animate
    };

    $scope.signature = "";

    $scope.item = item;
    $scope.uploadFiles = function() {


        $scope.sale_detail = {
            sale_id: sale,
            payment: $scope.payment,
            signature_client: $scope.signature["dataUrl"]
        };

        $scope.close($scope.sale_detail);

        // if($scope.payment<=$scope.amount_owed){
        //     $http({
        //         url: '/sale_details',
        //         method: 'POST',
        //         data: {sale_detail:{
        //             sale_id: sale,
        //             payment: $scope.payment,
        //             signature_client: $scope.signature["dataUrl"]
        //         }}
        //     }).then(function successCallback(response) {
        //         $scope.close($scope.payment);
        //         console.log("se armo el guiso!! :D");
        //     }, function errorCallback(response) {
        //         console.log("algo valio shit!! :(");
        //     });
        // }





        // if (file) {
        //     file.upload = Upload.upload({
        //         url: '/sale_details',
        //         //  data: {file: file}
        //         data: {sale_detail: {
        //             sale_id: sale,
        //             client_id: $scope.client,
        //             payment: $scope.payment,
        //             invoice: file
        //         }}
        //     });
        //     file.upload.then(function (response) {
        //         $timeout(function () {
        //             file.result = response.data;
        //             $scope.close("Cancel");
        //         });
        //     }, function (response) {
        //         if (response.status > 0)
        //             $scope.errorMsg = response.status + ': ' + response.data;
        //     }, function (evt) {
        //         file.progress = Math.min(100, parseInt(100.0 *
        //             evt.loaded / evt.total));
        //     });
        // }
    }



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

