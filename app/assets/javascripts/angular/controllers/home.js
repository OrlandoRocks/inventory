app.controller('homeController',["$scope", "$http","ModalService", function($scope, $http, ModalService) {

    $scope.current_company = '';
    $scope.isGod = false;
    $scope.init = function (company, isGod){

        $scope.isGod = isGod;
        if(company || company == 0){

            $scope.current_company = company;
            // $scope.show();
        }
    };

    $scope.show = function() {


        console.log('current_company');
        console.log($scope.current_company);


        ModalService.showModal({
            templateUrl: 'modal_select_company.html',
            controller: "ModalSelectCompanyController as modal",
            inputs:{
                company: $scope.current_company,
                is_god: $scope.isGod
            }
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(sale_detail) {
                
            });
        });
    };
    

}]);


app.controller('ModalSelectCompanyController', ['$scope','close' ,'$http', '$timeout', '$window', 'company','is_god',function($scope, close, $http, $timeout, $window, company, is_god) {

    $scope.all_option_company = {id:0, name:"TODAS LAS EMPRESAS"};


    if(company){
        console.log(company);
        $scope.company_selected = company;
    }else if(company==0){
        $scope.company_selected = $scope.all_option_company;
    }


    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();

        $scope.opened = true;
    };

    $scope.companies = [];

    console.log('company');
    console.log(company);

    $http({
        method: "GET",
        url: "/companies.json"
    }).then(function successCallback(response) {
        $scope.companies = response.data;
        if(is_god) {
            $scope.companies.push($scope.all_option_company);
        }
        console.log($scope.companies);

    }, function errorCallback(response) {
    });




    $scope.close = function(sale_detail) {

        close(sale_detail, 500); // close, but give 500ms for bootstrap to animate
    };
    
    
    $scope.setUserCompany = function (user) {
        console.log(user);

            $http({
                url: '/users/'+user,
                method: 'PUT',
                data: {user:{
                    current_company: $scope.company_selected.id
                }}
            }).then(function successCallback(response) {
                $scope.close($scope.payment);
                $window.location.reload();
                console.log("se armo el guiso!! :D");
            }, function errorCallback(response) {
                console.log("algo valio shit!! :(");
                $window.location.reload();
            });
    }
    
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
    



}]);