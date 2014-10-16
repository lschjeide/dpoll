'use strict';

/* Controllers */

var eventControllers = angular.module('eventControllers', []);

dpollApp.factory("Event", function ($resource) {
    return $resource("/events/:id", {id: '@id'},
        {
            'create':  { method: 'POST' },
            'index':   { method: 'GET', isArray: true },
            'show':    { method: 'GET', isArray: false },
            'update':  { method: 'PUT' },
            'destroy': { method: 'DELETE' },
            'results': { method: 'GET', }
        }
    );
});

eventControllers.controller('EventResultsCtrl', ['$scope', '$http', '$routeParams', 'Event',
  function($scope, $http, $routeParams, Event) {
    var http_response = $http.get('/event/' + $routeParams.id + '/results');
    http_response.success(function(data, status, headers, config) {
        $scope.event = data;
    });
  }]);

eventControllers.controller('EventListCtrl', ['$scope', 'Event',
  function($scope, Event) {
    $scope.events = Event.index();
  }]);

eventControllers.controller('EventDetailCtrl', ['$scope', '$routeParams', 'Event',
  function($scope, $routeParams, Event) {
    $scope.event = Event.show($routeParams);
  }]);

eventControllers.controller('EventDestroyCtrl', ['$scope', '$location', '$routeParams', 'Event',
  function($scope, $location, $routeParams, Event) {
    $scope.event = Event.destroy($routeParams,
          function(data, status, headers, config) {
            $location.path( "/events" );
          }
    );
    
  }]);

eventControllers.controller('EventNewCtrl', ['$scope', '$filter', '$location', 'Event',
  function($scope, $filter, $location, Event) {
  	$scope.h1_value = 'Add';
  	$scope.hideSave = true;
  	$scope.hideEdit = false;
    $scope.addEvent = function(){
    	Event.create($scope.event,
          function(data, status, headers, config) {
            $location.path( "/events" );
          }
      );
    }
  }]);

eventControllers.controller('EventEditCtrl', ['$scope', '$filter', '$routeParams', '$location', 'Event',
  function($scope, $filter, $routeParams, $location, Event) {
  	$scope.h1_value = 'Edit';
  	$scope.hideSave = false;
  	$scope.hideEdit = true;
  	$scope.event = Event.show($routeParams);
    $scope.saveEvent = function(){
    	Event.update($scope.event,
          function(data, status, headers, config) {
            $location.path( "/events" );
          }
      );
    }
  }]);