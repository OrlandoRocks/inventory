/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController', ["$scope", "ModalService", "$http", function ($scope, ModalService, $http) {


    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

    $scope.modelhs="";
    $scope.category_description="";





    $scope.init = function (branches, categories, item) {
        $scope.branches = branches;
        $scope.model_name = '';
        $scope.get_models();
        $scope.get_trailers();
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
        $scope.get_brands();
        // $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();

        if (item !== null && item !== undefined) {

            $scope.get_item_json(item);


        }

    };

    $scope.init_order = function (item_id, users) {
        $scope.users = users;
        $scope.get_models();
        $scope.get_trailers();
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
        $scope.get_brands();
        // $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();

        if (item_id) {
            $scope.get_orders(item_id);
        }
    };


    $scope.generate_model = function(){

        $scope.model_name = '';
        $scope.modelhs = '';
        $scope.category_description = '';

        if ($scope.trailer && $scope.trailers)                  $scope.modelhs   +=     $scope.trailers.find( elem => elem.id ===         $scope.trailer).model_part;
        if ($scope.width && $scope.widths)                      $scope.modelhs   +=     $scope.widths.find( elem => elem.id ===           $scope.width).model_part;
        if ($scope.length && $scope.lengths)                    $scope.modelhs   +=     $scope.lengths.find( elem => elem.id ===          $scope.length).model_part;
        if ($scope.height && $scope.heights)                    $scope.modelhs   +=     $scope.heights.find( elem => elem.id ===          $scope.height).model_part;
        if ($scope.floor && $scope.floors)                      $scope.modelhs   +=     $scope.floors.find( elem => elem.id ===           $scope.floor).model_part;
        if ($scope.ramp && $scope.ramps)                        $scope.modelhs   +=     $scope.ramps.find( elem => elem.id ===            $scope.ramp).model_part;
        if ($scope.capacity && $scope.capacities)               $scope.modelhs   +=     $scope.capacities.find( elem => elem.id ===       $scope.capacity).model_part;
        if ($scope.redila && $scope.redilas)                    $scope.modelhs   +=     $scope.redilas.find( elem => elem.id ===          $scope.redila).model_part;
        if ($scope.roof && $scope.roofs)                        $scope.modelhs   +=     $scope.roofs.find( elem => elem.id ===            $scope.roof).model_part;
        if ($scope.turn && $scope.turns)                        $scope.modelhs   +=     $scope.turns.find( elem => elem.id ===            $scope.turn).model_part;
        if ($scope.brake && $scope.brakes)                      $scope.modelhs   +=     $scope.brakes.find( elem => elem.id ===           $scope.brake).model_part;
        if ($scope.color && $scope.colors)                      $scope.modelhs   +=     $scope.colors.find( elem => elem.id ===           $scope.color).model_part;
        if ($scope.divition && $scope.divitions)                $scope.modelhs   +=     $scope.divitions.find( elem => elem.id ===        $scope.divition).model_part;
        if ($scope.fender && $scope.fenders)                    $scope.modelhs   +=     $scope.fenders.find( elem => elem.id ===          $scope.fender).model_part;
        if ($scope.hydraulic_jack && $scope.hydraulic_jacks)    $scope.modelhs   +=     $scope.hydraulic_jacks.find( elem => elem.id ===  $scope.hydraulic_jack).model_part;
        if ($scope.pull && $scope.pulls)                        $scope.modelhs   +=     $scope.pulls.find( elem => elem.id ===            $scope.pull).model_part;
        if ($scope.brand && $scope.brands)                      $scope.modelhs   +=     $scope.brands.find( elem => elem.id ===           $scope.brand).model_part;
        // if ($scope.reinforcement && $scope.reinforcements)      $scope.modelhs   +=     $scope.reinforcements.find( elem => elem.id ===   $scope.reinforcement).model_part;
        if ($scope.suspension && $scope.suspensions)            $scope.modelhs   +=     $scope.suspensions.find( elem => elem.id ===      $scope.suspension).model_part;



        if ($scope.trailer && $scope.trailers)                  $scope.category_description   +=     `TRAILER: ${$scope.trailers.find( elem => elem.id ===         $scope.trailer).name}. `;
        if ($scope.width && $scope.widths)                      $scope.category_description   +=     `ANCHO: ${$scope.widths.find( elem => elem.id ===           $scope.width).name}. `;
        if ($scope.length && $scope.lengths)                    $scope.category_description   +=     `LARGO: ${$scope.lengths.find( elem => elem.id ===          $scope.length).name}. `;
        if ($scope.height && $scope.heights)                    $scope.category_description   +=     `ALTURA: ${$scope.heights.find( elem => elem.id ===          $scope.height).name}. `;
        if ($scope.floor && $scope.floors)                      $scope.category_description   +=     `PISO: ${$scope.floors.find( elem => elem.id ===           $scope.floor).name}. `;
        if ($scope.ramp && $scope.ramps)                        $scope.category_description   +=     `RAMPA: ${$scope.ramps.find( elem => elem.id ===            $scope.ramp).name}. `;
        if ($scope.capacity && $scope.capacities)               $scope.category_description   +=     `CAPACIDAD: ${$scope.capacities.find( elem => elem.id ===       $scope.capacity).name}. `;
        if ($scope.redila && $scope.redilas)                    $scope.category_description   +=     `REDILA: ${$scope.redilas.find( elem => elem.id ===          $scope.redila).name}. `;
        if ($scope.roof && $scope.roofs)                        $scope.category_description   +=     `TECHO: ${$scope.roofs.find( elem => elem.id ===            $scope.roof).name}. `;
        if ($scope.turn && $scope.turns)                        $scope.category_description   +=     `VOLTEO: ${$scope.turns.find( elem => elem.id ===            $scope.turn).name}. `;
        if ($scope.brake && $scope.brakes)                      $scope.category_description   +=     `FRENO: ${$scope.brakes.find( elem => elem.id ===           $scope.brake).name}. `;
        if ($scope.color && $scope.colors)                      $scope.category_description   +=     `COLOR: ${$scope.colors.find( elem => elem.id ===           $scope.color).name}. `;
        if ($scope.divition && $scope.divitions)                $scope.category_description   +=     `DIVISION: ${$scope.divitions.find( elem => elem.id ===        $scope.divition).name}. `;
        if ($scope.fender && $scope.fenders)                    $scope.category_description   +=     `FENDER: ${$scope.fenders.find( elem => elem.id ===          $scope.fender).name}. `;
        if ($scope.hydraulic_jack && $scope.hydraulic_jacks)    $scope.category_description   +=     `GATO HIDRAULICO: ${$scope.hydraulic_jacks.find( elem => elem.id ===  $scope.hydraulic_jack).name}. `;
        if ($scope.pull && $scope.pulls)                        $scope.category_description   +=     `JALON: ${$scope.pulls.find( elem => elem.id ===            $scope.pull).name}. `;
        if ($scope.brand && $scope.brands)                      $scope.category_description   +=     `MARCA: ${$scope.brands.find( elem => elem.id ===   $scope.brand).name}. `;
        // if ($scope.reinforcement && $scope.reinforcements)      $scope.category_description   +=     `REFUERZO: ${$scope.reinforcements.find( elem => elem.id ===   $scope.reinforcement).name}.`;
        if ($scope.suspension && $scope.suspensions)            $scope.category_description   +=     `SUSPENSION: ${$scope.suspensions.find( elem => elem.id ===      $scope.suspension).name}. `;




        $scope.model_name = $scope.modelhs ;

    };

    $scope.set_model = function(model){
        $scope.model = model;


        $scope.length           = '';
        $scope.trailer          = '';
        $scope.width            = '';
        $scope.floor            = '';
        $scope.ramp             = '';
        $scope.capacity         = '';
        $scope.redila           = '';
        $scope.brake            = '';
        $scope.color            = '';
        $scope.divition         = '';
        $scope.fender           = '';
        $scope.pull             = '';
        $scope.hydraulic_jack   = '';
        // $scope.reinforcement    = '';
        $scope.brand            = '';
        $scope.roof             = '';
        $scope.suspension       = '';
        $scope.turn             = '';


        if (model.trailer_type)        {
            $scope.trailer          = model.trailer_type.id;
            // $scope.category_description += `TRAILER:  ${model.trailer_type.name}. `;
        }
        if (model.trailer_length) {
            $scope.length           = model.trailer_length.id;
            // $scope.category_description += `LARGO:  ${model.trailer_length.name}. `;
        }
        if (model.trailer_width)       {
            $scope.width            = model.trailer_width.id;
            // $scope.category_description += `ANCHO:  ${model.trailer_width.name}. `;
        }
        if (model.floor_type)          {
            $scope.floor            = model.floor_type.id;
            // $scope.category_description += `PISO:  ${model.floor_type.name}. `;
        }
        if (model.ramp_type)            {
            $scope.ramp             = model.ramp_type.id;
            // $scope.category_description += `RAMPA:  ${model.ramp_type.name}. `;
        }
        if (model.capacity)             {
            $scope.capacity         = model.capacity.id;
            // $scope.category_description += `CAPACIDAD:  ${model.capacity.name}. `;
        }
        if (model.redila_type)          {
            $scope.redila           = model.redila_type.id;
            // $scope.category_description += `REDILA:  ${model.redila_type.name}. `;
        }
        if (model.brake_type)           {
            $scope.brake            = model.brake_type.id;
            // $scope.category_description += `FRENO:  ${model.brake_type.name}. `;
        }
        if (model.color)                {
            $scope.color            = model.color.id;
            // $scope.category_description += `COLOR:  ${model.color.name}. `;
        }
        if (model.divition_type)        {
            $scope.divition         = model.divition_type.id;
            // $scope.category_description += `DIVISION:  ${model.divition_type.name}. `;
        }
        if (model.fender_type)          {
            $scope.fender           = model.fender_type.id;
            // $scope.category_description += `FENDER:  ${model.fender_type.name}. `;
        }
        if (model.pull_type)            {
            $scope.pull             = model.pull_type.id;
            // $scope.category_description += `JALON:  ${model.pull_type.name}. `;
        }
        if (model.hydraulic_jack)       {
            $scope.hydraulic_jack   = model.hydraulic_jack.id;
            // $scope.category_description += `GATO HIDRAULICO:  ${model.hydraulic_jack.name}. `;
        }
        if (model.brand)   {
            $scope.brand    = model.brand.id;
            // $scope.category_description += `REFUERZO:  ${model.reinforcement_type.name}. `;
        }
        // if (model.reinforcement_type)   {
        //     $scope.reinforcement    = model.reinforcement_type.id;
        //     // $scope.category_description += `REFUERZO:  ${model.reinforcement_type.name}. `;
        // }
        if (model.roof_type)            {
            $scope.roof             = model.roof_type.id;
            // $scope.category_description += `TECHO:  ${model.roof_type.name}. `;
        }
        if (model.suspension_type)      {
            $scope.suspension       = model.suspension_type.id;
            // $scope.category_description += `SUSPENSION:  ${model.suspension_type.name}. `;
        }
        if (model.turn_type)            {
            $scope.turn             = model.turn_type.id;
            // $scope.category_description += `VOLTEO:  ${model.turn_type.name}. `;
        }





        $scope.generate_model();



    };



    $scope.get_item_json = function (id) {

        $http({
            method: 'GET',
            url: '/items/' + id + '.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;



                $scope.set_model($scope.item);
                 $scope.branch = $scope.item.branch_id;
                if ($scope.branch !== null) {
                    $scope.get_department();
                }
                if ($scope.item.status_shipping_id === 1) {
                    $scope.branch = $scope.item.department_user.branch_id;
                    $scope.get_department();
                }
                // $scope.get_trailer($scope.item.trailer_type_id);
                $scope.get_fiscal_vouchers();
                $scope.get_clients();

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };


    $scope.get_orders = function (id) {
        $http({
            method: 'GET',
            url: '/items/' + id + '.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;
                $scope.set_model($scope.item);
                $scope.user = $scope.item.user_id
                $scope.get_branch_user($scope.item.user_id);

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_department = function () {
        $http({
            url: '/departments_by_branch/' + $scope.branch + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.department = response.data;
            $scope.consignee = response.data.manager;
            $scope.full_name = $scope.consignee.first_name + ' ' + $scope.consignee.last_name;
        });
    };

    $scope.get_subcategories = function () {
        $http({
            url: '/subcategory_by_category/' + $scope.category + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.sub_categories = response.data;

        });
    };

    $scope.get_trailers = function () {
        $http({
            method: 'GET',
            url: '/trailer_types.json'
        }).then(function successCallback(response) {
            response.data.forEach(function (trailer) {
                delete trailer.image;
                delete trailer.url;
            })

            $scope.trailers = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_models = function () {
        $http({
            method: 'GET',
            url: '/trailers.json'
        }).then(function successCallback(response) {
            $scope.models = response.data;
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
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_brands = function () {
        $http({
            method: 'GET',
            url: '/brands.json'
        }).then(function successCallback(response) {
            $scope.brands = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };
    //
    // $scope.get_reinforcements = function () {
    //     $http({
    //         method: 'GET',
    //         url: '/reinforcement_types.json'
    //     }).then(function successCallback(response) {
    //         $scope.reinforcements = response.data;
    //     }, function errorCallback(response) {
    //         console.log("Algo valio shit!");
    //     });
    // };

    $scope.get_roofs = function () {
        $http({
            method: 'GET',
            url: '/roof_types.json'
        }).then(function successCallback(response) {
            $scope.roofs = response.data;
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
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
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


    $scope.get_branch_user = function (user) {
        $http({
            url: '/users/' + user + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {

                $scope.branch_name = response.data.branch.name;
                $scope.department_name = response.data.department.name;
                $scope.department_id = response.data.department_id;
            }
        });
    };

    $scope.get_trailer = function (trailer) {
        $http({
            url: '/trailer_types/' + trailer + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {
                $scope.model_name = response.data.model_part;
                $scope.trailer = response.data;
            }

        });
    };


    $scope.get_model = function (trailer) {
        if(trailer) {
            $http({
                url: '/trailers/' + trailer + '.json',
                method: 'GET'
            }).then(function (response) {
                if (response.data != null) {
                    $scope.model = response.data;
                    $scope.set_model($scope.model);
                }

            });
        }
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


    $scope.delete_item = function (id) {
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

    $scope.show_receive = function () {

        swal({
            title: 'Producto Recibido',
            text: '¿Ha recibido este producto?',
            confirmButtonText: "SI",
            cancelButtonText: "NO",
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
            modal.close.then(function (sale_detail) {


                // $scope.showConfirm(sale_detail);
                // $scope.save_sale_detail(sale_detail);
                // $scope.amount_paid += parseInt(paid);
                // $scope.amount_owed -= paid;
                // $scope.get_sale_details_json($scope.sale);
            });
        });
    };

    $scope.show_voucher = function () {

        ModalService.showModal({
            templateUrl: 'modal_factura.html',
            controller: "ModalFacturaController as modal",
            inputs: {
                item: $scope.item,
                fiscal_vouchers: $scope.fiscal_vouchers,
                clients: $scope.clients
            }
        }).then(function (modal) {
            modal.element.modal();
            modal.close.then(function (sale_detail) {


                // $scope.showConfirm(sale_detail);
                // $scope.save_sale_detail(sale_detail);
                // $scope.amount_paid += parseInt(paid);
                // $scope.amount_owed -= paid;
                // $scope.get_sale_details_json($scope.sale);
            });
        });
    };

    $scope.accept_voucher = function (id) {
        swal({
            title: 'Aceptar Factura',
            text: '¿Esta seguro de aceptar la factura?',
            confirmButtonText: "SI",
            cancelButtonText: "NO",
            type: 'question',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm) {
                $http({
                    url: '/items/' + id + '.json',
                    method: 'PUT',
                    data: {
                        item: {
                            status_item_id: 4
                        }
                    }
                }).then(function (response) {
                    if (response.data) {
                        swal({
                            title: 'Aceptado',
                            text: 'La factura a sido aceptada',
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



}]).directive('format', ['$filter', function ($filter) {
    return {
        require: '?ngModel',
        link: function (scope, elem, attrs, ctrl) {
            if (!ctrl) return;

            ctrl.$formatters.unshift(function (a) {
                return $filter(attrs.format)(ctrl.$modelValue)
            });

            elem.bind('blur', function (event) {
                var plainNumber = elem.val().replace(/[^\d|\-+|\.+]/g, '');
                elem.val($filter(attrs.format)(plainNumber));
            });
        }
    };
}]);;


app.controller('ModalVentaController', ['$scope', 'close', 'Upload', '$http', 'item', 'fiscal_vouchers', 'clients', '$timeout',
    function ($scope, close, Upload, $http, item, fiscal_vouchers, clients,$timeout) {


    $scope.open = function ($event) {
        $event.preventDefault();
        $event.stopPropagation();
        $scope.opened = true;
    };


    $scope.close = function () {
        close('', 500); // close, but give 500ms for bootstrap to animate
    };

    $scope.signature = "";

    $scope.item = item;
    $scope.fiscal_vouchers = fiscal_vouchers;
    $scope.clients = clients;
    $scope.payment_types = {
        0: {id: 1, type: 'Cash'},
        1: {id: 2, type: 'Deposito'},
        2: {id: 3, type: 'Transferencia'}
    };


    $scope.uploadSell = function (status_vendido, status_pendiente_factura) {


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
                                $http({
                                    url: '/send_email/ '+ $scope.item.id + '.json',
                                    method: 'GET'
                                }).then(function (response) {
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

                            }
                        });
                    }, function (response) {
                        if (response.status > 0)
                            $scope.errorMsg = response.status + ': ' + response.data;


                    }, function (evt) {
                        $scope.item.image.progress = Math.min(100, parseInt(100.0 *
                            evt.loaded / evt.total));
                    });

                } else {
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
                            $http({
                                url: '/send_email/ '+ $scope.item.id + '.json',
                                method: 'GET'
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
                            // swal({
                            //     title: 'Vendido (Falta Comprobante)',
                            //     text: 'El artículo ha sido Vendido y se facturara cuando se agregue el comprobante de pago',
                            //     type: 'success',
                            //     showCancelButton: false
                            // }).then(function (isConfirm) {
                            //     if (isConfirm) {
                            //         location.reload();
                            //     }
                            //
                            // }, function (iSConfirm) {
                            //
                            // });
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

            elem.bind('blur', function (event) {
                var plainNumber = elem.val().replace(/[^\d|\-+|\.+]/g, '');
                elem.val($filter(attrs.format)(plainNumber));
            });
        }
    };
}]);

app.controller('ModalFacturaController', ['$scope', 'close', 'Upload', '$http', 'item', 'fiscal_vouchers', 'clients', '$timeout',
    function ($scope, close, Upload, $http, item, fiscal_vouchers, clients,$timeout) {


        $scope.open = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opened = true;
        };


        $scope.close = function () {
            close('', 500); // close, but give 500ms for bootstrap to animate
        };

        $scope.signature = "";

        $scope.item = item;
        $scope.fiscal_vouchers = fiscal_vouchers;
        $scope.clients = clients;
        $scope.payment_types = {
            0: {id: 1, type: 'Cash'},
            1: {id: 2, type: 'Deposito'},
            2: {id: 3, type: 'Transferencia'}
        };


        $scope.uploadVoucher = function (status_vendido, status_pendiente_factura) {

            swal({
                title: '¿Estas seguro de subir este comprobante?',
                text: '',
                confirmButtonText: "SI",
                cancelButtonText: "NO",
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
                                        title: 'Subido',
                                        text: 'El comprobando a sido subido con exito',
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

            elem.bind('blur', function (event) {
                var plainNumber = elem.val().replace(/[^\d|\-+|\.+]/g, '');
                elem.val($filter(attrs.format)(plainNumber));
            });
        }
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
        if (file) {
            file.upload = Upload.upload({
                url: '/item_file',
                //  data: {file: file}
                data: {
                    item_file: {
                        item_id: servicio,
                        file_type: company,
                        description: $scope.data_com_ser.description,
                        file: file
                    }
                }
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

