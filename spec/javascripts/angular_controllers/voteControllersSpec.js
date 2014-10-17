#= require ../helpers/angular-mocks

'use strict';

describe("voteControllers module", function() {
    beforeEach(module("dpollApp"));
    beforeEach(module("voteControllers"));

    describe("VoteBoothCtrl", function() {
        var scope, controller;

        beforeEach(inject(function (_$httpBackend_, $routeParams, $rootScope, _$location_, $controller) {
            scope = $rootScope.$new();
            $routeParams.eventId = 3;
            $httpBackend = _$httpBackend_;
            $location = _$location_;
            controller = $controller("VoteBoothCtrl", {$scope: scope});
            
        }));

        it("should assign eventId", function () {
            expect(scope.eventId).toBe(3);
        });

        it ('creates a yes vote', function () {
            var vote = 'Yes';
            scope.castVote(vote);

            $httpBackend.expectPOST('/events/' + scope.eventId + '/votes', {'vote': vote}).respond({id: 32});
            $httpBackend.flush();

            expect($location.path()).toBe ("/event/3/vote/32/response");
        });

        it ('creates a no vote', function () {
            var vote = 'No';
            scope.castVote(vote);

            $httpBackend.expectPOST('/events/' + scope.eventId + '/votes', {'vote': vote}).respond({id: 34});
            $httpBackend.flush();

            expect($location.path()).toBe ("/event/3/vote/34/response");
        });

    });

    describe("VoteResponseCtrl", function() {
        var scope, controller, routeParams;

        beforeEach(inject(function (_$httpBackend_, $routeParams, $rootScope, $controller) {
            scope = $rootScope.$new();
            $routeParams.eventId = 6;
            $routeParams.id = 99;
            routeParams = $routeParams;
            $httpBackend = _$httpBackend_;
            controller = $controller("VoteResponseCtrl", {$scope: scope});
            
        }));

        it("should assign eventId", function () {
            expect(scope.eventId).toBe(6);
        });

        it ('Apologizes and thanks them anyway', function () {
            var vote = 'No';
            $httpBackend.expectGET('/events/' + scope.eventId + '/votes/'+ routeParams.id).respond({id: 99, vote: vote});
            $httpBackend.flush();

            expect(scope.response).toBe ("I'm sorry this wasn't worth your time.  Thank you for your feedback anyway!");
        });

        it ('Thanks them', function () {
            var vote = 'Yes';
            $httpBackend.expectGET('/events/' + scope.eventId + '/votes/'+ routeParams.id).respond({id: 99, vote: vote});
            $httpBackend.flush();

            expect(scope.response).toBe ("Thank you for your feedback!");
        });

    });

});