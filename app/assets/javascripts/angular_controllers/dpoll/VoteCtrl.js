//= require angular

var dpollApp = angular.module('dpoll', ['ngResource']);

dpollApp.factory("Vote", function ($resource) {
    return $resource("/events/:eventId/votes", {eventId: '@eventId'},
        {
            'create': { method: 'POST', params: {} }
        }
    );
});

dpollApp.controller('VoteCtrl', function ($scope, Vote) {

    $scope.onSuccess = function(vote_value) {
        if (vote_value === "Yes") {
            $scope.notification = 'Thank you for your feedback!';
        } else {
            $scope.notification = "I'm sorry this wasn't worth your time.  Thank you for your feedback anyway!";
        }
    };

    $scope.init = function (eventId) {
        $scope.eventId = eventId;
    };

    $scope.castVote = function (vote_value) {
        Vote.create({eventId: $scope.eventId},
                    {vote: vote_value},
                    $scope.onSuccess(vote_value));
    };
});
