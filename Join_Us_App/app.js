var mysql = require('mysql');
var express = require('express');
var app = express();
var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({extended: true}));
app.set("view engine","ejs");
app.use(express.static(__dirname+"/public"));

var connection = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'password',
	database : 'join_us'
});



app.get("/",function(req,res){
	var q = "SELECT COUNT(*) AS count FROM users";
	connection.query(q,function(error,results){
		if(error) throw error;
		var count = results[0].count;
		//res.send("We have "+count+" users in our db");
		res.render("home",{count:count});
	});
});

app.post("/register",function(req,res){
	//console.log("post request has been done to /register email is "+req.body.email);
	var person = {email : req.body.email};

	connection.query('INSERT INTO users SET ?',person,function(error,result){
		if(error) throw error;
		//res.send("Thanks for joining our waitlist");
		res.redirect("/");
	});
});

app.get("/joke",function(req,res){
	var joke = "<strong>What do you call a dog that does magic tricks?</strong><em> A labracadabrodor.</em>";
	console.log("Requested te joke");
	res.send(joke);
});

app.get("/random_num",function(req,res){
	var num = Math.floor(Math.random()*10)+1;
	res.send("your lucky number is "+num);
})


app.listen(8080,function(){
	console.log("Server running on 8080!");
});
