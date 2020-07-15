/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController',["$scope", "ModalService", "$http",'$timeout', function($scope, ModalService, $http, $timeout) {
    // $scope.files = [];
    // $scope.maintenances = [];
    $scope.item=0;

    $scope.get_maintenances_json =  function(id) {
        $http.get('/get_maintenances/'+id+'.json')
            .success(function(data, status, headers, config) {
                $scope.item_maintenances_data = data;
            })
            .error(function(error, status, headers, config) {
                console.log(status);
                console.log("Error occured");
            });

    };


    $scope.get_files_json =  function(id) {
        $http.get('/get_files/'+id+'.json')
            .success(function(data, status, headers, config) {
                $scope.item_files_data = data;
            })
            .error(function(error, status, headers, config) {
                console.log(status);
                console.log("Error occured");
            });

    };

    $timeout(function(){
        $scope.get_files_json($scope.item);
        $scope.get_maintenances_json($scope.item);
    },1000);


    $scope.show = function() {

        ModalService.showModal({
            templateUrl: 'modal.html',
            controller: "ModalFileController as modal",
            inputs:{
                item_id: $scope.item
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {

                $scope.get_files_json($scope.item);
                
                // if(!angular.equals(result, {})){
                //     $scope.files.push(result);
                // }
            });
        });
    };

    $scope.show_maintenance = function() {

        ModalService.showModal({
            templateUrl: 'modal2.html',
            controller: "ModalMaintenanceController as modal",
            inputs:{
                item_id: $scope.item
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {
                
                $scope.get_maintenances_json($scope.item);
                // if(!angular.equals(result, {})) {
                //     $scope.maintenances.push(result);
                // }
            });
        });
    };

}]);





app.controller('ModalFileController', ['$scope','close','item_id', 'Upload','$http', '$timeout',function($scope, close, item_id, Upload, $http, $timeout) {

    // var file = {};
    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };



    $scope.close = function(result) {
        close(result, 500); // close, but give 500ms for bootstrap to animate
    };


    //
    // $scope.addFiles = function(){
    //     file={
    //         description: $scope.description,
    //         file_type: $scope.file_type,
    //         file : $scope.file
    //     };
    //     $scope.close();
    // };

    $scope.uploadFiles = function (file) {
        Upload.upload({
            url: '/item_file/'+item_id,
            data: {item_file: {
                item_id: item_id,
                description: $scope.description,
                file_type: $scope.file_type,
                file: file
            }}
        }).then(function (resp) {
            close("se armo");
        }, function (resp) {
            console.log('Error status: ' + resp.status);
        }, function (evt) {
            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
            console.log('progress: ' + progressPercentage + '% ');
        });
    };

    // $scope.uploadFiles = function(file) {
    //     if (file) {
    //         console.log("Hola bitch!");
    //
    //         file.upload = Upload.upload({
    //             url: '/item_file',
    //             data: {item_file: {
    //                 item_id: item_id,
    //                 description: $scope.description,
    //                 file_type: $scope.file_type,
    //                 file: file
    //             }}
    //         });
    //
    //         file.upload.then(function (response) {
    //             $timeout(function () {
    //                 file.result = response.data;
    //                 $scope.close("Cancel");
    //             });
    //         }, function (response) {
    //             if (response.status > 0)
    //                 $scope.errorMsg = response.status + ': ' + response.data;
    //         }, function (evt) {
    //             file.progress = Math.min(100, parseInt(100.0 *
    //                 evt.loaded / evt.total));
    //         });
    //     }
    // }
    
    


}]);



app.controller('ModalMaintenanceController', ['$scope','close','item_id', 'Upload','$http', '$timeout',function($scope, close, item_id, Upload, $http, $timeout) {

    // var maintenance = {};
    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };


    $scope.close = function(result) {
        close(result, 500); // close, but give 500ms for bootstrap to animate
    };


    //
    // $scope.addMaintenance = function(){
    //     maintenance={
    //         description: $scope.description,
    //         maintenance_id: $scope.maintenance,
    //         price: $scope.price,
    //         provider: $scope.provider,
    //         file : $scope.file
    //     };
    //     $scope.close();
    // };

    $scope.uploadFiles = function(file) {
        if (file) {
            file.upload = Upload.upload({
                url: '/item_maintenance/'+item_id,
                data: {item_maintenance: {
                    item_id: item_id,
                    description: $scope.description,
                    maintenance_id: $scope.maintenance,
                    price: $scope.price,
                    provider: $scope.provider,
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

app.controller('manageItemController', ['$scope', '$http', function($scope, $http) {

    $scope.maintenanceDone = false;

    $scope.init = function(item){
        $scope.item = item;
        $scope.maintenanceDone = $scope.item.maintenance_done;
    };

    $scope.$watch('maintenanceDone', function(newV, oldV){
        if (newV !== oldV)
            $scope.changeMaintenanceDone(newV)
    });

    $scope.changeMaintenanceDone = function(value) {
        $http.put('/items/' + $scope.item.id + '/change_maintenance_done/' + value, {}, {}).then(function (response) {
        }, function (response) {
            alert(I18n.general_error);
        });
    };

}]);
