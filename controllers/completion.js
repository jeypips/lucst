var app = angular.module('completions',['account-module','app-module']);

app.controller('completionsCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

