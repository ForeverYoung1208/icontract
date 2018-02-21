# Icontract

Icontract is the system to maintain corporative contracts and to remind users to do actions according to contracts.



In further, i'll cover next readme totics:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


1) before all you need to 
install tm2 (at least create development database for tm2 with users table) ....
install redis server....

2) create database for icontract:
git pull
mysql -> create users, grant permissions to dev, test, prod
rails create database
rails migrate
rails seed

3) start rails / passenger server and resque worker
rvmsudo passenger start
RAILS_ENV=production PIDFILE=./resque.pid BACKGROUND=yes QUEUE=* rake resque:work

4) in the app, login as admin and start minitoring process:
	at sessions/index page press 
	<pre> Запустити процесс MorningCheckJob. Увага! Запускати тількі один раз!
	  <button onclick="startMorningCheckJob()">startMorningCheckJob()</button>
	</pre>


5) when need, clean redis database:
redis-cli
FLUSHALL

6)if need, check active workers:
resque list

7)if need, check activejob /jobs

