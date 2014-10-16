var voteControllers = angular.module('voteControllers', []);

dpollApp.factory("Vote", function ($resource) {
    return $resource("/events/:eventId/votes", {eventId: '@eventId'},
        {
            'create': { method: 'POST', params: {} }
        }
    );
});

voteControllers.controller('VoteBoothCtrl', ['$scope', '$routeParams', '$location', 'Vote',
    function ($scope, $routeParams, $location, Vote) {

        $scope.eventId = $routeParams.eventId;

        $scope.castVote = function (vote_value) {

           Vote.create({eventId: $scope.eventId}, {vote: vote_value});
           $location.path( "/event/"+$scope.eventId+"/vote/response" );
        };
}]);

voteControllers.controller('VoteResponseCtrl', ['$scope','$routeParams', 'Vote', 
   function ($scope, $routeParams, Vote) { 
    $scope.eventId = $routeParams.eventId;
    if (Vote.vote === "Yes") {
        $scope.response = 'Thank you for your feedback!';
    } else {
        $scope.response = "I'm sorry this wasn't worth your time.  Thank you for your feedback anyway!";
    }
}]);