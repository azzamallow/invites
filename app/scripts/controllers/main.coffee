'use strict'

angular.module('invitesApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.invited = []
    $scope.options = [ 
      { name: 'Aaron Triantafyllidis', location: 'Melbourne, VIC', image: 'https://lh3.googleusercontent.com/-HWMq8MQyrxE/AAAAAAAAAAI/AAAAAAAAAAA/3hc3GAtigZY/photo.jpg?sz=100' },
      { name: 'Erik Jortikka', location: 'Melbourne, VIC', image: 'http://m3.licdn.com/mpr/pub/image-CbRM0Qi2fkVMHCv-WgMEyF1sZWg4LENSmbRXy1vnZT3XLrjzCbRXHS22Z3uELEBYlhBg/erik-jortikka.jpg' },
      { name: 'Nancy Payne', location: 'Melbourne, VIC', image: 'http://www.agl.com.au/about/PublishingImages/Executive%20Team/JaneThomas.jpg' },
      { name: 'Cherie Ashworth', location: 'Melbourne, VIC', image: 'http://www.xovain.com/files/styles/100_100sc/public/fields/jane%20mini%20bio.jpg' },
    ] 