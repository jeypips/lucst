var app = angular.module('religion',['account-module','app-module']);

app.controller('religionCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

