var connect  = require('connect');
var server   = require('express').createServer();
var mongoose = require('mongoose');

var UserSchema     = new mongoose.Schema({});
var PostcodeSchema = new mongoose.Schema({});

var User     = mongoose.model('User', PostcodeSchema);
var Postcode = mongoose.model('Postcode', PostcodeSchema);

function authorize(username, password, callback) {
  User.find({ key: username, secret: password }, function (err, user) {
    callback(err, user.shift());
  });
};

server.configure(function() {
  server.use(connect.basicAuth(authorize));
  server.use(server.router);
});

mongoose.connect('mongodb://localhost/api');

server.get('/postcodes/:code', function(req, res, next) {
  Postcode.find({ code: req.params.code }, function (err, postcode){
    if(postcode.length > 0) {      
      res.send(postcode.shift());
    } else {
      res.send("", 404)
    }
  });
});

server.listen(8080);