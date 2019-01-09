var app = angular.module('drops',['account-module','app-module']);

app.controller('dropsCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

