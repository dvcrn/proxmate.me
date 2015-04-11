'use strict'

describe 'Controller: SupportCtrl', () ->

  # load the controller's module
  beforeEach module 'proxmatemeApp'

  MainCtrl = {}
  scope = {}

  pageMethods = ['setTitle', 'setSection', 'finishLoading', 'setDescription', 'setImage', 'setPath']
  page = jasmine.createSpyObj('page', pageMethods)

  paypalSpy = {
    apps:
      ButtonFactory:
        create: jasmine.createSpy()
  }
  paypalSpy.apps.ButtonFactory.create.andReturn {
    innerHTML: 'foo'
  }

  window.PAYPAL = paypalSpy

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    sce = {
      trustAsHtml: (html) ->
        return html
    }
    MainCtrl = $controller 'SupportCtrl', {
      $scope: scope,
      Page: page,
      $sce: sce
    }

  it 'should change the page content correctly', () ->
    for pageMethod in pageMethods
      expect(page[pageMethod]).toHaveBeenCalled()

  it 'should attach available donation steps to scope', ->
    expect(scope.donationSteps).toEqual [3, 8, 13, 21, 34, 55]
    expect(scope.pickedDonationstep).toBe 3
    expect(scope.isRecurring).toBe false

  it 'should have a function to change the picked donationstep', ->
    expect(scope.pickedDonationstep).toBe 3
    scope.pickDonationstep(5)
    expect(scope.pickedDonationstep).toBe 5

  it 'should have a function to change the recurring donation type', ->
    expect(scope.isRecurring).toBe false
    scope.changeRecurring true
    expect(scope.isRecurring).toBe true

  it 'should create the paypal button when calling createPaypalbutton', ->
    scope.pickedDonationstep = 3
    scope.isRecurring = false

    scope.createPaypalbutton()
    expect(paypalSpy.apps.ButtonFactory.create).toHaveBeenCalledWith('paypal@proxmate.me', {
      amount: { value: 3 },
      name: { value: "ProxMate donation" },
      currency_code: { value: "EUR" }
    }, "donate")

    scope.pickedDonationstep = 5
    scope.isRecurring = true

    scope.createPaypalbutton()
    expect(paypalSpy.apps.ButtonFactory.create).toHaveBeenCalledWith('paypal@proxmate.me', {
      amount: { value: 5 },
      name: { value: "ProxMate donation" },
      currency_code: { value: "EUR" },
      recurrence: { value: 1 },
      period: { value: "M" }
      src: { value: 1 }
    }, "subscribe")

