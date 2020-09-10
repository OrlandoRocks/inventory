/**
 * Created by orlando on 11/12/16.
 */
app.controller('clientController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


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

        if(item.id !== null && item.id !== undefined){
            $scope.branch = item.branch_id;
            $scope.category = item.category_id;
            $scope.get_department();
            $scope.get_subcategories();
        }

    };

    $scope.show = function() {

        ModalService.showModal({
            templateUrl: 'modal.html',
            controller: "ModalFileController as modal",
            inputs:{
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {
                // $scope.get_companies_services_json(company_id);
            });
        });
    };

    $scope.show_maintenance = function() {

        ModalService.showModal({
            templateUrl: 'modal2.html',
            controller: "ModalMaintenanceController as modal",
            inputs:{
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {
                // $scope.get_companies_services_json(company_id);
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

    $scope.delete_client = function(id){
        swal({
            title: 'Eliminar',
            text: '¿Estas seguro de eliminar este cliente?',
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/clients/' + id + '.json',
                    method: 'DELETE'
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Eliminado',
                            text: 'El cliente ha sido eliminado',
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



app.controller('ModalMaintenanceController', ['$scope','close', 'Upload','$http', '$timeout',function($scope, close, Upload, $http, $timeout) {


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
                url: '/item_maintenance',
                //  data: {file: file}
                data: {item_maintenance: {
                    item_id: servicio,
                    maintenance_id: company,
                    description: $scope.data_com_ser.description,
                    price: $scope.data_com_ser.urgency,
                    provider: $scope.data_com_ser.urgency,
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
