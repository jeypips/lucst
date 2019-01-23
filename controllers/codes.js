var app = angular.module('codes',['account-module','app-module']);

app.controller('codesCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

