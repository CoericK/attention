var express        = require('express'),
    bodyParser     = require('body-parser'),
    routes         = require('./backend');

var app = module.exports = express();

app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(__dirname + '/'));

app.get('/', routes.index);

app.listen(8080);
console.log('Magic happens on port 8080...');
