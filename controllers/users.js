var app = angular.module('users',['account-module','app-module']);

app.controller('usersCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

