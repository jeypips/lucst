var app = angular.module('semestral',['account-module','app-module']);

app.controller('semestralCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

