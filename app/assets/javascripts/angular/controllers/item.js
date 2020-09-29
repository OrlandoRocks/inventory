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
        $scope.categories = categories;

        if(item !== null && item !== undefined){

            $scope.get_item_json(item);

            console.log($scope.item);


        }

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

            $scope.save_sale_item(ev);
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


    $scope.save_sale_item = function(sale_item){

        const formData = new FormData();
        formData.append('item', sale_item);

        console.log(formData);
        $http({
            url: `/item/${sale_item.id}`,
            method: 'POST',
            data: formData
        }).then(function successCallback(response) {

            $scope.amount_paid += parseInt(sale_item.payment);
            $scope.amount_owed -= parseInt(sale_item.payment);
            $scope.get_sale_items_json($scope.sale);

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
            modal.close.then(function(sale_item) {
                // $scope.showConfirm(sale_item);
                // $scope.save_sale_item(sale_item);
                // $scope.amount_paid += parseInt(paid);
                // $scope.amount_owed -= paid;
                // $scope.get_sale_items_json($scope.sale);
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




    $scope.close = function(sale_item) {
        close(sale_item, 500); // close, but give 500ms for bootstrap to animate
    };

    $scope.signature = "";

    $scope.item = item;

    $scope.uploadFiles = function(file) {


        console.log($scope.item);
        // $scope.close($scope.sale_item);


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
        // }



        // if($scope.payment<=$scope.amount_owed){
        //     $http({
        //         url: '/sale_items',
        //         method: 'POST',
        //         data: {sale_item:{
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
                url: `/item/${sale_item.id}`,
                method: 'POST',
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

