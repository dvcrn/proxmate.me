'use strict'

angular.module('proxmatemeApp')
  .controller 'SupportCtrl', ['$scope', 'Page', '$sce', ($scope, Page, $sce) ->
    Page.setSection('donate')
    Page.setTitle('Donate to ProxMate')
    $scope.donationSteps = [3, 8, 13, 21, 34, 55]
    $scope.pickedDonationstep = 3
    $scope.isRecurring = false
    $scope.paypalButton = null

    $scope.pickDonationstep = (step) ->
      $scope.pickedDonationstep = step
      $scope.createPaypalbutton()

    $scope.changeRecurring = (type) ->
      $scope.isRecurring = type
      $scope.createPaypalbutton()

    $scope.createPaypalbutton = ->
      options = {
        amount: { value: $scope.pickedDonationstep },
        name: { value: "ProxMate donation" },
        currency_code: { value: "EUR" }
      }
      type = "donate"

      if $scope.isRecurring
        type = "subscribe"

        options.recurrence = { value: 1 }
        options.period = { value: "M" }
        options.src = { value: 1 }

      $scope.paypalHtml = PAYPAL.apps.ButtonFactory.create('paypal@proxmate.me', options, type)
      $scope.paypalButton = $sce.trustAsHtml $scope.paypalHtml.outerHTML
      return true

    $scope.createPaypalbutton()
    Page.finishLoading()

  ]
