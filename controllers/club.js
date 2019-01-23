var app = angular.module('clubs',['account-module','app-module']);

app.controller('clubsCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

