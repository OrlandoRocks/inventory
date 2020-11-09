/**
 * Created by orlando on 11/12/16.
 */
app.controller('itemController', ["$scope", "ModalService", "$http", function ($scope, ModalService, $http) {


    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        language: "es"
    });

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
        $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();

        if (item !== null && item !== undefined) {

            $scope.get_item_json(item);

        }

    };

    $scope.init_order = function (item_id, users) {
        $scope.users = users;
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
        $scope.get_reinforcements();
        $scope.get_roofs();
        $scope.get_suspensions();
        $scope.get_turns();

        if (item_id) {
            $scope.get_orders(item_id);
        }
    };


    $scope.generate_model = function(model_part){
        $scope.model_name += model_part;
    };



    $scope.get_item_json = function (id) {

        $http({
            method: 'GET',
            url: '/items/' + id + '.json'
        }).then(function successCallback(response) {

            if (response.data != null) {
                $scope.item = response.data;
                $scope.branch = $scope.item.branch_id;
                $scope.length = $scope.item.trailer_length;
                $scope.width = $scope.item.trailer_width;
                $scope.floor = $scope.item.floor_type;
                $scope.ramp = $scope.item.ramp_type;
                $scope.capacity = $scope.item.capacity;
                $scope.redila = $scope.item.redila_type;
                // $scope.trailer = $scope.item.trailer;
                if ($scope.branch !== null) {
                    $scope.get_department();
                }
                if ($scope.item.status_shipping_id === 1) {
                    $scope.branch = $scope.item.department_user.branch_id;
                    $scope.get_department();
                }
                $scope.get_subcategories();
                $scope.get_trailer($scope.item.trailer_type_id);
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
                $scope.length = $scope.item.trailer_length;
                $scope.width = $scope.item.trailer_width;
                $scope.floor = $scope.item.floor_type;
                $scope.ramp = $scope.item.ramp_type;
                $scope.capacity = $scope.item.capacity;
                $scope.redila = $scope.item.redila_type;
                $scope.user = parseInt($scope.item.user_id);
                $scope.trailer = $scope.item.trailer_id;
                $scope.get_trailer($scope.item.trailer_type_id);
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

    $scope.get_reinforcements = function () {
        $http({
            method: 'GET',
            url: '/reinforcement_types.json'
        }).then(function successCallback(response) {
            $scope.reinforcements = response.data;
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

