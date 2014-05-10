class @LoginController extends RouteController
    onBeforeAction: ->
        if not Meteor.user()
            @redirect 'home'