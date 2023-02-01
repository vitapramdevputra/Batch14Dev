//normal world
    //we can create new instance without any parameters 
    //even if we DON't have any constructor.
    //if we don't have any constructor, we can create new instance with empty brackets.
cat sfCat = new cat();
sfCat.name = 'cinamon';
sfCat.color = 'brown';
system.debug(sfCat);


cat c2 = new cat('duman','dark gray');
system.debug(c2);

cat c3 = new cat('fluffykins');
system.debug(c3);