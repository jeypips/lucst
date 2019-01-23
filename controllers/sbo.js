var app = angular.module('sbos',['account-module','app-module']);

app.controller('sbosCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

