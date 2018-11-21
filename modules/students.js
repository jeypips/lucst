angular.module('app-module', ['bootstrap-modal','ui.bootstrap','block-ui','bootstrap-growl','snapshot-module']).factory('app', function($http,$timeout,$compile,bui,growl,bootstrapModal,snapshot) {

	function app() {
		
		function getAge(dateString) { //Autocompute birthday to age
			var today = new Date();
			var birthDate = new Date(dateString);
			var age = today.getFullYear() - birthDate.getFullYear();
			var m = today.getMonth() - birthDate.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
				age--;
			}
			return age;
		};

		var self = this;

		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-dark" title="Loading" disabled><i class="fa fa-spinner fa-spin"></i>&nbsp; Please wait...</button></div>';		

		self.data = function(scope) {
			
			scope.snapshot = snapshot;
			
			scope.pictures = {
				front: null
			};
			
			scope.formHolder = {};
			
			scope.btns = {
				ok: { btn: false, label: 'Save'},
				cancel: { btn: false, label: 'Cancel'},
			};
			
			scope.student = {};
			scope.student.id = 0;			
			
			scope.students = []; //list
			
		};
		
		function courses(scope) {
			
			$http({
				method: 'POST',
				url: 'api/suggestions/courses.php'
			}).then(function mySucces(response) {
				
				scope.courses = response.data;
				
			},function myError(response) {
				
			});	
			
		};
		
		function validate(scope) {
			
			var controls = scope.formHolder.student.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.student.$invalid;
			
		};
		
		function mode(scope,row) {
			
			if (row == null) {
				scope.btns.ok.label = 'Save';
				scope.btns.ok.btn = false;
				scope.btns.cancel.label = 'Cancel';
				scope.btns.cancel.btn = false;
			} else {
				scope.btns.ok.label = 'Update';
				scope.btns.cancel.label = 'Close';
				scope.btns.ok.btn = true;
			}
			
		};
		
		self.list = function(scope) {
			
			bui.show();
			
			if (scope.$id > 2) scope = scope.$parent;			
			
			scope.student = {};
			scope.student.id = 0;						
			
			$http({
			  method: 'POST',
			  url: 'handlers/enrollment/list.php'
			}).then(function success(response) {
				
				scope.students = angular.copy(response.data);
				
				bui.hide();
				
			}, function error(response) {
				
				bui.hide();

			});			
			
			$('#content').html(loading);
			$('#content').load('lists/enrollment.html', function() {
				$timeout(function() { $compile($('#content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#students').DataTable({
						"ordering": false
					});	
				},200);
				
			});		
			
		};
		
		self.student = function(scope,row) {			

			scope.student = {};
			scope.student.id = 0;

			bui.show();

			mode(scope,row);
			
			courses(scope);
			scope.student.date_of_enrollment = new Date();
			
			$('#content').load('forms/enrollment.html',function() {
				$timeout(function() {
					
					$compile($('#content')[0])(scope);
					
					if (row != null) {
						
						$http({
						  method: 'POST',
						  url: 'handlers/enrollment/view.php',
						  data: {id: row.id}
						}).then(function success(response) {

							scope.student = angular.copy(response.data);
							scope.student.dob = new Date(response.data.dob);
							scope.student.date_of_enrollment = new Date(response.data.date_of_enrollment);
							
							angular.forEach(scope.pictures, function(item,i) { console.log(i);
								var photo = 'pictures/'+scope.student.id+'_'+i+'.png';
								var view = document.getElementById(i+'_picture');
								console.log(photo);
								if (imageExists(photo)) view.setAttribute('src', photo);
								else view.setAttribute('src', 'pictures/avatar.png');
							});
							
							bui.hide();
							
						}, function error(response) {
							
							bui.hide();				
							
						});
						
					} else {
						
						scope.student = {};
						scope.student.id = 0;
						
					};
					
					bui.hide();
					
				}, 500);
			});						
			
		};
		
		self.cancel = function(scope) {			
			
			scope.student = {};
			scope.student.id = 0;			
			
			self.list(scope);
			
		};
		
		self.edit = function(scope) {
			
			scope.btns.ok.btn = !scope.btns.ok.btn;
			
		};
		
		self.save = function(scope) {

			if (validate(scope)) {
				growl.show('btn btn-danger',{from: 'top', amount: 55},'Some fields are required');				
				return;
			};

			$http({
			  method: 'POST',
			  url: 'handlers/enrollment/save.php',
			  data: {student: scope.student}
			}).then(function success(response) {
				
				bui.hide();
				if (scope.student.id == 0) growl.show('btn btn-success',{from: 'top', amount: 55},'New student info successfully added');				
				else growl.show('btn btn-success',{from: 'top', amount: 55},'Student info successfully updated');				
				mode(scope,scope.student);								
				snapshot.upload(scope);
				
			}, function error(response) {
				
				bui.hide();				
				
			});				
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				if (scope.$id > 2) scope = scope.$parent;			
				
				$http({
				  method: 'POST',
				  url: 'handlers/enrollment/delete.php',
				  data: {id: [row.id]}
				}).then(function mySucces(response) {

					self.list(scope);
					
					growl.show('btn btn-danger',{from: 'top', amount: 55},'Student info successfully deleted.');
					
				}, function myError(response) {
					 
				  // error
					
				});

			};

			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});
				
		};
		
		self.dob = function(scope) {
			
			if (scope.student.dob == null) return;
			scope.student.age = getAge(scope.student.dob); //for birthday autocompute

		};
		
	};
	
	return new app();
	
});