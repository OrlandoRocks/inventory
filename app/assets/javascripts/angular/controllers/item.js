/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController', ["$scope", "ModalService", "$http", function ($scope, ModalService, $http) {

    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

    $scope.modelhs = "";
    $scope.category_description = "";
    $scope.ramps = [];
    $scope.redilas = [];
    $scope.capacities = [];
    $scope.floors = [];
    $scope.widths = [];
    $scope.lengths = [];
    $scope.brakes = [];
    $scope.colors = [];
    $scope.divitions = [];
    $scope.fenders = [];
    $scope.hydraulic_jacks = [];
    $scope.pulls = [];
    $scope.brands = [];
    $scope.roofs = [];
    $scope.suspensions = [];
    $scope.turns = [];


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
        $scope.get_ramps();



        if (item !== null && item !== undefined) {

            $scope.get_item_json(item);


        }

    };

    $scope.init_order = function (item_id, users, branches, categories) {
        $scope.users = users;
        // $scope.get_branch_user(current_user.id);
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
        $scope.get_ramps();

        if (item_id) {
            $scope.get_orders(item_id);
        }
    };



    $scope.get_item_json = function (id) {

        $http({
            method: 'GET',
            url: '/items/' + id + '.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;



                $scope.get_trailer($scope.item.trailer_type.id);
                $scope.branch = $scope.item.branch;
                if ($scope.branch !== null) {
                    $scope.get_department();
                }
                if ($scope.item.status_shipping_id === 1) {
                    $scope.branch = $scope.item.department_user.branch;
                    $scope.get_department();
                }


                $scope.get_fiscal_vouchers();
                $scope.get_clients();
                $scope.item.price =parseFloat($scope.item.price);
                $scope.fleet = $scope.item.price * ( 1 + ( $scope.branch.fleet_cost) /100 );

                $scope.set_model($scope.item);

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };



    $scope.generate_model = function () {


        $scope.model_name = '';
        $scope.modelhs = '';
        $scope.category_description = '';


        if ($scope.trailer && $scope.trailers.length !== 0) $scope.modelhs += $scope.trailers.find(elem => elem.id === $scope.trailer).model_part;
        if ($scope.width && $scope.widths.length !== 0) $scope.modelhs += $scope.widths.find(elem => elem.id === $scope.width).model_part;
        if ($scope.length && $scope.lengths.length !== 0) $scope.modelhs += $scope.lengths.find(elem => elem.id === $scope.length).model_part;
        if ($scope.height && $scope.heights.length !== 0) $scope.modelhs += $scope.heights.find(elem => elem.id === $scope.height).model_part;
        if ($scope.floor && $scope.floors.length !== 0) $scope.modelhs += $scope.floors.find(elem => elem.id === $scope.floor).model_part;
        if ($scope.ramp && $scope.ramps.length !== 0) $scope.modelhs += $scope.ramps.find(elem => elem.id === $scope.ramp).model_part;
        if ($scope.capacity && $scope.capacities.length !== 0) $scope.modelhs += $scope.capacities.find(elem => elem.id === $scope.capacity).model_part;
        if ($scope.redila && $scope.redilas.length !== 0) $scope.modelhs += $scope.redilas.find(elem => elem.id === $scope.redila).model_part;
        if ($scope.roof && $scope.roofs.length !== 0) $scope.modelhs += $scope.roofs.find(elem => elem.id === $scope.roof).model_part;
        if ($scope.turn && $scope.turns.length !== 0) $scope.modelhs += $scope.turns.find(elem => elem.id === $scope.turn).model_part;
        if ($scope.brake && $scope.brakes.length !== 0) $scope.modelhs += $scope.brakes.find(elem => elem.id === $scope.brake).model_part;
        if ($scope.color && $scope.colors.length !== 0) $scope.modelhs += $scope.colors.find(elem => elem.id === $scope.color).model_part;
        if ($scope.divition && $scope.divitions.length !== 0) $scope.modelhs += $scope.divitions.find(elem => elem.id === $scope.divition).model_part;
        if ($scope.fender && $scope.fenders.length !== 0) $scope.modelhs += $scope.fenders.find(elem => elem.id === $scope.fender).model_part;
        if ($scope.hydraulic_jack && $scope.hydraulic_jacks.length !== 0) $scope.modelhs += $scope.hydraulic_jacks.find(elem => elem.id === $scope.hydraulic_jack).model_part;
        if ($scope.pull && $scope.pulls.length !== 0) $scope.modelhs += $scope.pulls.find(elem => elem.id === $scope.pull).model_part;
        if ($scope.brand && $scope.brands.length !== 0) $scope.modelhs += $scope.brands.find(elem => elem.id === $scope.brand).model_part;
        // if ($scope.reinforcement && $scope.reinforcements)      $scope.modelhs   +=     $scope.reinforcements.find( elem => elem.id ===   $scope.reinforcement).model_part;
        if ($scope.suspension && $scope.suspensions.length !== 0) $scope.modelhs += $scope.suspensions.find(elem => elem.id === $scope.suspension).model_part;


        if ($scope.trailer && $scope.trailers.length !== 0) $scope.category_description += `TRAILER: ${$scope.trailers.find(elem => elem.id === $scope.trailer).name}. `;
        if ($scope.width && $scope.widths.length !== 0) $scope.category_description += `ANCHO: ${$scope.widths.find(elem => elem.id === $scope.width).name}. `;
        if ($scope.length && $scope.lengths.length !== 0) $scope.category_description += `LARGO: ${$scope.lengths.find(elem => elem.id === $scope.length).name}. `;
        if ($scope.height && $scope.heights.length !== 0) $scope.category_description += `ALTURA: ${$scope.heights.find(elem => elem.id === $scope.height).name}. `;
        if ($scope.floor && $scope.floors.length !== 0) $scope.category_description += `PISO: ${$scope.floors.find(elem => elem.id === $scope.floor).name}. `;
        if ($scope.ramp && $scope.ramps.length !== 0) $scope.category_description += `RAMPA: ${$scope.ramps.find(elem => elem.id === $scope.ramp).name}. `;
        if ($scope.capacity && $scope.capacities.length !== 0) $scope.category_description += `CAPACIDAD: ${$scope.capacities.find(elem => elem.id === $scope.capacity).name}. `;
        if ($scope.redila && $scope.redilas.length !== 0) $scope.category_description += `REDILA: ${$scope.redilas.find(elem => elem.id === $scope.redila).name}. `;
        if ($scope.roof && $scope.roofs.length !== 0) $scope.category_description += `TECHO: ${$scope.roofs.find(elem => elem.id === $scope.roof).name}. `;
        if ($scope.turn && $scope.turns.length !== 0) $scope.category_description += `VOLTEO: ${$scope.turns.find(elem => elem.id === $scope.turn).name}. `;
        if ($scope.brake && $scope.brakes.length !== 0) $scope.category_description += `FRENO: ${$scope.brakes.find(elem => elem.id === $scope.brake).name}. `;
        if ($scope.color && $scope.colors.length !== 0) $scope.category_description += `COLOR: ${$scope.colors.find(elem => elem.id === $scope.color).name}. `;
        if ($scope.divition && $scope.divitions.length !== 0) $scope.category_description += `DIVISION: ${$scope.divitions.find(elem => elem.id === $scope.divition).name}. `;
        if ($scope.fender && $scope.fenders.length !== 0) $scope.category_description += `FENDER: ${$scope.fenders.find(elem => elem.id === $scope.fender).name}. `;
        if ($scope.hydraulic_jack && $scope.hydraulic_jacks.length !== 0) $scope.category_description += `GATO HIDRAULICO: ${$scope.hydraulic_jacks.find(elem => elem.id === $scope.hydraulic_jack).name}. `;
        if ($scope.pull && $scope.pulls.length !== 0) $scope.category_description += `JALON: ${$scope.pulls.find(elem => elem.id === $scope.pull).name}. `;
        if ($scope.brand && $scope.brands.length !== 0) $scope.modelhs += $scope.brands.find(elem => elem.id === $scope.brand).model_part;
        // if ($scope.reinforcement && $scope.reinforcements)      $scope.category_description   +=     `REFUERZO: ${$scope.reinforcements.find( elem => elem.id ===   $scope.reinforcement).name}.`;
        if ($scope.suspension && $scope.suspensions.length !== 0) $scope.category_description += `SUSPENSION: ${$scope.suspensions.find(elem => elem.id === $scope.suspension).name}. `;


        $scope.model_name = $scope.modelhs;

    };

    $scope.set_model = function (model) {
        $scope.model = model;



        $scope.length = '';
        $scope.trailer = '';
        $scope.width = '';
        $scope.floor = '';
        $scope.ramp = '';
        $scope.capacity = '';
        $scope.redila = '';
        $scope.brake = '';
        $scope.color = '';
        $scope.divition = '';
        $scope.fender = '';
        $scope.pull = '';
        $scope.hydraulic_jack = '';
        // $scope.reinforcement    = '';
        $scope.brand = '';
        $scope.roof = '';
        $scope.suspension = '';
        $scope.turn = '';







        if (model.trailer_type) {
            $scope.trailer = model.trailer_type.id;

        }
        if (model.trailer_length) {
            $scope.length = model.trailer_length.id;


            // $scope.category_description += `LARGO:  ${model.trailer_length.name}. `;
        }
        if (model.trailer_width) {


            $scope.width = model.trailer_width.id;
            // $scope.category_description += `ANCHO:  ${model.trailer_width.name}. `;
        }
        if (model.floor_type) {
            $scope.floor = model.floor_type.id;
            // $scope.category_description += `PISO:  ${model.floor_type.name}. `;
        }
        if (model.ramp_type) {
            $scope.ramp = model.ramp_type.id;
            // $scope.category_description += `RAMPA:  ${model.ramp_type.name}. `;
        }
        if (model.capacity) {
            $scope.capacity = model.capacity.id;
            // $scope.category_description += `CAPACIDAD:  ${model.capacity.name}. `;
        }
        if (model.redila_type) {
            $scope.redila = model.redila_type.id;
            // $scope.category_description += `REDILA:  ${model.redila_type.name}. `;
        }
        if (model.brake_type) {
            $scope.brake = model.brake_type.id;
            // $scope.category_description += `FRENO:  ${model.brake_type.name}. `;
        }
        if (model.color) {
            $scope.color = model.color.id;
            // $scope.category_description += `COLOR:  ${model.color.name}. `;
        }
        if (model.divition_type) {
            $scope.divition = model.divition_type.id;
            // $scope.category_description += `DIVISION:  ${model.divition_type.name}. `;
        }
        if (model.fender_type) {
            $scope.fender = model.fender_type.id;
            // $scope.category_description += `FENDER:  ${model.fender_type.name}. `;
        }
        if (model.pull_type) {
            $scope.pull = model.pull_type.id;
            // $scope.category_description += `JALON:  ${model.pull_type.name}. `;
        }
        if (model.hydraulic_jack) {
            $scope.hydraulic_jack = model.hydraulic_jack.id;
            // $scope.category_description += `GATO HIDRAULICO:  ${model.hydraulic_jack.name}. `;
        }
        if (model.brand) {
            $scope.brand = model.brand.id;
            // $scope.category_description += `REFUERZO:  ${model.reinforcement_type.name}. `;
        }
        // if (model.reinforcement_type)   {
        //     $scope.reinforcement    = model.reinforcement_type.id;
        //     // $scope.category_description += `REFUERZO:  ${model.reinforcement_type.name}. `;
        // }
        if (model.roof_type) {
            $scope.roof = model.roof_type.id;
            // $scope.category_description += `TECHO:  ${model.roof_type.name}. `;
        }
        if (model.suspension_type) {
            $scope.suspension = model.suspension_type.id;
            // $scope.category_description += `SUSPENSION:  ${model.suspension_type.name}. `;
        }
        if (model.turn_type) {
            $scope.turn = model.turn_type.id;
            // $scope.category_description += `VOLTEO:  ${model.turn_type.name}. `;
        }





        setTimeout(function (){
            $scope.generate_model();
            $scope.$apply();
        },100);





    };



    $scope.get_item_json = function (id) {

        $http({
            method: 'GET',
            url: '/items/' + id + '.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;


                $scope.trailer = $scope.item.trailer_type.id;
                $scope.brake = $scope.item.brake_type !== null && $scope.item.brake_type !== undefined ? $scope.item.brake_type.id : null;
                $scope.width = $scope.item.trailer_width !== null && $scope.item.trailer_width !== undefined ? $scope.item.trailer_width.id : null;
                $scope.color = $scope.item.color !== null && $scope.item.color !== undefined ? $scope.item.color.id : null;
                $scope.length = $scope.item.trailer_length !== null && $scope.item.trailer_length !== undefined ? $scope.item.trailer_length.id : null;
                $scope.divition = $scope.item.divition_type !== null && $scope.item.divition_type !== undefined ? $scope.item.divition_type.id : null;
                $scope.floor = $scope.item.floor_type !== null && $scope.item.floor_type !== undefined ? $scope.item.floor_type.id : null;
                $scope.fender = $scope.item.fender_type !== null && $scope.item.fender_type !== undefined ? $scope.item.fender_type.id : null;
                $scope.ramp = $scope.item.ramp_type !== null && $scope.item.ramp_type !== undefined ? $scope.item.ramp_type.id : null;
                $scope.hydraulic_jack = $scope.item.hydraulic_jack !== null && $scope.item.hydraulic_jack !== undefined ?  $scope.item.hydraulic_jack.id : null;
                $scope.capacity = $scope.item.capacity !== null && $scope.item.capacity !== undefined ? $scope.item.capacity.id : null;
                $scope.pull = $scope.item.pull_type !== null && $scope.item.pull_type !== undefined ? $scope.item.pull_type.id : null;
                $scope.redila = $scope.item.redila_type !== null && $scope.item.redila_type !== undefined ? $scope.item.redila_type.id : null;
                $scope.roof = $scope.item.roof_type !== null && $scope.item.roof_type !== undefined ? $scope.item.roof_type.id : null;
                $scope.suspension = $scope.item.suspension_type !== null && $scope.item.suspension_type !== undefined ? $scope.item.suspension_type.id : null;
                $scope.turn = $scope.item.turn_type !== null && $scope.item.turn_type !== undefined ? $scope.item.turn_type.id : null;
                $scope.brand = $scope.item.brand !== null && $scope.item.brand !== undefined ? $scope.item.brand.id : null;




                $scope.get_trailer($scope.trailer);

                $scope.branch = $scope.item.branch;
                if ($scope.branch !== null) {
                    $scope.get_all_department($scope.trailer);
                    $scope.department = $scope.item.department_user.id;

                }
                if ($scope.item.status_shipping_id === 1) {
                    $scope.branch = $scope.item.department_user.branch;
                    $scope.department = $scope.item.department_user.id;
                    $scope.get_all_department($scope.item.branch.id);
                    $scope.department = $scope.item.department_user.id;
                }


                $scope.get_fiscal_vouchers();
                $scope.get_clients();
                $scope.item.price =parseFloat($scope.item.price);
                $scope.fleet = $scope.item.price * ( 1 + ( $scope.branch.fleet_cost) /100 );
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
                $scope.item = response.data
                $scope.user = $scope.item.user_id;
                $scope.get_branch_user($scope.item.user_id);
                $scope.trailer = $scope.item.trailer_type.id;
                $scope.brake = $scope.item.brake_type !== null && $scope.item.brake_type !== undefined ? $scope.item.brake_type.id : null;
                $scope.width = $scope.item.trailer_width !== null && $scope.item.trailer_width !== undefined ? $scope.item.trailer_width.id : null;
                $scope.color = $scope.item.color !== null && $scope.item.color !== undefined ? $scope.item.color.id : null;
                $scope.length = $scope.item.trailer_length !== null && $scope.item.trailer_length !== undefined ? $scope.item.trailer_length.id : null;
                $scope.divition = $scope.item.divition_type !== null && $scope.item.divition_type !== undefined ? $scope.item.divition_type.id : null;
                $scope.floor = $scope.item.floor_type !== null && $scope.item.floor_type !== undefined ? $scope.item.floor_type.id : null;
                $scope.fender = $scope.item.fender_type !== null && $scope.item.fender_type !== undefined ? $scope.item.fender_type.id : null;
                $scope.ramp = $scope.item.ramp_type !== null && $scope.item.ramp_type !== undefined ? $scope.item.ramp_type.id : null;
                $scope.hydraulic_jack = $scope.item.hydraulic_jack !== null && $scope.item.hydraulic_jack !== undefined ?  $scope.item.hydraulic_jack.id : null;
                $scope.capacity = $scope.item.capacity !== null && $scope.item.capacity !== undefined ? $scope.item.capacity.id : null;
                $scope.pull = $scope.item.pull_type !== null && $scope.item.pull_type !== undefined ? $scope.item.pull_type.id : null;
                $scope.redila = $scope.item.redila_type !== null && $scope.item.redila_type !== undefined ? $scope.item.redila_type.id : null;
                $scope.roof = $scope.item.roof_type !== null && $scope.item.roof_type !== undefined ? $scope.item.roof_type.id : null;
                $scope.suspension = $scope.item.suspension_type !== null && $scope.item.suspension_type !== undefined ? $scope.item.suspension_type.id : null;
                $scope.turn = $scope.item.turn_type !== null && $scope.item.turn_type !== undefined ? $scope.item.turn_type.id : null;
                $scope.brand = $scope.item.brand !== null && $scope.item.brand !== undefined ? $scope.item.brand.id : null;




                $scope.get_trailer($scope.trailer);

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_department = function () {
        $http({
            url: '/departments_by_branch/' + $scope.branch.id + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.departments = response.data;
            $scope.consignee = response.data.manager;
            $scope.branch    = response.data.branch;
            $scope.fleet_cost = $scope.branch.fleet_cost ;
            $scope.full_name = $scope.consignee ? $scope.consignee.first_name + ' ' + $scope.consignee.last_name : 'Sin Gerente' ;
        });

    };

    $scope.get_all_department = function () {
        $http({
            url: '/all_departments_by_branch/' + $scope.branch.id + '.json',
            method: 'GET'
        }).then(function (response) {
            $scope.departments = response.data;
            $scope.consignee = response.data.manager;
            $scope.branch = $scope.departments[0].branch;
            $scope.fleet_cost = $scope.branch.fleet_cost ;
            $scope.full_name = $scope.consignee ? $scope.consignee.first_name + ' ' + $scope.consignee.last_name : 'Sin Gerente' ;
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
            });

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
            $scope.ramps_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_redilas = function () {
        $http({
            method: 'GET',
            url: '/redila_types.json'
        }).then(function successCallback(response) {
            $scope.redilas_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_capacities = function () {
        $http({
            method: 'GET',
            url: '/capacities.json'
        }).then(function successCallback(response) {
            $scope.capacities_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_floors = function () {
        $http({
            method: 'GET',
            url: '/floor_types.json'
        }).then(function successCallback(response) {
            $scope.floors_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_widths = function () {
        $http({
            method: 'GET',
            url: '/trailer_widths.json'
        }).then(function successCallback(response) {
            $scope.widths_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_lengths = function () {
        $http({
            method: 'GET',
            url: '/trailer_lengths.json'
        }).then(function successCallback(response) {
            $scope.lengths_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_brakes = function () {
        $http({
            method: 'GET',
            url: '/brake_types.json'
        }).then(function successCallback(response) {
            $scope.brakes_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_colors = function () {
        $http({
            method: 'GET',
            url: '/colors.json'
        }).then(function successCallback(response) {
            $scope.colors_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_divitions = function () {
        $http({
            method: 'GET',
            url: '/divition_types.json'
        }).then(function successCallback(response) {
            $scope.divitions_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_fenders = function () {
        $http({
            method: 'GET',
            url: '/fender_types.json'
        }).then(function successCallback(response) {
            $scope.fenders_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_hydraulic_jacks = function () {
        $http({
            method: 'GET',
            url: '/hydraulic_jacks.json'
        }).then(function successCallback(response) {
            $scope.hydraulic_jacks_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_pulls = function () {
        $http({
            method: 'GET',
            url: '/pull_types.json'
        }).then(function successCallback(response) {
            $scope.pulls_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_brands = function () {
        $http({
            method: 'GET',
            url: '/brands.json'
        }).then(function successCallback(response) {
            $scope.brands_all = response.data;
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
            $scope.roofs_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_suspensions = function () {
        $http({
            method: 'GET',
            url: '/suspension_types.json'
        }).then(function successCallback(response) {
            $scope.suspensions_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_turns = function () {
        $http({
            method: 'GET',
            url: '/turn_types.json'
        }).then(function successCallback(response) {
            $scope.turns_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };


    $scope.get_fiscal_vouchers = function () {
        $http({
            method: 'GET',
            url: '/fiscal_vouchers.json'
        }).then(function successCallback(response) {
            $scope.fiscal_vouchers_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

    $scope.get_clients = function () {
        $http({
            method: 'GET',
            url: '/clients.json'
        }).then(function successCallback(response) {
            $scope.clients_all = response.data;
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

        $scope.ramps = [];
        $scope.redilas = [];
        $scope.capacities = [];
        $scope.floors = [];
        $scope.widths = [];
        $scope.lengths = [];
        $scope.brakes = [];
        $scope.colors = [];
        $scope.divitions = [];
        $scope.fenders = [];
        $scope.hydraulic_jacks = [];
        $scope.pulls = [];
        $scope.brands = [];
        $scope.roofs = [];
        $scope.suspensions = [];
        $scope.turns = [];
        $http({
            url: '/trailer_types/' + trailer + '.json',
            method: 'GET'
        }).then(function (response) {
            if (response.data != null) {
                $scope.model_name = response.data.model_part;
                $scope.trailer_obj = response.data;


                $scope.trailer=$scope.trailer_obj.id;



                var fill_selects = new Promise((resolve, reject) => {
                    angular.forEach($scope.trailer_obj.trailer_categories, function(cat, catkey) {

                        switch (cat['key']) {
                            case 'trailer_length_id':
                                var length = $scope.lengths_all.find(x => x.id === cat[cat.key]);
                                $scope.lengths.push(length);
                                break;
                            case 'ramp_type_id':
                                var ramp_type = $scope.ramps_all.find(x => x.id === cat[cat.key]);
                                $scope.ramps.push(ramp_type);
                                break;
                            case 'redila_type_id':
                                var redila = $scope.redilas_all.find(x => x.id === cat[cat.key]);
                                $scope.redilas.push(redila);
                                break;
                            case 'floor_type_id':
                                var floor = $scope.floors_all.find(x => x['id'] === cat[cat.key]);
                                $scope.floors.push(floor);
                                break;
                            case 'capacity_id':
                                var capacity = $scope.capacities_all.find(x => x.id === cat[cat.key]);
                                $scope.capacities.push(capacity);
                                break;
                            case 'trailer_width_id':
                                var width = $scope.widths_all.find(x => x.id === cat[cat.key]);
                                $scope.widths.push(width);
                                break;
                            case 'color_id':
                                var color = $scope.colors_all.find(x => x.id === cat[cat.key]);
                                $scope.colors.push(color);
                                break;
                            case 'hydraulic_jack_id':
                                var hydraulic_jack = $scope.hydraulic_jacks_all.find(x => x.id === cat[cat.key]);
                                $scope.hydraulic_jacks.push(hydraulic_jack);
                                break;
                            case 'pull_type_id':
                                var pull = $scope.pulls_all.find(x => x.id === cat[cat.key]);
                                $scope.pulls.push(pull);
                                break;
                            case 'brake_type_id':
                                var brake = $scope.brakes_all.find(x => x.id === cat[cat.key]);
                                $scope.brakes.push(brake);
                                break;
                            case 'brand_id':
                                var brand = $scope.brands_all.find(x => x.id === cat[cat.key]);
                                $scope.brands.push(brand);
                                break;
                            case 'fender_type_id':
                                var fender = $scope.fenders_all.find(x => x.id === cat[cat.key]);
                                $scope.fenders.push(fender);
                                break;
                            case 'turn_type_id':
                                var turn = $scope.turns_all.find(x => x.id === cat[cat.key]);
                                $scope.turns.push(turn);
                                break;
                            case 'divition_type_id':
                                var divition = $scope.divitions_all.find(x => x.id === cat[cat.key]);
                                $scope.divitions.push(divition);
                                break;
                            case 'suspension_type_id':
                                var suspension = $scope.suspensions_all.find(x => x.id === cat[cat.key]);
                                $scope.suspensions.push(suspension);
                                break;
                            case 'roof_type_id':
                                var roof = $scope.roofs_all.find(x => x.id === cat[cat.key]);
                                $scope.roofs.push(roof);
                                break;
                            default:
                                console.log('Lo lamentamos, por el momento no disponemos');
                        }



                        if (catkey === $scope.trailer_obj.trailer_categories.length -1) resolve();



                    });
                });
                fill_selects.then(() => {
                    if(!$scope.model){
                        $scope.set_model($scope.item);
                    }else{
                        $scope.set_model($scope.model);
                    }

                    // $scope.generate_model();
                });

            }

        });
    };


    $scope.get_model = function (trailer) {
        if (trailer) {
            $http({
                url: '/trailers/' + trailer + '.json',
                method: 'GET'
            }).then(function (response) {
                if (response.data != null) {
                    $scope.model = response.data;
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
                fiscal_vouchers: $scope.fiscal_vouchers_all,
                clients: $scope.clients_all
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
    $scope.show_percentage = function (id, current_user, user_branch) {
        ModalService.showModal({
            templateUrl: 'modal_percentage.html',
            controller: "ModalPercentageController as modal",
            inputs: {
                id: id,
                current_user: current_user,
                user_branch: user_branch
            }
        }).then(function (modal) {
            modal.element.modal();
            modal.close.then(function (sale_detail) {

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
}]);
;


app.controller('ModalVentaController', ['$scope', 'close', 'Upload', '$http', 'item', 'fiscal_vouchers', 'clients', '$timeout',
    function ($scope, close, Upload, $http, item, fiscal_vouchers, clients, $timeout) {


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
            2: {id: 3, type: 'Transferencia'},
            4: {id: 4, type: 'Crédito'}
        };


        $scope.uploadSell = function (status) {

            angular.forEach(status, function (stats) {
                if (stats.key === 'vendido') {
                    status_vendido = stats.id;

                } else if (stats.key === 'pendiente_factura') {
                    status_pendiente_factura = stats.id;
                } else if (stats.key === 'vendido_credito') {
                    status_credito = stats.id;
                }


            });


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
                    if ($scope.item.payment_type === 4) {

                        $scope.item.image.upload = Upload.upload({
                            url: `/items/${$scope.item.id}.json`,
                            method: 'PUT',
                            //  data: {file: file}
                            data: {
                                item: {
                                    sale_price: $scope.item.sale_price,
                                    payment_type: $scope.item.payment_type,
                                    advance_payment: $scope.item.advance_payment,
                                    image: $scope.item.image,
                                    status_item_id: status_credito,
                                    branch_id: $scope.item.branch_id,
                                    department_id: $scope.item.department_id,
                                    user_id: $scope.item.user_id,
                                    purchased_date: new Date()
                                }
                            }
                        });
                        $scope.item.image.upload.then(function (response) {
                            // $timeout(function () {
                                $scope.item.image.result = response.data;
                                if (response.data) {
                                    swal({
                                        title: 'Vendido',
                                        text: 'El artículo ha sido Vendido correctamente.',
                                        type: 'success',
                                        showCancelButton: false
                                    }).then(function (isConfirm) {
                                        if (isConfirm) {
                                            location.reload();
                                        }

                                    }, function (iSConfirm) {

                                    });
                                    // $http({
                                    //     url: '/send_email/ ' + $scope.item.id + '.json',
                                    //     method: 'GET'
                                    // }).then(function (response) {
                                    //     if (response.data) {
                                    //         swal({
                                    //             title: 'Vendido',
                                    //             text: 'El artículo ha sido Vendido correctamente.',
                                    //             type: 'success',
                                    //             showCancelButton: false
                                    //         }).then(function (isConfirm) {
                                    //             if (isConfirm) {
                                    //                 location.reload();
                                    //             }
                                    //
                                    //         }, function (iSConfirm) {
                                    //
                                    //         });
                                    //     }
                                    // });

                                }
                            // });
                        }, function (response) {
                            if (response.status > 0)
                                $scope.errorMsg = response.status + ': ' + response.data;


                        }, function (evt) {
                            $scope.item.image.progress = Math.min(100, parseInt(100.0 *
                                evt.loaded / evt.total));
                        });
                    }else{
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
                                        user_id: $scope.item.user_id,
                                        purchased_date: new Date()
                                    }
                                }
                            });
                            $scope.item.image.upload.then(function (response) {
                                // $timeout(function () {
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
                                        // $http({
                                        //     url: '/send_email/ ' + $scope.item.id + '.json',
                                        //     method: 'GET'
                                        // }).then(function (response) {
                                        //     if (response.data) {
                                        //         swal({
                                        //             title: 'Vendido',
                                        //             text: 'El artículo ha sido Vendido correctamente. La factura esta en proceso',
                                        //             type: 'success',
                                        //             showCancelButton: false
                                        //         }).then(function (isConfirm) {
                                        //             if (isConfirm) {
                                        //                 location.reload();
                                        //             }
                                        //
                                        //         }, function (iSConfirm) {
                                        //
                                        //         });
                                        //     }
                                        // });

                                    }
                                // });
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
                                    // $http({
                                    //     url: '/send_email/ ' + $scope.item.id + '.json',
                                    //     method: 'GET'
                                    // }).then(function (response) {
                                    //     if (response.data) {
                                    //         swal({
                                    //             title: 'Vendido (Falta Comprobante)',
                                    //             text: 'El artículo ha sido Vendido y se facturara cuando se agregue el comprobante de pago',
                                    //             type: 'success',
                                    //             showCancelButton: false
                                    //         }).then(function (isConfirm) {
                                    //             if (isConfirm) {
                                    //                 location.reload();
                                    //             }
                                    //
                                    //         }, function (iSConfirm) {
                                    //
                                    //         });
                                    //     }
                                    // });
                                }
                            });
                        }
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
    function ($scope, close, Upload, $http, item, fiscal_vouchers, clients, $timeout) {


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

app.controller('ModalPercentageController', ['$scope', 'close', 'Upload', '$http', '$timeout', 'id', 'current_user',
    'user_branch', function ($scope, close, Upload, $http, $timeout, id, current_user, user_branch) {


        $scope.open = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope.opened = true;
        };

        $('input').change(function () {
            $(this).val(function (index, old) {
                return old.replace() + '%';
            });
        });

        // $scope.init = function () {
        //     $scope.disable_percentages = true;
        //     $http({
        //         url: '/items/' + id + '.json',
        //         method: 'GET'
        //     }).then(function (response) {
        //         $scope.seller_percentage = parseFloat(response.data.seller_percentage);
        //         $scope.planet_percentage = parseFloat(response.data.planet_percentage);
        //         $scope.branch_percentage = parseFloat(response.data.branch_percentage);
        //         $scope.is_same_branch = response.data.department_user.branch_id === response.data.branch_id ? true : false;
        //         $scope.validate_inputs_values();
        //     });
        // };
        //
        // $scope.init();

        $scope.close = function (result) {

            close(result, 500); // close, but give 500ms for bootstrap to animate
        };

        $scope.validate_inputs_values = function () {
            if ($scope.is_same_branch) {


                $scope.branch_percentage = 100 - parseFloat($scope.planet_percentage);
                if ($scope.branch_percentage) {
                    $scope.disable_percentages = false;
                }
            } else {

                rest_cuantity = 100 - parseFloat($scope.planet_percentage);

                $scope.branch_percentage = rest_cuantity / 2;
                $scope.seller_percentage = rest_cuantity / 2;

                if ($scope.branch_percentage && $scope.seller_percentage) {
                    $scope.disable_percentages = false;
                }


            }
        };

        $scope.validate_planet_percentage = function (value) {
            if (value > 99) {
                $scope.planet_percentage = 99;
            }
        };

        $scope.validate_branch_percentage = function (value) {

            if (value > 99) {
                $scope.branch_percentage = 99;
            }
        };
        $scope.validate_seller_percentage = function (value) {

            if (value > 99) {
                $scope.seller_percentage = 99;
            }
        };


        $scope.uploadPercentage = function () {
            swal({
                title: 'Espere un momento',
                text: 'Guardando',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                showConfirmButton: false,
                onOpen: function () {
                    swal.showLoading()
                }
            });

            $http({
                url: '/items/' + id + '.json',
                method: 'PUT',
                data: {
                    item: {
                        seller_percentage: $scope.seller_percentage,
                        planet_percentage: $scope.planet_percentage,
                        branch_percentage: $scope.branch_percentage
                    }
                }
            }).then(function (response) {
                swal({
                    title: 'Guardado',
                    text: 'Se han guardado los porcentajes',
                    type: 'success',
                    showCancelButton: false
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        location.reload();
                    }

                }, function (iSConfirm) {

                });
            });
        }


    }]);

