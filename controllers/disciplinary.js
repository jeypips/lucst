var app = angular.module('disciplinary',['account-module','app-module']);

app.controller('disciplinaryCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

