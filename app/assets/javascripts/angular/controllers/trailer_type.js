/**
 * Created by orlando on 11/12/16.
 */
app.controller('trailerTypeController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


    $scope.init = function(id){



        $scope.index = -1;
        $scope.remove_cat_count = 0;
        $scope.categories_saved = [];
        $scope.trailer_categories = [];

        if(id !== undefined && id !== null){
            $scope.get_trailers(id);
        }
        $scope.get_floors();
        $scope.get_ramps();
        $scope.get_redilas();
        $scope.get_capacities();
        $scope.get_widths();
        $scope.get_lengths();
        $scope.get_brakes();
        $scope.get_colors();
        $scope.get_divitions();
        $scope.get_fenders();
        $scope.get_hydraulic_jacks();
        $scope.get_pulls();
        $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();

        $scope.new_trailer_categories = [];

    };


    $scope.add_category = function (trailer) {

        if(trailer){
            var index = $scope.trailer_categories.indexOf(trailer);

            $scope.new_trailer_categories.push(trailer);

            $scope.trailer_categories.splice(index, 1);
        }

    };

    $scope.remove_saved_categories = function () {

        if($scope.remove_cat_count==0){
            $scope.remove_cat_count = 1;
            console.log($scope.categories_saved);
            angular.forEach($scope.categories_saved, function(cs, csk) {
                angular.forEach($scope.trailer_categories, function(cat, catkey) {

                    if(cs.key==cat.category && cs[cs.key]==cat.id){
                        $scope.trailer_categories.splice(catkey, 1);
                    }

                });
            });
        }

    };


    $scope.remove_category = function (index, trailer_category) {

        $scope.new_trailer_categories.splice(index, 1);
        $scope.trailer_categories.push(trailer_category);
    };

    $scope.updateTrailerList = function (index,trailer) {


        $scope.new_trailer_categories[index] = trailer;


    };


    $scope.get_trailers = function (id) {
        $http({
            method: 'GET',
            url: `/trailer_types/${id}.json`
        }).then(function successCallback(response) {
            $scope.trailers = response.data;
            $scope.categories_saved = $scope.trailers.trailer_categories;

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_ramps = function () {
        $http({
            method: 'GET',
            url: '/ramp_types.json'
        }).then(function successCallback(response) {
            $scope.ramps = response.data;
            angular.forEach($scope.ramps, function(ramp, key) {
                this.push({id: ramp.id, inx:$scope.index++, name: ramp.name, category: 'ramp_type_id', category_name: 'Tipo de Rampa'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_redilas = function () {
        $http({
            method: 'GET',
            url: '/redila_types.json'
        }).then(function successCallback(response) {
            $scope.redilas = response.data;
            angular.forEach($scope.redilas, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'redila_type_id', category_name: 'Tipo de Redila'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_capacities = function () {
        $http({
            method: 'GET',
            url: '/capacities.json'
        }).then(function successCallback(response) {
            $scope.capacities = response.data;
            angular.forEach($scope.capacities, function(value, key) {
                this.push({id: value.id,inx:$scope.index++, name: value.name, category: 'capacity_id', category_name: 'Capacidad'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_floors = function () {
        $http({
            method: 'GET',
            url: '/floor_types.json'
        }).then(function successCallback(response) {
            $scope.floors = response.data;
            angular.forEach($scope.floors, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'floor_type_id', category_name: 'Tipo de Piso'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_widths = function () {
        $http({
            method: 'GET',
            url: '/trailer_widths.json'
        }).then(function successCallback(response) {
            $scope.widths = response.data;
            angular.forEach($scope.widths, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'trailer_width_id', category_name: 'Anchura'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_lengths = function () {
        $http({
            method: 'GET',
            url: '/trailer_lengths.json'
        }).then(function successCallback(response) {
            $scope.lengths = response.data;
            angular.forEach($scope.lengths, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'trailer_length_id', category_name: 'Longitud'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_brakes = function () {
        $http({
            method: 'GET',
            url: '/brake_types.json'
        }).then(function successCallback(response) {
            $scope.brakes = response.data;
            angular.forEach($scope.brakes, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'brake_type_id', category_name: 'Tipo de Freno'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_colors = function () {
        $http({
            method: 'GET',
            url: '/colors.json'
        }).then(function successCallback(response) {
            $scope.colors = response.data;
            angular.forEach($scope.colors, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'color_id', category_name: 'Color'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_divitions = function () {
        $http({
            method: 'GET',
            url: '/divition_types.json'
        }).then(function successCallback(response) {
            $scope.divitions = response.data;
            angular.forEach($scope.divitions, function(value, key) {
                this.push({id: value.id, inx:$scope.index++, name: value.name, category: 'divition_type_id', category_name: 'Tipo de División'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_fenders = function () {
        $http({
            method: 'GET',
            url: '/fender_types.json'
        }).then(function successCallback(response) {
            $scope.fenders = response.data;
            angular.forEach($scope.fenders, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'fender_type_id', category_name: 'Tipo de Fender'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_hydraulic_jacks = function () {
        $http({
            method: 'GET',
            url: '/hydraulic_jacks.json'
        }).then(function successCallback(response) {
            $scope.hydraulic_jacks = response.data;
            angular.forEach($scope.hydraulic_jacks, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'hydraulic_jack_id', category_name: 'Gato Hidraulico'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_pulls = function () {
        $http({
            method: 'GET',
            url: '/pull_types.json'
        }).then(function successCallback(response) {
            $scope.pulls = response.data;
            angular.forEach($scope.pulls, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'pull_type_id', category_name: 'Tipo de Jalon'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_reinforcements = function () {
        $http({
            method: 'GET',
            url: '/reinforcement_types.json'
        }).then(function successCallback(response) {
            $scope.reinforcements = response.data;
            angular.forEach($scope.reinforcements, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'reinforcement_type_id', category_name: 'Refuerzo'});
            }, $scope.trailer_categories);

        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_roofs = function () {
        $http({
            method: 'GET',
            url: '/roof_types.json'
        }).then(function successCallback(response) {
            $scope.roofs = response.data;
            angular.forEach($scope.roofs, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'roof_type_id', category_name: 'Tipo de Techo'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_suspensions = function () {
        $http({
            method: 'GET',
            url: '/suspension_types.json'
        }).then(function successCallback(response) {
            $scope.suspensions = response.data;
            angular.forEach($scope.suspensions, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'suspension_type_id', category_name: 'Tipo de Suspencion'});
            }, $scope.trailer_categories);
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_turns = function () {
        $http({
            method: 'GET',
            url: '/turn_types.json'
        }).then(function successCallback(response) {
            $scope.turns = response.data;
            angular.forEach($scope.turns, function(value, key) {
                this.push({id: value.id, name: value.name, category: 'turn_type_id', category_name: 'Tipo de Volteo'});
            }, $scope.trailer_categories);
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




    

