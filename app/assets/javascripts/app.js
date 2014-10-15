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
        templateUrl: 'partials/events-list.html',
        controller: 'EventListCtrl'
      }).
      when('/events/:id', {
        templateUrl: 'partials/event-detail.html',
        controller: 'EventDetailCtrl'
      }).
      when('/event/new', {
        templateUrl: 'partials/event-form.html',
        controller: 'EventNewCtrl'
      }).
      when('/event/:id/edit', {
        templateUrl: 'partials/event-form.html',
        controller: 'EventEditCtrl'
      }).
      when('/event/:id/destroy', {
        templateUrl: 'partials/events-list.html',
        controller: 'EventDestroyCtrl'
      }).
      otherwise({
        redirectTo: '/events'
      });
  }]);


