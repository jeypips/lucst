angular.module('app-module', ['bootstrap-modal','ui.bootstrap','block-ui','bootstrap-growl']).factory('app', function($http,$timeout,$compile,bui,growl,bootstrapModal) {

	function app() {

		var self = this;

		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-dark" title="Loading" disabled><i class="fa fa-spinner fa-spin"></i>&nbsp; Please wait...</button></div>';		

		self.data = function(scope) {
			
			$timeout(function() {
				$http({ 
					method: 'POST',
					url: 'handlers/dashboard.php'
				}).then(function mySucces(response) {
					
					scope.dashboard = response.data;
					
				},function myError(response) {
					
				});
				
			}, 200);
			
		};
		
	};
	
	return new app();
	
});