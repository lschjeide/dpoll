'use strict';

/* Controllers */

var dpollControllers = angular.module('dpollControllers', []);

dpollApp.factory("Event", function ($resource) {
    return $resource("/events/:id", {id: '@id'},
        {
            'create':  { method: 'POST' },
            'index':   { method: 'GET', isArray: true },
            'show':    { method: 'GET', isArray: false },
            'update':  { method: 'PUT' },
            'destroy': { method: 'DELETE' }
        }
    );
});

dpollControllers.controller('EventListCtrl', ['$scope', 'Event',
  function($scope, Event) {
    $scope.events = Event.index();
  }]);

dpollControllers.controller('EventDetailCtrl', ['$scope', '$routeParams', 'Event',
  function($scope, $routeParams, Event) {
    $scope.event = Event.show($routeParams);
  }]);

dpollControllers.controller('EventDestroyCtrl', ['$scope', '$location', '$routeParams', 'Event',
  function($scope, $location, $routeParams, Event) {
    $scope.event = Event.destroy($routeParams);
    $location.path( "/events" );
  }]);

dpollControllers.controller('EventNewCtrl', ['$scope', '$filter', '$location', 'Event',
  function($scope, $filter, $location, Event) {
  	$scope.h1_value = 'Add';
  	$scope.hideSave = true;
  	$scope.hideEdit = false;
    var x = Date.now();
    $scope.event_date = $filter('date')(x, 'yyyy-MM-dd');
    $scope.addEvent = function(){
    	Event.create($scope.event);
    	$location.path( "/events" );
    }
  }]);

dpollControllers.controller('EventEditCtrl', ['$scope', '$filter', '$routeParams', '$location', 'Event',
  function($scope, $filter, $routeParams, $location, Event) {
  	$scope.h1_value = 'Edit';
  	$scope.hideSave = false;
  	$scope.hideEdit = true;
  	$scope.event = Event.show($routeParams);
    $scope.event.event_date = $filter('date')($scope.event.event_date, 'yyyy-MM-dd');
    $scope.saveEvent = function(){
    	Event.update($scope.event);
    	$location.path( "/events" );
    }
  }]);