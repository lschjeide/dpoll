'use strict';

/* App Module */


var dpollApp = angular.module('dpollApp', [
  'ngRoute',
  'ngResource',
  'dpollControllers'
]);

dpollApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/events', {
        templateUrl: 'assets/events/events-list.html',
        controller: 'EventListCtrl'
      }).
      when('/events/:id', {
        templateUrl: 'assets/events/event-detail.html',
        controller: 'EventDetailCtrl'
      }).
      when('/event/new', {
        templateUrl: 'assets/events/event-form.html',
        controller: 'EventNewCtrl'
      }).
      when('/event/:id/edit', {
        templateUrl: 'assets/events/event-form.html',
        controller: 'EventEditCtrl'
      }).
      when('/event/:id/destroy', {
        templateUrl: 'assets/events/events-list.html',
        controller: 'EventDestroyCtrl'
      }).
      otherwise({
        redirectTo: '/events'
      });
  }]);


