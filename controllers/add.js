var app = angular.module('adds',['account-module','app-module']);

app.controller('addsCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

