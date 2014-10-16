
//= require angular

'use strict';

/* App Module */


var dpollApp = angular.module('dpollApp', [
  'ngRoute',
  'ngResource',
  'eventControllers',
  'voteControllers'
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
      when('/event/:id/results', {
        templateUrl: 'assets/events/results.html',
        controller: 'EventResultsCtrl'
      }).
      when('/event/:eventId/vote/booth', {
        templateUrl: 'assets/votes/voting-booth.html',
        controller: 'VoteBoothCtrl'
      }).
      when('/event/:eventId/vote/response', {
        templateUrl: 'assets/votes/voting-response.html',
        controller: 'VoteResponseCtrl'
      }).
      otherwise({
        redirectTo: '/events'
      });
  }]);


