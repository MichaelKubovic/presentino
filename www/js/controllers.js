angular.module('app.controllers', [])
     
.controller('searchPresentCtrl', ['$scope', '$stateParams', '$state', '$ionicHistory', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams, $state, $ionicHistory) {
	$scope.form = {
		submitting: false
	}
	$scope.search = {
		holiday: '',
		age: '',
		gender: '',
	}

	$scope.messages = [];

	$scope.submit = function(search) {
		$scope.form.submitting = true;
		$scope.messages.push('Form has been submitted');
		setTimeout(function() {
			$state.go('searchResults', {relative: $state.$current});
		}, 2000)
	}

}])
   
.controller('historyCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])
   
.controller('searchResultsCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])

.controller('showPresentCtrl', ['$scope', '$stateParams', 
function($scope, $stateParams) {
	console.log('show');
}])