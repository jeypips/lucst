var app = angular.module('warning',['account-module','app-module']);

app.controller('warningCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

