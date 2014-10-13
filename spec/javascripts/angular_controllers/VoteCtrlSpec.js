#= require ../helpers/angular-mocks

'use strict';

describe('VoteCtrl', function () {

    var scope;
    var eventId = '4';

    beforeEach(module('dpoll'));

    beforeEach(inject(function ($rootScope, $controller, _$httpBackend_) {
        scope = $rootScope.$new();

        $controller('VoteCtrl', {
            $scope: scope
        });

        $httpBackend = _$httpBackend_;

        scope.init(eventId);
    }));

    describe('#init', function () {

        it('populates event id', function () {
            expect(scope.eventId).toEqual(eventId);
        });
    });

    describe('#castVote', function () {

        beforeEach(function () {
            scope.init(eventId);
        });

        it('creates a yes vote', function () {
            var vote = 'Yes';
            scope.castVote(vote);

            $httpBackend.expectPOST('/events/' + scope.eventId + '/votes/new', {'vote': vote}).respond(200);
            $httpBackend.flush();
            expect(scope.notification).toEqual('Thank you for your feedback!');
        });

        it('creates a no vote', function () {
            var vote = 'No';
            scope.castVote(vote);

            $httpBackend.expectPOST('/events/' + scope.eventId + '/votes/new', {'vote': vote}).respond(200);
            $httpBackend.flush();
            expect(scope.notification).toEqual("I'm sorry this wasn't worth your time.  Thank you for your feedback anyway!");
        });
    });
});
