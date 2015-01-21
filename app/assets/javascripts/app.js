var hazardsApp = angular.module('Hazards', []);

hazardsApp.controller('newIncidentController', function ($scope) {
    'use strict';
    var $ = angular.element;

    $scope.hideAddTime = true;

    $('#tags_selector').select2();

    $('#incident_district_id').select2();
    $('#incident_incident_type').select2();

    $scope.toggleAddTime = function () {
        $scope.hideAddTime = !$scope.hideAddTime
    };

    $scope.toggleUnknown = function ($event, field) {
        var elementId = "#incident_".concat(field);

        if ($($event.target).prop('checked')){
            $(elementId).val('-1').prop('disabled', true);
        } else {
            $(elementId).val('').prop('disabled', false);

        }


    }


});