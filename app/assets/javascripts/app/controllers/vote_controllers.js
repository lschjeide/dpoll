var voteControllers = angular.module('voteControllers', []);

dpollApp.factory("Vote", function ($resource) {
    return $resource("/events/:eventId/votes/:id", {eventId: '@eventId', id: '@id'},
        {
            'show': { method: 'GET', isArray: false },
            'create': { method: 'POST', isArray: false, params: {} }
        }
    );
});

voteControllers.controller('VoteBoothCtrl', ['$scope', '$routeParams', '$location', 'Vote',
    function ($scope, $routeParams, $location, Vote) {

        $scope.eventId = $routeParams.eventId;

        $scope.castVote = function (vote_value) {
            Vote.create({eventId: $scope.eventId}, {vote: vote_value},
                function (data, status, headers, config) {
                    $location.path("/event/" + $scope.eventId + "/vote/" + data.id + "/response");
                }
            );

        };
    }]);

voteControllers.controller('VoteResponseCtrl', ['$scope', '$routeParams', 'Vote',
    function ($scope, $routeParams, Vote) {
        $scope.eventId = $routeParams.eventId;
        $scope.vote = Vote.show({eventId: $routeParams.eventId, id: $routeParams.id},
            function (data, status, headers, config) {
                if (data.vote === "Yes") {
                    $scope.response = 'Thank you for your feedback!';
                } else {
                    $scope.response = "I'm sorry this wasn't worth your time.  Thank you for your feedback anyway!";
                }
            }
        );


    }]);