var app = angular.module('maximum',['account-module','app-module']);

app.controller('maximumCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

