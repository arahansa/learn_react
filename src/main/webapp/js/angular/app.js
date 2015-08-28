// app.js

// define our application and pull in ngRoute and ngAnimate
var app = angular.module('testApp', ['ngRoute']);

// ROUTING ===============================================
// set our routing for this application
// each route will pull in a different controller
app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            //templateUrl: '/angular/template/formBoardWrite.html',
            controller: 'replyController'
        }).when('/about', {
            templateUrl: '/angular/template/page-about.html',
            controller: 'aboutController'
        }).when('/contact', {
            templateUrl: '/angular/template/page-contact.html',
            controller: 'contactController'
        });
});






// CONTROLLERS ============================================
// home page controller
app.controller('mainController', function($scope) {
    $scope.pageClass = 'page-home';
});

// about page controller
app.controller('aboutController', function($scope) {
    $scope.pageClass = 'page-about';
});

// contact page controller
app.controller('contactController', function($scope) {
    $scope.pageClass = 'page-contact';
});