README.markdown
==

Bootstrap
--
[Twitter Bootstrap](http://twitter.github.com/bootstrap/scaffolding.html#fluidGridSystem)

Pow
--
cd ~/.pow
ln -s /Users/martin/Sites/goldenbyteconsulting-com goldenbyteconsulting-com
cd -
mkdir tmp
touch tmp/restart.txt

http://goldenbyteconsulting-com.dev

Git
--
git remote -v
git remote rm origin
git remote add origin git@github.com:rockstardevelopments/goldenbyteconsulting-com.herokuapp.com.git
git push -u origin master

git status
git add .
git commit -a -m "New page"
git commit -a -m "Updated page"
git push origin master
git push heroku master