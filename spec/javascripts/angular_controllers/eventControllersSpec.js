#= require ../helpers/angular-mocks

'use strict';

describe("eventControllers module", function() {
    beforeEach(module("dpollApp"));
    beforeEach(module("eventControllers"));

    describe("EventResultsCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $routeParams, $rootScope, _$http_, _$location_, $controller) {
            scope = $rootScope.$new();
            $routeParams.eventId = 3;
            $httpBackend = _$httpBackend_;
            $http = _$http_;
            $location = _$location_;
            controller = $controller("EventResultsCtrl", {$scope: scope});
            
        }));

        it("get the results", function () {
            $httpBackend.expectGET('/event/' + scope.eventId + '/results').respond({"id":3,"name":"ergerg","description":"ergerg","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:00:48.000Z","updated_at":"2014-10-16T05:00:48.000Z","num_yeses":26,"num_nos":2});
            $httpBackend.flush();

            expect(scope.event.num_nos).toBe (2);

            expect(scope.event.num_yeses).toBe (26);
        });
    });

    describe("EventListCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $rootScope, $controller) {
            scope = $rootScope.$new();
            controller = $controller("EventListCtrl", {$scope: scope});
            $httpBackend = _$httpBackend_;
        }));

        it("get the event list", function () {
            $httpBackend.expectGET('/events').respond([{"id":81,"name":"ergerg","description":"ergerg","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:00:48.000Z","updated_at":"2014-10-16T05:00:48.000Z"},{"id":82,"name":"egrerg","description":"ergerg","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:01:01.000Z","updated_at":"2014-10-16T05:01:01.000Z"},{"id":83,"name":"adfsf","description":"sdvsd","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:08:42.000Z","updated_at":"2014-10-16T05:08:42.000Z"},{"id":84,"name":"zxcvzzv","description":"zxcvzxcvz","event_date":"2014-10-24T00:00:00.000Z","created_at":"2014-10-16T05:08:54.000Z","updated_at":"2014-10-16T05:08:54.000Z"}]);
            $httpBackend.flush();

            expect(scope.events.length).toBe (4);
        });
    });

    describe("EventDetailCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $routeParams, $rootScope, $controller) {
            scope = $rootScope.$new();
            controller = $controller("EventDetailCtrl", {$scope: scope});
            $httpBackend = _$httpBackend_;
            $routeParams.eventId = 81;
        }));

        it("get the event list", function () {
            $httpBackend.expectGET('/events').respond({"id":81,"name":"ergerg","description":"ergerg","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:00:48.000Z","updated_at":"2014-10-16T05:00:48.000Z","pretty_event_date":"2014-10-22"});
            $httpBackend.flush();

            expect(scope.event.name).toBe ("ergerg");
        });
    });

    describe("EventDestroyCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, _$location_, $routeParams, $rootScope, $controller) {
            scope = $rootScope.$new();
            controller = $controller("EventDestroyCtrl", {$scope: scope});
            $httpBackend = _$httpBackend_;
            $location = _$location_;
            $routeParams.eventId = 81;
        }));

        it("get the event list", function () {
            $httpBackend.expectDELETE('/events').respond(200);
            $httpBackend.flush();

            expect($location.path()).toBe ("/events");
        });
    });

    describe("EventNewCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $rootScope, _$location_, $controller) {
            scope = $rootScope.$new();
            $httpBackend = _$httpBackend_;
            $location = _$location_;
            controller = $controller("EventNewCtrl", {$scope: scope});
            
        }));

        it ('adds an event', function () {
            scope.event = {name: "frog", description: "jumps and swims", pretty_event_date: "2014-10-01"};
            scope.addEvent();

            $httpBackend.expectPOST('/events').respond(200);
            $httpBackend.flush();

            expect($location.path()).toBe ("/events");
        });

    });

    describe("EventEditCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $routeParams, $rootScope, _$location_, $controller) {
            scope = $rootScope.$new();
            $httpBackend = _$httpBackend_;
            $routeParams.id = 81;
            $location = _$location_;
            controller = $controller("EventEditCtrl", {$scope: scope});

        }));

        it ('updates an event', function () {
            
            $httpBackend.expectGET('/events/81').respond({"id":81,"name":"ergerg","description":"ergerg","event_date":"2014-10-22T00:00:00.000Z","created_at":"2014-10-16T05:00:48.000Z","updated_at":"2014-10-16T05:00:48.000Z","pretty_event_date":"2014-10-22"});
            $httpBackend.flush();


            expect(scope.event.name).toBe ("ergerg");
            scope.saveEvent();

            $httpBackend.expectPUT('/events/81', scope.event).respond({id: 3, name: "froggy", description: "jumps and swims", pretty_event_date: "2014-10-01"});
            $httpBackend.flush();

            expect(scope.event.name).toBe ("froggy");

            expect($location.path()).toBe ("/events");
        });

    });


});