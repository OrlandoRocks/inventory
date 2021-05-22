/**
 * Created by orlando on 11/12/16.
 */
app.controller('trailerController',["$scope", "ModalService", "$http", function($scope, ModalService, $http) {


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

    $scope.init = function(trailer_is){
        $scope.model_name = '';

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


        if (trailer_is !== null && trailer_is !== undefined) {

            $scope.get_trailer_json(trailer_is);


        }

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

    $scope.get_reinforcements = function () {
        $http({
            method: 'GET',
            url: '/reinforcement_types.json'
        }).then(function successCallback(response) {
            $scope.reinforcements_all = response.data;
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });
    };

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


                    if($scope.trailer_model || !angular.equals($scope.trailer_model, {})){

                        $scope.set_model($scope.trailer_model);

                    }
                });

            }

        });
    };


    $scope.set_model = function (model) {
        $scope.model = model;

        console.log('$scope.model');
        console.log($scope.model);

        $scope.length = '';
        // $scope.trailer = '';
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


        // if (model.trailer_type) {
        //     $scope.trailer = model.trailer_type.id;
        //
        // }
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
        if ($scope.turn && $scope.turns.length !== 0) $scope.modelhs += $scope.turns.find(elem => elem.id === $scope.turn).model_part;
        if ($scope.redila && $scope.redilas.length !== 0) $scope.modelhs += $scope.redilas.find(elem => elem.id === $scope.redila).model_part;
        if ($scope.roof && $scope.roofs.length !== 0) $scope.modelhs += $scope.roofs.find(elem => elem.id === $scope.roof).model_part;
        if ($scope.brake && $scope.brakes.length !== 0) $scope.modelhs += $scope.brakes.find(elem => elem.id === $scope.brake).model_part;
        if ($scope.color && $scope.colors.length !== 0) $scope.modelhs += $scope.colors.find(elem => elem.id === $scope.color).model_part;
        if ($scope.divition && $scope.divitions.length !== 0) $scope.modelhs += $scope.divitions.find(elem => elem.id === $scope.divition).model_part;
        if ($scope.fender && $scope.fenders.length !== 0) $scope.modelhs += $scope.fenders.find(elem => elem.id === $scope.fender).model_part;
        if ($scope.hydraulic_jack && $scope.hydraulic_jacks.length !== 0) $scope.modelhs += $scope.hydraulic_jacks.find(elem => elem.id === $scope.hydraulic_jack).model_part;
        if ($scope.pull && $scope.pulls.length !== 0) $scope.modelhs += $scope.pulls.find(elem => elem.id === $scope.pull).model_part;
        if ($scope.brand && $scope.brands.length !== 0) $scope.modelhs += $scope.brands.find(elem => elem.id === $scope.brand).model_part;
        // if ($scope.reinforcement && $scope.reinforcements)      $scope.modelhs   +=     $scope.reinforcements.find( elem => elem.id ===   $scope.reinforcement).model_part;
        if ($scope.suspension && $scope.suspensions.length !== 0) $scope.modelhs += $scope.suspensions.find(elem => elem.id === $scope.suspension).model_part;



        $scope.model_name = $scope.modelhs;

    };

    $scope.get_trailer_json =  function(id) {

        $http({
            method: 'GET',
            url: '/trailers/'+id+'.json'
        }).then(function successCallback(response) {

            console.log('Hola bebe');
            console.log(response.data);

            if (response.data != null) {
                $scope.trailer_model = response.data;


                $scope.trailer = $scope.trailer_model.trailer_type.id;
                $scope.brake = $scope.trailer_model.brake_type !== null && $scope.trailer_model.brake_type !== undefined ? $scope.trailer_model.brake_type.id : null;
                $scope.width = $scope.trailer_model.trailer_width !== null && $scope.trailer_model.trailer_width !== undefined ? $scope.trailer_model.trailer_width.id : null;
                $scope.color = $scope.trailer_model.color !== null && $scope.trailer_model.color !== undefined ? $scope.trailer_model.color.id : null;
                $scope.length = $scope.trailer_model.trailer_length !== null && $scope.trailer_model.trailer_length !== undefined ? $scope.trailer_model.trailer_length.id : null;
                $scope.divition = $scope.trailer_model.divition_type !== null && $scope.trailer_model.divition_type !== undefined ? $scope.trailer_model.divition_type.id : null;
                $scope.floor = $scope.trailer_model.floor_type !== null && $scope.trailer_model.floor_type !== undefined ? $scope.trailer_model.floor_type.id : null;
                $scope.fender = $scope.trailer_model.fender_type !== null && $scope.trailer_model.fender_type !== undefined ? $scope.trailer_model.fender_type.id : null;
                $scope.ramp = $scope.trailer_model.ramp_type !== null && $scope.trailer_model.ramp_type !== undefined ? $scope.trailer_model.ramp_type.id : null;
                $scope.hydraulic_jack = $scope.trailer_model.hydraulic_jack !== null && $scope.trailer_model.hydraulic_jack !== undefined ?  $scope.trailer_model.hydraulic_jack.id : null;
                $scope.capacity = $scope.trailer_model.capacity !== null && $scope.trailer_model.capacity !== undefined ? $scope.trailer_model.capacity.id : null;
                $scope.pull = $scope.trailer_model.pull_type !== null && $scope.trailer_model.pull_type !== undefined ? $scope.trailer_model.pull_type.id : null;
                $scope.redila = $scope.trailer_model.redila_type !== null && $scope.trailer_model.redila_type !== undefined ? $scope.trailer_model.redila_type.id : null;
                $scope.roof = $scope.trailer_model.roof_type !== null && $scope.trailer_model.roof_type !== undefined ? $scope.trailer_model.roof_type.id : null;
                $scope.suspension = $scope.trailer_model.suspension_type !== null && $scope.trailer_model.suspension_type !== undefined ? $scope.trailer_model.suspension_type.id : null;
                $scope.turn = $scope.trailer_model.turn_type !== null && $scope.trailer_model.turn_type !== undefined ? $scope.trailer_model.turn_type.id : null;
                $scope.brand = $scope.trailer_model.brand !== null && $scope.trailer_model.brand !== undefined ? $scope.trailer_model.brand.id : null;


                $scope.get_trailer($scope.trailer);

            }
        }, function errorCallback(response) {
            console.log("Algo valio shit!");
        });

    };




}]);




    

